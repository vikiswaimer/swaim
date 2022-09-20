import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'notes_record.g.dart';

abstract class NotesRecord implements Built<NotesRecord, NotesRecordBuilder> {
  static Serializer<NotesRecord> get serializer => _$notesRecordSerializer;

  LatLng? get location;

  String? get description;

  DocumentReference? get user;

  BuiltList<DocumentReference>? get labels;

  String? get name;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(NotesRecordBuilder builder) => builder
    ..description = ''
    ..labels = ListBuilder()
    ..name = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notes');

  static Stream<NotesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<NotesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static NotesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => NotesRecord(
        (c) => c
          ..location = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..description = snapshot.data['description']
          ..user = safeGet(() => toRef(snapshot.data['user']))
          ..labels = safeGet(
              () => ListBuilder(snapshot.data['labels'].map((s) => toRef(s))))
          ..name = snapshot.data['name']
          ..ffRef = NotesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<NotesRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'notes',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  NotesRecord._();
  factory NotesRecord([void Function(NotesRecordBuilder) updates]) =
      _$NotesRecord;

  static NotesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createNotesRecordData({
  LatLng? location,
  String? description,
  DocumentReference? user,
  String? name,
}) {
  final firestoreData = serializers.toFirestore(
    NotesRecord.serializer,
    NotesRecord(
      (n) => n
        ..location = location
        ..description = description
        ..user = user
        ..labels = null
        ..name = name,
    ),
  );

  return firestoreData;
}
