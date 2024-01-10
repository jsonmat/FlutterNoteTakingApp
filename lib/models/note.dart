import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'note.freezed.dart';
part 'note.g.dart';

@freezed
class Note with _$Note {
  const factory Note({
    required int noteId,
    required String noteTitle,
    required String noteDescription,
    required int dateCreated,
    required int dateModified,
  }) = _Note;

  factory Note.fromJson(Map<String, Object?> json) => _$NoteFromJson(json);
}
