import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jayson_notes/apis/note_service.dart';
import 'package:jayson_notes/blocs/navigation/nav_cubit.dart';
import 'package:jayson_notes/blocs/notes/note_bloc.dart';
import 'package:jayson_notes/blocs/notes/note_event.dart';
import 'package:jayson_notes/blocs/notes/note_state.dart';
import 'package:jayson_notes/cubits/edit_note_cubit.dart';
import 'package:jayson_notes/cubits/edit_note_states.dart';
import 'package:jayson_notes/models/note.dart';

class EditNote extends StatefulWidget {
  final int noteId;
  const EditNote({
    super.key,
    required this.noteId,
  });

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  late FToast fToast;
  late Note note;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditNoteCubit(),
      child: BlocBuilder<EditNoteCubit, EditNoteState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              context.read<EditNoteCubit>().fetchNote(widget.noteId);
              return Container();
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: ((errorMessage) => Center(
                  child: Text(errorMessage),
                )),
            success: (note) {
              return loadForm(note);
            },
          );
        },
      ),
    );
  }

  Widget loadForm(Note note) {
    titleController.text = note.noteTitle;
    descriptionController.text = note.noteDescription;

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Title'),
            TextFormField(
              controller: titleController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter the title of your note.";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Description'),
            TextFormField(
              controller: descriptionController,
              minLines: 3,
              maxLines: 4,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter the description of your note.";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      context.read<NavCubit>().goToHome();
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    child: const Text('Update'),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        int ts = DateTime.now().millisecondsSinceEpoch;
                        bool result = await NoteService().updateNote(Note(
                            noteId: note.noteId,
                            noteTitle: titleController.text,
                            noteDescription: descriptionController.text,
                            dateCreated: note.dateCreated,
                            dateModified: ts));
                        FToast().showToast(
                          child: toastResult(result),
                          gravity: ToastGravity.BOTTOM,
                          toastDuration: const Duration(seconds: 2),
                        );
                        if (result) context.read<NavCubit>().goToHome();
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
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
              ? "Your new note has been updated."
              : "Something went wrong when trying to udpate the note."),
        ],
      ),
    );
  }
}
