import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jayson_notes/models/note.dart';


@immutable
abstract class NoteState extends Equatable {}

class NoteLoadingState extends NoteState {
  @override
  List<Object?> get props => [];
}

class NoteLoadedState extends NoteState {
  final List<Note> notes;
  NoteLoadedState(this.notes);
  @override
  List<Object?> get props => [notes];
}

class NoteErrorState extends NoteState {
  final String error;
  NoteErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
