// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_aggregations_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FavoriteAggregationsRecord> _$favoriteAggregationsRecordSerializer =
    new _$FavoriteAggregationsRecordSerializer();

class _$FavoriteAggregationsRecordSerializer
    implements StructuredSerializer<FavoriteAggregationsRecord> {
  @override
  final Iterable<Type> types = const [
    FavoriteAggregationsRecord,
    _$FavoriteAggregationsRecord
  ];
  @override
  final String wireName = 'FavoriteAggregationsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, FavoriteAggregationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.aggregation;
    if (value != null) {
      result
        ..add('aggregation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.userId;
    if (value != null) {
      result
        ..add('userId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.labelRef;
    if (value != null) {
      result
        ..add('labelRef')
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
  FavoriteAggregationsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FavoriteAggregationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'aggregation':
          result.aggregation = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'labelRef':
          result.labelRef = serializers.deserialize(value,
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

class _$FavoriteAggregationsRecord extends FavoriteAggregationsRecord {
  @override
  final DocumentReference<Object?>? aggregation;
  @override
  final DocumentReference<Object?>? userId;
  @override
  final DocumentReference<Object?>? labelRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FavoriteAggregationsRecord(
          [void Function(FavoriteAggregationsRecordBuilder)? updates]) =>
      (new FavoriteAggregationsRecordBuilder()..update(updates))._build();

  _$FavoriteAggregationsRecord._(
      {this.aggregation, this.userId, this.labelRef, this.ffRef})
      : super._();

  @override
  FavoriteAggregationsRecord rebuild(
          void Function(FavoriteAggregationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FavoriteAggregationsRecordBuilder toBuilder() =>
      new FavoriteAggregationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FavoriteAggregationsRecord &&
        aggregation == other.aggregation &&
        userId == other.userId &&
        labelRef == other.labelRef &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, aggregation.hashCode), userId.hashCode),
            labelRef.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FavoriteAggregationsRecord')
          ..add('aggregation', aggregation)
          ..add('userId', userId)
          ..add('labelRef', labelRef)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FavoriteAggregationsRecordBuilder
    implements
        Builder<FavoriteAggregationsRecord, FavoriteAggregationsRecordBuilder> {
  _$FavoriteAggregationsRecord? _$v;

  DocumentReference<Object?>? _aggregation;
  DocumentReference<Object?>? get aggregation => _$this._aggregation;
  set aggregation(DocumentReference<Object?>? aggregation) =>
      _$this._aggregation = aggregation;

  DocumentReference<Object?>? _userId;
  DocumentReference<Object?>? get userId => _$this._userId;
  set userId(DocumentReference<Object?>? userId) => _$this._userId = userId;

  DocumentReference<Object?>? _labelRef;
  DocumentReference<Object?>? get labelRef => _$this._labelRef;
  set labelRef(DocumentReference<Object?>? labelRef) =>
      _$this._labelRef = labelRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FavoriteAggregationsRecordBuilder() {
    FavoriteAggregationsRecord._initializeBuilder(this);
  }

  FavoriteAggregationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _aggregation = $v.aggregation;
      _userId = $v.userId;
      _labelRef = $v.labelRef;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FavoriteAggregationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FavoriteAggregationsRecord;
  }

  @override
  void update(void Function(FavoriteAggregationsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FavoriteAggregationsRecord build() => _build();

  _$FavoriteAggregationsRecord _build() {
    final _$result = _$v ??
        new _$FavoriteAggregationsRecord._(
            aggregation: aggregation,
            userId: userId,
            labelRef: labelRef,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
