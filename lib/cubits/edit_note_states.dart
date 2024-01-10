import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:jayson_notes/models/note.dart';

part 'edit_note_states.freezed.dart';

@freezed
class EditNoteState with _$EditNoteState {
  const factory EditNoteState.initial() = _Initial;
  const factory EditNoteState.loading() = _Loading;
  const factory EditNoteState.success(Note note) = _Success;
  const factory EditNoteState.error(String errorMessage) = _Error;
}
