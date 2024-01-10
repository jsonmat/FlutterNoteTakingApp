import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayson_notes/apis/note_service.dart';

import 'view_note_event.dart';
import 'view_note_state.dart';

class ViewNoteBloc extends Bloc<ViewNoteEvent, ViewNoteState> {
  final NoteService _noteRepository;
  final int noteId;

  ViewNoteBloc(this._noteRepository, this.noteId) : super(ViewNoteLoadingState()) {
    on<ViewLoadNoteEvent>((event, emit) async {
      emit(ViewNoteLoadingState());
      try {
        final note = await _noteRepository.fetchNote(noteId);
        emit(ViewNoteLoadedState(note));
      } catch (e) {
        emit(ViewNoteErrorState(e.toString()));
      }
    });
  }
}
