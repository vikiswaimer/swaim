import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'aggregations_record.g.dart';

abstract class AggregationsRecord
    implements Built<AggregationsRecord, AggregationsRecordBuilder> {
  static Serializer<AggregationsRecord> get serializer =>
      _$aggregationsRecordSerializer;

  String? get title;

  String? get description;

  String? get picture;

  LatLng? get location;

  DocumentReference? get country;

  DocumentReference? get category;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AggregationsRecordBuilder builder) => builder
    ..title = ''
    ..description = ''
    ..picture = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('aggregations');

  static Stream<AggregationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AggregationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static AggregationsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      AggregationsRecord(
        (c) => c
          ..title = snapshot.data['title']
          ..description = snapshot.data['description']
          ..picture = snapshot.data['picture']
          ..location = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..country = safeGet(() => toRef(snapshot.data['country']))
          ..category = safeGet(() => toRef(snapshot.data['category']))
          ..ffRef = AggregationsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<AggregationsRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'aggregations',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  AggregationsRecord._();
  factory AggregationsRecord(
          [void Function(AggregationsRecordBuilder) updates]) =
      _$AggregationsRecord;

  static AggregationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAggregationsRecordData({
  String? title,
  String? description,
  String? picture,
  LatLng? location,
  DocumentReference? country,
  DocumentReference? category,
}) {
  final firestoreData = serializers.toFirestore(
    AggregationsRecord.serializer,
    AggregationsRecord(
      (a) => a
        ..title = title
        ..description = description
        ..picture = picture
        ..location = location
        ..country = country
        ..category = category,
    ),
  );

  return firestoreData;
}
