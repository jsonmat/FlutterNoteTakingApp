import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ViewNoteEvent extends Equatable {
  const ViewNoteEvent();
}

class ViewLoadNoteEvent extends ViewNoteEvent {
  @override
  List<Object?> get props => [];
}
