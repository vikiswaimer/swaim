import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'pinned_notes_record.g.dart';

abstract class PinnedNotesRecord
    implements Built<PinnedNotesRecord, PinnedNotesRecordBuilder> {
  static Serializer<PinnedNotesRecord> get serializer =>
      _$pinnedNotesRecordSerializer;

  DocumentReference? get user;

  DocumentReference? get note;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PinnedNotesRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pinnedNotes');

  static Stream<PinnedNotesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PinnedNotesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PinnedNotesRecord._();
  factory PinnedNotesRecord([void Function(PinnedNotesRecordBuilder) updates]) =
      _$PinnedNotesRecord;

  static PinnedNotesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPinnedNotesRecordData({
  DocumentReference? user,
  DocumentReference? note,
}) {
  final firestoreData = serializers.toFirestore(
    PinnedNotesRecord.serializer,
    PinnedNotesRecord(
      (p) => p
        ..user = user
        ..note = note,
    ),
  );

  return firestoreData;
}
