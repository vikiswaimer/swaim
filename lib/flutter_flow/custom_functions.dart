import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

LatLng getInitialMapLocation(LatLng? userLocation) {
  if (userLocation == null ||
      (userLocation.latitude == 0 && userLocation.longitude == 0)) {
    return LatLng(40.8295538, -73.9386429);
  }
  return userLocation;
}

String getEditeNoteId(String path) {
  RegExp exp = RegExp(r'=\S+$');
  String? match = exp.stringMatch(path);
  return match.toString().split("&")[0].substring(1);
}

DocumentReference getLoggedUserId(DocumentReference authUserID) {
  // Add your function code here!
  return authUserID;
}

double getLatitude(LatLng coords) {
  // Add your function code here!
  return coords.latitude;
}

double getLongitude(LatLng coords) {
  // Add your function code here!
  return coords.longitude;
}

String getFavAggregationId(List<DocumentReference> fAggregation) {
  // Add your function code here!
  return fAggregation[0].id;
}

String getFavAggregationIdFromSingleRef(DocumentReference fAggregation) {
  // Add your function code here!
  return fAggregation.id;
}

String? getSwaimLabelName(LabelsRecord swaimLabel) {
  // Add your function code here!
  return swaimLabel.name;
}

String? getAggregationIdFromSwaim(FavoriteAggregationsRecord swaim) {
  // Add your function code here!
  return swaim.aggregation?.id;
}

String getLabelId(DocumentReference label) {
  // Add your function code here!
  return label.id;
}

List<NotesRecord> filterNotesByUserId(
  List<NotesRecord> notes,
  String userId,
) {
  final filteredNotes = <NotesRecord>[];
  for (final note in notes) {
    if (note.user!.id == userId) {
      filteredNotes.add(note);
    }
  }
  return filteredNotes;
}

DocumentReference getFirstSearchResultForAggregations(
    List<DocumentReference> aggregations) {
  // Add your function code here!
  return aggregations[0];
}

String getIdFromAggregation(DocumentReference aggregationRef) {
  // Add your function code here!
  return aggregationRef.id;
}

List<AggregationsRecord> filterAlgoliaResultsByCategories(
  List<AggregationsRecord> data,
  List<AggregationCategoriesRecord> categories,
) {
  // Add your function code here!
  if (categories.length == 0) {
    return data;
  }
  return data
      .where((item) =>
          categories.map((el) => el.reference).contains(item.category))
      .toList();
}

List<NotesRecord> filterNotesFromEmptyLocations(
  List<NotesRecord> notes,
  String val,
) {
  // filter out notes with empty location
  if (val == '') {
    return notes
        .where((note) =>
            note.location?.latitude != 0 && note.location?.longitude != 0)
        .toList();
  }
  return notes
      .where((note) =>
          note.location?.latitude != 0 && note.location?.longitude != 0)
      .where((note) => note.name!.toLowerCase().contains(val.toLowerCase()))
      .toList();
}

bool hasNotEmptyLocation(NotesRecord note) {
  // Add your function code here!
  return note.location?.latitude != 0 && note.location?.longitude != 0;
}

String getNoteId(DocumentReference note) {
  // Add your function code here!
  return note.id;
}

List<AggregationsRecord> filterSwaimsByInputVal(
  List<AggregationsRecord> swaims,
  String val,
) {
  // Add your function code here!
  if (val == '') {
    return swaims;
  }
  return swaims
      .where((swaim) => swaim.title!.toLowerCase().contains(val.toLowerCase()))
      .toList();
}

String dateToString(DateTime date) {
  // Add your function code here!
  DateTime utc = date.toUtc();
  return '${utc.toIso8601String()}';
}

String composeNameAndDate(
  String name,
  String date,
) {
  // Add your function code here!
  return '${name}\n${date}';
}

bool isLocationEmpty(LatLng location) {
  // Add your function code here!
  if (location.latitude == 0 && location.longitude == 0) {
    return true;
  } else {
    return false;
  }
}
