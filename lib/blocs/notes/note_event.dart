import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class NoteEvent extends Equatable {
  const NoteEvent();
}

class LoadNoteEvent extends NoteEvent {
  @override
  List<Object?> get props => [];
}
