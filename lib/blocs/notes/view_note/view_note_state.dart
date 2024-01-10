import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jayson_notes/models/note.dart';

@immutable
abstract class ViewNoteState extends Equatable {}

class ViewNoteLoadingState extends ViewNoteState {
  @override
  List<Object?> get props => [];
}

class ViewNoteLoadedState extends ViewNoteState {
  final Note note;
  ViewNoteLoadedState(this.note);
  @override
  List<Object?> get props => [note];
}

class ViewNoteErrorState extends ViewNoteState {
  final String error;
  ViewNoteErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
