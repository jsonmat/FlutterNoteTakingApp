import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jayson_notes/apis/note_service.dart';
import 'package:jayson_notes/blocs/navigation/nav_cubit.dart';
import 'package:jayson_notes/blocs/notes/note_bloc.dart';
import 'package:jayson_notes/blocs/notes/note_event.dart';
import 'package:jayson_notes/blocs/notes/note_state.dart';
import 'package:jayson_notes/screens/notes_add.dart';
import 'package:jayson_notes/screens/notes_edit.dart';
import 'package:jayson_notes/screens/notes_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/note.dart';

int selectedNoteId = 0;
List screens = [
  const NotesList(),
  const AddNote(),
  ViewNote(noteId: selectedNoteId),
  EditNote(noteId: selectedNoteId),
];
List<Note> notesList = [];

class NotesHome extends StatelessWidget {
  const NotesHome({super.key});

  @override
  Widget build(BuildContext context) {
    List screenNames = ["My Notes", "Add Note", "View Note", "Edit Note"];
    return Scaffold(
      appBar:
          AppBar(title: BlocBuilder<NavCubit, int>(builder: (context, index) {
        return Text(screenNames[index]);
      })),
      body: BlocBuilder<NavCubit, int>(
        builder: (context, index) {
          return screens[index];
        },
      ),
      floatingActionButton:
          BlocBuilder<NavCubit, int>(builder: (context, index) {
        return Visibility(
          visible: index == 0,
          child: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => context.read<NavCubit>().goToAddNote(),
          ),
        );
      }),
    );
  }
}

class NotesList extends StatefulWidget {
  const NotesList({
    super.key,
  });

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      bool showTip = prefs.getBool('showTip') ?? true;
      if (showTip) _showTip();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteBloc(
        NoteService(),
      )..add(LoadNoteEvent()),
      child: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          if (state is NoteLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is NoteErrorState) {
            return Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Something went wrong."),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () =>
                        context.read<NoteBloc>().add(LoadNoteEvent()),
                    child: const Text('Retry'))
              ],
            ));
          }
          if (state is NoteLoadedState) {
            notesList = state.notes;
            if (notesList.isEmpty) {
              return const Center(
                  child: Text("You have no notes yet. Add one!"));
            }
            return ListView.builder(
                itemCount: notesList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: GestureDetector(
                        onTap: () {
                          selectedNoteId = notesList[index].noteId;
                          screens = [
                            const NotesList(),
                            const AddNote(),
                            ViewNote(noteId: selectedNoteId),
                            EditNote(noteId: selectedNoteId)
                          ];
                          context.read<NavCubit>().goToViewNote();
                        },
                        child: getSlidable(notesList[index], context, index)),
                  );
                });
          }

          return Container();
        },
      ),
    );
  }

  Widget getSlidable(Note note, BuildContext context, int index) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (c) async {
              bool result = await NoteService().deleteNote(note.noteId);
              FToast().showToast(
                child: toastResult(result),
                gravity: ToastGravity.BOTTOM,
                toastDuration: const Duration(seconds: 2),
              );
              context.read<NoteBloc>().add(LoadNoteEvent());
              // if (result) notesList.removeAt(index);
            },
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Archive',
          ),
          SlidableAction(
            onPressed: (c) {
              selectedNoteId = notesList[index].noteId;
              screens = [
                const NotesList(),
                const AddNote(),
                ViewNote(noteId: selectedNoteId),
                EditNote(noteId: selectedNoteId)
              ];
              c.read<NavCubit>().goToEditNote();
            },
            backgroundColor: Colors.orangeAccent,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: Card(
        color: Theme.of(context).primaryColor,
        elevation: 5,
        child: ListTile(
          title: Text(
            note.noteTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            note.noteDescription,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget toastResult(bool result) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: result ? Colors.greenAccent : Colors.redAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          result ? const Icon(Icons.check) : const Icon(Icons.close),
          const SizedBox(
            width: 12.0,
          ),
          Text(result
              ? "Note has been deleted."
              : "Something went wrong when trying to delete the note."),
        ],
      ),
    );
  }

  _showTip() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.deepPurple,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Expanded(
            child: Text(
              "Swipe left to Archive or Edit a note.",
              softWrap: true,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.close,
            ),
            color: Colors.white,
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              prefs.setBool("showTip", false);
              fToast.removeCustomToast();
            },
          )
        ],
      ),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 50),
    );
  }
}
