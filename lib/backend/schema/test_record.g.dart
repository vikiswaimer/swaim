// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TestRecord> _$testRecordSerializer = new _$TestRecordSerializer();

class _$TestRecordSerializer implements StructuredSerializer<TestRecord> {
  @override
  final Iterable<Type> types = const [TestRecord, _$TestRecord];
  @override
  final String wireName = 'TestRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TestRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.city;
    if (value != null) {
      result
        ..add('city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.country;
    if (value != null) {
      result
        ..add('country')
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
    value = object.workingHours;
    if (value != null) {
      result
        ..add('working_hours')
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
    value = object.website;
    if (value != null) {
      result
        ..add('website')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  TestRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TestRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'working_hours':
          result.workingHours = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'picture':
          result.picture = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'website':
          result.website = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$TestRecord extends TestRecord {
  @override
  final String? city;
  @override
  final String? country;
  @override
  final LatLng? location;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? workingHours;
  @override
  final String? picture;
  @override
  final String? website;
  @override
  final DocumentReference<Object?>? category;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TestRecord([void Function(TestRecordBuilder)? updates]) =>
      (new TestRecordBuilder()..update(updates))._build();

  _$TestRecord._(
      {this.city,
      this.country,
      this.location,
      this.title,
      this.description,
      this.workingHours,
      this.picture,
      this.website,
      this.category,
      this.ffRef})
      : super._();

  @override
  TestRecord rebuild(void Function(TestRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TestRecordBuilder toBuilder() => new TestRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TestRecord &&
        city == other.city &&
        country == other.country &&
        location == other.location &&
        title == other.title &&
        description == other.description &&
        workingHours == other.workingHours &&
        picture == other.picture &&
        website == other.website &&
        category == other.category &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, city.hashCode),
                                        country.hashCode),
                                    location.hashCode),
                                title.hashCode),
                            description.hashCode),
                        workingHours.hashCode),
                    picture.hashCode),
                website.hashCode),
            category.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TestRecord')
          ..add('city', city)
          ..add('country', country)
          ..add('location', location)
          ..add('title', title)
          ..add('description', description)
          ..add('workingHours', workingHours)
          ..add('picture', picture)
          ..add('website', website)
          ..add('category', category)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TestRecordBuilder implements Builder<TestRecord, TestRecordBuilder> {
  _$TestRecord? _$v;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _workingHours;
  String? get workingHours => _$this._workingHours;
  set workingHours(String? workingHours) => _$this._workingHours = workingHours;

  String? _picture;
  String? get picture => _$this._picture;
  set picture(String? picture) => _$this._picture = picture;

  String? _website;
  String? get website => _$this._website;
  set website(String? website) => _$this._website = website;

  DocumentReference<Object?>? _category;
  DocumentReference<Object?>? get category => _$this._category;
  set category(DocumentReference<Object?>? category) =>
      _$this._category = category;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TestRecordBuilder() {
    TestRecord._initializeBuilder(this);
  }

  TestRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _city = $v.city;
      _country = $v.country;
      _location = $v.location;
      _title = $v.title;
      _description = $v.description;
      _workingHours = $v.workingHours;
      _picture = $v.picture;
      _website = $v.website;
      _category = $v.category;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TestRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TestRecord;
  }

  @override
  void update(void Function(TestRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TestRecord build() => _build();

  _$TestRecord _build() {
    final _$result = _$v ??
        new _$TestRecord._(
            city: city,
            country: country,
            location: location,
            title: title,
            description: description,
            workingHours: workingHours,
            picture: picture,
            website: website,
            category: category,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
