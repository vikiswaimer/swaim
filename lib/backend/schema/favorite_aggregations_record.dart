import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'favorite_aggregations_record.g.dart';

abstract class FavoriteAggregationsRecord
    implements
        Built<FavoriteAggregationsRecord, FavoriteAggregationsRecordBuilder> {
  static Serializer<FavoriteAggregationsRecord> get serializer =>
      _$favoriteAggregationsRecordSerializer;

  DocumentReference? get aggregation;

  DocumentReference? get userId;

  DocumentReference? get labelRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FavoriteAggregationsRecordBuilder builder) =>
      builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('favorite_aggregations');

  static Stream<FavoriteAggregationsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FavoriteAggregationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FavoriteAggregationsRecord._();
  factory FavoriteAggregationsRecord(
          [void Function(FavoriteAggregationsRecordBuilder) updates]) =
      _$FavoriteAggregationsRecord;

  static FavoriteAggregationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFavoriteAggregationsRecordData({
  DocumentReference? aggregation,
  DocumentReference? userId,
  DocumentReference? labelRef,
}) {
  final firestoreData = serializers.toFirestore(
    FavoriteAggregationsRecord.serializer,
    FavoriteAggregationsRecord(
      (f) => f
        ..aggregation = aggregation
        ..userId = userId
        ..labelRef = labelRef,
    ),
  );

  return firestoreData;
}
