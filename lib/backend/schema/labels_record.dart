import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'labels_record.g.dart';

abstract class LabelsRecord
    implements Built<LabelsRecord, LabelsRecordBuilder> {
  static Serializer<LabelsRecord> get serializer => _$labelsRecordSerializer;

  String? get name;

  DocumentReference? get userId;

  @BuiltValueField(wireName: 'is_base')
  bool? get isBase;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(LabelsRecordBuilder builder) => builder
    ..name = ''
    ..isBase = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('labels');

  static Stream<LabelsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<LabelsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  LabelsRecord._();
  factory LabelsRecord([void Function(LabelsRecordBuilder) updates]) =
      _$LabelsRecord;

  static LabelsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createLabelsRecordData({
  String? name,
  DocumentReference? userId,
  bool? isBase,
}) {
  final firestoreData = serializers.toFirestore(
    LabelsRecord.serializer,
    LabelsRecord(
      (l) => l
        ..name = name
        ..userId = userId
        ..isBase = isBase,
    ),
  );

  return firestoreData;
}
