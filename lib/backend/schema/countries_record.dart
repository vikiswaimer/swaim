import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'countries_record.g.dart';

abstract class CountriesRecord
    implements Built<CountriesRecord, CountriesRecordBuilder> {
  static Serializer<CountriesRecord> get serializer =>
      _$countriesRecordSerializer;

  String? get name;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CountriesRecordBuilder builder) =>
      builder..name = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('countries');

  static Stream<CountriesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CountriesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CountriesRecord._();
  factory CountriesRecord([void Function(CountriesRecordBuilder) updates]) =
      _$CountriesRecord;

  static CountriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCountriesRecordData({
  String? name,
}) {
  final firestoreData = serializers.toFirestore(
    CountriesRecord.serializer,
    CountriesRecord(
      (c) => c..name = name,
    ),
  );

  return firestoreData;
}
