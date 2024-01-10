// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoteImpl _$$NoteImplFromJson(Map<String, dynamic> json) => _$NoteImpl(
      noteId: json['noteId'] as int,
      noteTitle: json['noteTitle'] as String,
      noteDescription: json['noteDescription'] as String,
      dateCreated: json['dateCreated'] as int,
      dateModified: json['dateModified'] as int,
    );

Map<String, dynamic> _$$NoteImplToJson(_$NoteImpl instance) =>
    <String, dynamic>{
      'noteId': instance.noteId,
      'noteTitle': instance.noteTitle,
      'noteDescription': instance.noteDescription,
      'dateCreated': instance.dateCreated,
      'dateModified': instance.dateModified,
    };
