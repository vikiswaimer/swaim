import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'aggregation_categories_record.g.dart';

abstract class AggregationCategoriesRecord
    implements
        Built<AggregationCategoriesRecord, AggregationCategoriesRecordBuilder> {
  static Serializer<AggregationCategoriesRecord> get serializer =>
      _$aggregationCategoriesRecordSerializer;

  String? get name;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AggregationCategoriesRecordBuilder builder) =>
      builder..name = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('aggregation_categories');

  static Stream<AggregationCategoriesRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AggregationCategoriesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AggregationCategoriesRecord._();
  factory AggregationCategoriesRecord(
          [void Function(AggregationCategoriesRecordBuilder) updates]) =
      _$AggregationCategoriesRecord;

  static AggregationCategoriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAggregationCategoriesRecordData({
  String? name,
}) {
  final firestoreData = serializers.toFirestore(
    AggregationCategoriesRecord.serializer,
    AggregationCategoriesRecord(
      (a) => a..name = name,
    ),
  );

  return firestoreData;
}
