import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayson_notes/apis/note_service.dart';
import 'package:jayson_notes/cubits/edit_note_states.dart';
import 'package:jayson_notes/models/note.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(const EditNoteState.initial());

  fetchNote(int noteId) async {
    emit(EditNoteState.loading());

    try {
      Note note = await NoteService().fetchNote(noteId);
      emit(EditNoteState.success(note));
    } catch (e) {
      emit(EditNoteState.error(
          "Something went wrong when trying to load the note."));
    }
  }
}
