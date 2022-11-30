import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _isGuideVisible = prefs.getBool('ff_isGuideVisible') ?? _isGuideVisible;
  }

  late SharedPreferences prefs;

  String noteName = '';

  List<DocumentReference> filterByLabel = [];

  DocumentReference? labelInAddSwaim;

  DocumentReference? labelForSwaim;

  List<DocumentReference> searchResults = [];

  DocumentReference? firstSearchREsult;

  DocumentReference? labelInEditSwaim;

  bool isSwaimsMode = false;

  bool isSearchOnMapEnabled = false;

  String searchInputValue = '';

  bool isSearchOnNotesListEnabled = false;

  List<DocumentReference> selectedSwaimsCategoriesInFilter = [];

  bool isSettingsOpened = false;

  bool isSearchModeOnSwaimsEnabled = false;

  bool _isGuideVisible = true;
  bool get isGuideVisible => _isGuideVisible;
  set isGuideVisible(bool _value) {
    _isGuideVisible = _value;
    prefs.setBool('ff_isGuideVisible', _value);
  }

  bool isCodeSent = false;

  String citySearch = 'Warsaw';

  String countrySearch = 'Poland';
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
