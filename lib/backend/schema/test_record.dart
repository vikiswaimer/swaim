import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'test_record.g.dart';

abstract class TestRecord implements Built<TestRecord, TestRecordBuilder> {
  static Serializer<TestRecord> get serializer => _$testRecordSerializer;

  String? get city;

  String? get country;

  LatLng? get location;

  String? get title;

  String? get description;

  @BuiltValueField(wireName: 'working_hours')
  String? get workingHours;

  String? get picture;

  String? get website;

  DocumentReference? get category;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TestRecordBuilder builder) => builder
    ..city = ''
    ..country = ''
    ..title = ''
    ..description = ''
    ..workingHours = ''
    ..picture = ''
    ..website = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('test');

  static Stream<TestRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TestRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TestRecord._();
  factory TestRecord([void Function(TestRecordBuilder) updates]) = _$TestRecord;

  static TestRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTestRecordData({
  String? city,
  String? country,
  LatLng? location,
  String? title,
  String? description,
  String? workingHours,
  String? picture,
  String? website,
  DocumentReference? category,
}) {
  final firestoreData = serializers.toFirestore(
    TestRecord.serializer,
    TestRecord(
      (t) => t
        ..city = city
        ..country = country
        ..location = location
        ..title = title
        ..description = description
        ..workingHours = workingHours
        ..picture = picture
        ..website = website
        ..category = category,
    ),
  );

  return firestoreData;
}
