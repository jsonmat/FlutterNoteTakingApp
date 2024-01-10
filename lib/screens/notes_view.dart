import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayson_notes/apis/note_service.dart';
import 'package:jayson_notes/blocs/navigation/nav_cubit.dart';
import 'package:jayson_notes/blocs/notes/view_note/view_note_bloc.dart';
import 'package:jayson_notes/blocs/notes/view_note/view_note_event.dart';
import 'package:jayson_notes/blocs/notes/view_note/view_note_state.dart';
import 'package:jayson_notes/models/note.dart';

class ViewNote extends StatefulWidget {
  final int noteId;
  const ViewNote({
    super.key,
    required this.noteId,
  });

  @override
  State<ViewNote> createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ViewNoteBloc(NoteService(), widget.noteId)..add(ViewLoadNoteEvent()),
      child: BlocBuilder<ViewNoteBloc, ViewNoteState>(
        builder: (context, state) {
          if (state is ViewNoteLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ViewNoteErrorState) {
            return Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Failed to load note."),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () => context.read<NavCubit>().goToHome(),
                    child: const Text("Back to Home"))
              ],
            ));
          }
          if (state is ViewNoteLoadedState) {
            Note note = state.note;

            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Title",
                    style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    note.noteTitle,
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Description",
                    style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    note.noteDescription,
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        onPressed: () => context.read<NavCubit>().goToHome(),
                        child: const Text("Back to Home")),
                  ),
                ],
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
