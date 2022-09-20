// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotesRecord> _$notesRecordSerializer = new _$NotesRecordSerializer();

class _$NotesRecordSerializer implements StructuredSerializer<NotesRecord> {
  @override
  final Iterable<Type> types = const [NotesRecord, _$NotesRecord];
  @override
  final String wireName = 'NotesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.labels;
    if (value != null) {
      result
        ..add('labels')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
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
  NotesRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'labels':
          result.labels.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
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

class _$NotesRecord extends NotesRecord {
  @override
  final LatLng? location;
  @override
  final String? description;
  @override
  final DocumentReference<Object?>? user;
  @override
  final String? name;
  @override
  final BuiltList<DocumentReference<Object?>>? labels;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$NotesRecord([void Function(NotesRecordBuilder)? updates]) =>
      (new NotesRecordBuilder()..update(updates))._build();

  _$NotesRecord._(
      {this.location,
      this.description,
      this.user,
      this.name,
      this.labels,
      this.ffRef})
      : super._();

  @override
  NotesRecord rebuild(void Function(NotesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotesRecordBuilder toBuilder() => new NotesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotesRecord &&
        location == other.location &&
        description == other.description &&
        user == other.user &&
        name == other.name &&
        labels == other.labels &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, location.hashCode), description.hashCode),
                    user.hashCode),
                name.hashCode),
            labels.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotesRecord')
          ..add('location', location)
          ..add('description', description)
          ..add('user', user)
          ..add('name', name)
          ..add('labels', labels)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class NotesRecordBuilder implements Builder<NotesRecord, NotesRecordBuilder> {
  _$NotesRecord? _$v;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<DocumentReference<Object?>>? _labels;
  ListBuilder<DocumentReference<Object?>> get labels =>
      _$this._labels ??= new ListBuilder<DocumentReference<Object?>>();
  set labels(ListBuilder<DocumentReference<Object?>>? labels) =>
      _$this._labels = labels;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  NotesRecordBuilder() {
    NotesRecord._initializeBuilder(this);
  }

  NotesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _location = $v.location;
      _description = $v.description;
      _user = $v.user;
      _name = $v.name;
      _labels = $v.labels?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotesRecord;
  }

  @override
  void update(void Function(NotesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotesRecord build() => _build();

  _$NotesRecord _build() {
    _$NotesRecord _$result;
    try {
      _$result = _$v ??
          new _$NotesRecord._(
              location: location,
              description: description,
              user: user,
              name: name,
              labels: _labels?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'labels';
        _labels?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'NotesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
