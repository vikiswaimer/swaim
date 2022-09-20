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
  return match.toString().substring(1);
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
