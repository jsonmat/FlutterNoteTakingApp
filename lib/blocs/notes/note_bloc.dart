import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayson_notes/apis/note_service.dart';

import 'note_event.dart';
import 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteService _noteRepository;

  NoteBloc(this._noteRepository) : super(NoteLoadingState()) {
    on<LoadNoteEvent>((event, emit) async {
      emit(NoteLoadingState());
      try {
        final notes = await _noteRepository.fetchNotes();
        emit(NoteLoadedState(notes));
      } catch (e) {
        emit(NoteErrorState(e.toString()));
      }
    });
  }
}
