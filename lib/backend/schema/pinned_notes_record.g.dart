// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pinned_notes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PinnedNotesRecord> _$pinnedNotesRecordSerializer =
    new _$PinnedNotesRecordSerializer();

class _$PinnedNotesRecordSerializer
    implements StructuredSerializer<PinnedNotesRecord> {
  @override
  final Iterable<Type> types = const [PinnedNotesRecord, _$PinnedNotesRecord];
  @override
  final String wireName = 'PinnedNotesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PinnedNotesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.note;
    if (value != null) {
      result
        ..add('note')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  PinnedNotesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PinnedNotesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'note':
          result.note = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$PinnedNotesRecord extends PinnedNotesRecord {
  @override
  final DocumentReference<Object?>? user;
  @override
  final DocumentReference<Object?>? note;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PinnedNotesRecord(
          [void Function(PinnedNotesRecordBuilder)? updates]) =>
      (new PinnedNotesRecordBuilder()..update(updates))._build();

  _$PinnedNotesRecord._({this.user, this.note, this.ffRef}) : super._();

  @override
  PinnedNotesRecord rebuild(void Function(PinnedNotesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PinnedNotesRecordBuilder toBuilder() =>
      new PinnedNotesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PinnedNotesRecord &&
        user == other.user &&
        note == other.note &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, user.hashCode), note.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PinnedNotesRecord')
          ..add('user', user)
          ..add('note', note)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PinnedNotesRecordBuilder
    implements Builder<PinnedNotesRecord, PinnedNotesRecordBuilder> {
  _$PinnedNotesRecord? _$v;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  DocumentReference<Object?>? _note;
  DocumentReference<Object?>? get note => _$this._note;
  set note(DocumentReference<Object?>? note) => _$this._note = note;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PinnedNotesRecordBuilder() {
    PinnedNotesRecord._initializeBuilder(this);
  }

  PinnedNotesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _note = $v.note;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PinnedNotesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PinnedNotesRecord;
  }

  @override
  void update(void Function(PinnedNotesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PinnedNotesRecord build() => _build();

  _$PinnedNotesRecord _build() {
    final _$result =
        _$v ?? new _$PinnedNotesRecord._(user: user, note: note, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
