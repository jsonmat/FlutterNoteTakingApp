// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Note _$NoteFromJson(Map<String, dynamic> json) {
  return _Note.fromJson(json);
}

/// @nodoc
mixin _$Note {
  int get noteId => throw _privateConstructorUsedError;
  String get noteTitle => throw _privateConstructorUsedError;
  String get noteDescription => throw _privateConstructorUsedError;
  int get dateCreated => throw _privateConstructorUsedError;
  int get dateModified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoteCopyWith<Note> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteCopyWith<$Res> {
  factory $NoteCopyWith(Note value, $Res Function(Note) then) =
      _$NoteCopyWithImpl<$Res, Note>;
  @useResult
  $Res call(
      {int noteId,
      String noteTitle,
      String noteDescription,
      int dateCreated,
      int dateModified});
}

/// @nodoc
class _$NoteCopyWithImpl<$Res, $Val extends Note>
    implements $NoteCopyWith<$Res> {
  _$NoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noteId = null,
    Object? noteTitle = null,
    Object? noteDescription = null,
    Object? dateCreated = null,
    Object? dateModified = null,
  }) {
    return _then(_value.copyWith(
      noteId: null == noteId
          ? _value.noteId
          : noteId // ignore: cast_nullable_to_non_nullable
              as int,
      noteTitle: null == noteTitle
          ? _value.noteTitle
          : noteTitle // ignore: cast_nullable_to_non_nullable
              as String,
      noteDescription: null == noteDescription
          ? _value.noteDescription
          : noteDescription // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: null == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as int,
      dateModified: null == dateModified
          ? _value.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoteImplCopyWith<$Res> implements $NoteCopyWith<$Res> {
  factory _$$NoteImplCopyWith(
          _$NoteImpl value, $Res Function(_$NoteImpl) then) =
      __$$NoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int noteId,
      String noteTitle,
      String noteDescription,
      int dateCreated,
      int dateModified});
}

/// @nodoc
class __$$NoteImplCopyWithImpl<$Res>
    extends _$NoteCopyWithImpl<$Res, _$NoteImpl>
    implements _$$NoteImplCopyWith<$Res> {
  __$$NoteImplCopyWithImpl(_$NoteImpl _value, $Res Function(_$NoteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noteId = null,
    Object? noteTitle = null,
    Object? noteDescription = null,
    Object? dateCreated = null,
    Object? dateModified = null,
  }) {
    return _then(_$NoteImpl(
      noteId: null == noteId
          ? _value.noteId
          : noteId // ignore: cast_nullable_to_non_nullable
              as int,
      noteTitle: null == noteTitle
          ? _value.noteTitle
          : noteTitle // ignore: cast_nullable_to_non_nullable
              as String,
      noteDescription: null == noteDescription
          ? _value.noteDescription
          : noteDescription // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: null == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as int,
      dateModified: null == dateModified
          ? _value.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoteImpl with DiagnosticableTreeMixin implements _Note {
  const _$NoteImpl(
      {required this.noteId,
      required this.noteTitle,
      required this.noteDescription,
      required this.dateCreated,
      required this.dateModified});

  factory _$NoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoteImplFromJson(json);

  @override
  final int noteId;
  @override
  final String noteTitle;
  @override
  final String noteDescription;
  @override
  final int dateCreated;
  @override
  final int dateModified;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Note(noteId: $noteId, noteTitle: $noteTitle, noteDescription: $noteDescription, dateCreated: $dateCreated, dateModified: $dateModified)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Note'))
      ..add(DiagnosticsProperty('noteId', noteId))
      ..add(DiagnosticsProperty('noteTitle', noteTitle))
      ..add(DiagnosticsProperty('noteDescription', noteDescription))
      ..add(DiagnosticsProperty('dateCreated', dateCreated))
      ..add(DiagnosticsProperty('dateModified', dateModified));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteImpl &&
            (identical(other.noteId, noteId) || other.noteId == noteId) &&
            (identical(other.noteTitle, noteTitle) ||
                other.noteTitle == noteTitle) &&
            (identical(other.noteDescription, noteDescription) ||
                other.noteDescription == noteDescription) &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated) &&
            (identical(other.dateModified, dateModified) ||
                other.dateModified == dateModified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, noteId, noteTitle,
      noteDescription, dateCreated, dateModified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteImplCopyWith<_$NoteImpl> get copyWith =>
      __$$NoteImplCopyWithImpl<_$NoteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoteImplToJson(
      this,
    );
  }
}

abstract class _Note implements Note {
  const factory _Note(
      {required final int noteId,
      required final String noteTitle,
      required final String noteDescription,
      required final int dateCreated,
      required final int dateModified}) = _$NoteImpl;

  factory _Note.fromJson(Map<String, dynamic> json) = _$NoteImpl.fromJson;

  @override
  int get noteId;
  @override
  String get noteTitle;
  @override
  String get noteDescription;
  @override
  int get dateCreated;
  @override
  int get dateModified;
  @override
  @JsonKey(ignore: true)
  _$$NoteImplCopyWith<_$NoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
