import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
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

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _noteName = '';
  String get noteName => _noteName;
  set noteName(String _value) {
    _noteName = _value;
  }

  List<DocumentReference> _filterByLabel = [];
  List<DocumentReference> get filterByLabel => _filterByLabel;
  set filterByLabel(List<DocumentReference> _value) {
    _filterByLabel = _value;
  }

  void addToFilterByLabel(DocumentReference _value) {
    _filterByLabel.add(_value);
  }

  void removeFromFilterByLabel(DocumentReference _value) {
    _filterByLabel.remove(_value);
  }

  DocumentReference? _labelInAddSwaim;
  DocumentReference? get labelInAddSwaim => _labelInAddSwaim;
  set labelInAddSwaim(DocumentReference? _value) {
    _labelInAddSwaim = _value;
  }

  DocumentReference? _labelForSwaim;
  DocumentReference? get labelForSwaim => _labelForSwaim;
  set labelForSwaim(DocumentReference? _value) {
    _labelForSwaim = _value;
  }

  List<DocumentReference> _searchResults = [];
  List<DocumentReference> get searchResults => _searchResults;
  set searchResults(List<DocumentReference> _value) {
    _searchResults = _value;
  }

  void addToSearchResults(DocumentReference _value) {
    _searchResults.add(_value);
  }

  void removeFromSearchResults(DocumentReference _value) {
    _searchResults.remove(_value);
  }

  DocumentReference? _firstSearchREsult;
  DocumentReference? get firstSearchREsult => _firstSearchREsult;
  set firstSearchREsult(DocumentReference? _value) {
    _firstSearchREsult = _value;
  }

  DocumentReference? _labelInEditSwaim;
  DocumentReference? get labelInEditSwaim => _labelInEditSwaim;
  set labelInEditSwaim(DocumentReference? _value) {
    _labelInEditSwaim = _value;
  }

  bool _isSwaimsMode = false;
  bool get isSwaimsMode => _isSwaimsMode;
  set isSwaimsMode(bool _value) {
    _isSwaimsMode = _value;
  }

  bool _isSearchOnMapEnabled = false;
  bool get isSearchOnMapEnabled => _isSearchOnMapEnabled;
  set isSearchOnMapEnabled(bool _value) {
    _isSearchOnMapEnabled = _value;
  }

  String _searchInputValue = '';
  String get searchInputValue => _searchInputValue;
  set searchInputValue(String _value) {
    _searchInputValue = _value;
  }

  bool _isSearchOnNotesListEnabled = false;
  bool get isSearchOnNotesListEnabled => _isSearchOnNotesListEnabled;
  set isSearchOnNotesListEnabled(bool _value) {
    _isSearchOnNotesListEnabled = _value;
  }

  List<DocumentReference> _selectedSwaimsCategoriesInFilter = [];
  List<DocumentReference> get selectedSwaimsCategoriesInFilter =>
      _selectedSwaimsCategoriesInFilter;
  set selectedSwaimsCategoriesInFilter(List<DocumentReference> _value) {
    _selectedSwaimsCategoriesInFilter = _value;
  }

  void addToSelectedSwaimsCategoriesInFilter(DocumentReference _value) {
    _selectedSwaimsCategoriesInFilter.add(_value);
  }

  void removeFromSelectedSwaimsCategoriesInFilter(DocumentReference _value) {
    _selectedSwaimsCategoriesInFilter.remove(_value);
  }

  bool _isSettingsOpened = false;
  bool get isSettingsOpened => _isSettingsOpened;
  set isSettingsOpened(bool _value) {
    _isSettingsOpened = _value;
  }

  bool _isSearchModeOnSwaimsEnabled = false;
  bool get isSearchModeOnSwaimsEnabled => _isSearchModeOnSwaimsEnabled;
  set isSearchModeOnSwaimsEnabled(bool _value) {
    _isSearchModeOnSwaimsEnabled = _value;
  }

  bool _isGuideVisible = true;
  bool get isGuideVisible => _isGuideVisible;
  set isGuideVisible(bool _value) {
    _isGuideVisible = _value;
    prefs.setBool('ff_isGuideVisible', _value);
  }

  bool _isCodeSent = false;
  bool get isCodeSent => _isCodeSent;
  set isCodeSent(bool _value) {
    _isCodeSent = _value;
  }

  String _citySearch = 'Warsaw';
  String get citySearch => _citySearch;
  set citySearch(String _value) {
    _citySearch = _value;
  }

  String _countrySearch = 'Poland';
  String get countrySearch => _countrySearch;
  set countrySearch(String _value) {
    _countrySearch = _value;
  }
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
