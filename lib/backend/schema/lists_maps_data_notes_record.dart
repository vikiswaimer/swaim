import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'lists_maps_data_notes_record.g.dart';

abstract class ListsMapsDataNotesRecord
    implements
        Built<ListsMapsDataNotesRecord, ListsMapsDataNotesRecordBuilder> {
  static Serializer<ListsMapsDataNotesRecord> get serializer =>
      _$listsMapsDataNotesRecordSerializer;

  @nullable
  String get name;

  @nullable
  LatLng get location;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  String get description;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ListsMapsDataNotesRecordBuilder builder) =>
      builder
        ..name = ''
        ..description = ''
        ..uid = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('listsMapsDataNotes');

  static Stream<ListsMapsDataNotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ListsMapsDataNotesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static ListsMapsDataNotesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ListsMapsDataNotesRecord(
        (c) => c
          ..name = snapshot.data['name']
          ..location = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..createdAt = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['created_at']))
          ..description = snapshot.data['description']
          ..uid = snapshot.data['uid']
          ..reference =
              ListsMapsDataNotesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ListsMapsDataNotesRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'listsMapsDataNotes',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  ListsMapsDataNotesRecord._();
  factory ListsMapsDataNotesRecord(
          [void Function(ListsMapsDataNotesRecordBuilder) updates]) =
      _$ListsMapsDataNotesRecord;

  static ListsMapsDataNotesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createListsMapsDataNotesRecordData({
  String name,
  LatLng location,
  DateTime createdAt,
  String description,
  String uid,
}) =>
    serializers.toFirestore(
        ListsMapsDataNotesRecord.serializer,
        ListsMapsDataNotesRecord((l) => l
          ..name = name
          ..location = location
          ..createdAt = createdAt
          ..description = description
          ..uid = uid));
