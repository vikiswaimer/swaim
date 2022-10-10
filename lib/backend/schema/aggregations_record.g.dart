// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aggregations_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AggregationsRecord> _$aggregationsRecordSerializer =
    new _$AggregationsRecordSerializer();

class _$AggregationsRecordSerializer
    implements StructuredSerializer<AggregationsRecord> {
  @override
  final Iterable<Type> types = const [AggregationsRecord, _$AggregationsRecord];
  @override
  final String wireName = 'AggregationsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AggregationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.picture;
    if (value != null) {
      result
        ..add('picture')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.country;
    if (value != null) {
      result
        ..add('country')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
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
  AggregationsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AggregationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'picture':
          result.picture = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
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

class _$AggregationsRecord extends AggregationsRecord {
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? picture;
  @override
  final LatLng? location;
  @override
  final DocumentReference<Object?>? country;
  @override
  final DocumentReference<Object?>? category;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AggregationsRecord(
          [void Function(AggregationsRecordBuilder)? updates]) =>
      (new AggregationsRecordBuilder()..update(updates))._build();

  _$AggregationsRecord._(
      {this.title,
      this.description,
      this.picture,
      this.location,
      this.country,
      this.category,
      this.ffRef})
      : super._();

  @override
  AggregationsRecord rebuild(
          void Function(AggregationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AggregationsRecordBuilder toBuilder() =>
      new AggregationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AggregationsRecord &&
        title == other.title &&
        description == other.description &&
        picture == other.picture &&
        location == other.location &&
        country == other.country &&
        category == other.category &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, title.hashCode), description.hashCode),
                        picture.hashCode),
                    location.hashCode),
                country.hashCode),
            category.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AggregationsRecord')
          ..add('title', title)
          ..add('description', description)
          ..add('picture', picture)
          ..add('location', location)
          ..add('country', country)
          ..add('category', category)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AggregationsRecordBuilder
    implements Builder<AggregationsRecord, AggregationsRecordBuilder> {
  _$AggregationsRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _picture;
  String? get picture => _$this._picture;
  set picture(String? picture) => _$this._picture = picture;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;

  DocumentReference<Object?>? _country;
  DocumentReference<Object?>? get country => _$this._country;
  set country(DocumentReference<Object?>? country) => _$this._country = country;

  DocumentReference<Object?>? _category;
  DocumentReference<Object?>? get category => _$this._category;
  set category(DocumentReference<Object?>? category) =>
      _$this._category = category;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AggregationsRecordBuilder() {
    AggregationsRecord._initializeBuilder(this);
  }

  AggregationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _picture = $v.picture;
      _location = $v.location;
      _country = $v.country;
      _category = $v.category;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AggregationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AggregationsRecord;
  }

  @override
  void update(void Function(AggregationsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AggregationsRecord build() => _build();

  _$AggregationsRecord _build() {
    final _$result = _$v ??
        new _$AggregationsRecord._(
            title: title,
            description: description,
            picture: picture,
            location: location,
            country: country,
            category: category,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
