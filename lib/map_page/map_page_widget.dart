import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/aggregation_bottom_sheet_widget.dart';
import '../components/country_select_widget.dart';
import '../components/note_bottom_sheet_widget.dart';
import '../components/popup_widget.dart';
import '../components/user_bottom_sheet_widget.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/lat_lng.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class MapPageWidget extends StatefulWidget {
  const MapPageWidget({
    Key? key,
    this.note,
    this.noteLocation,
    this.swaimLocation,
  }) : super(key: key);

  final DocumentReference? note;
  final LatLng? noteLocation;
  final LatLng? swaimLocation;

  @override
  _MapPageWidgetState createState() => _MapPageWidgetState();
}

class _MapPageWidgetState extends State<MapPageWidget> {
  ApiCallResponse? apiResult7xmggg;
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController? textController;
  LatLng? googleMapsCenter1;
  final googleMapsController1 = Completer<GoogleMapController>();
  LatLng? googleMapsCenter2;
  final googleMapsController2 = Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 30,
            height: 30,
            child: SpinKitRipple(
              color: Color(0x80E8AA21),
              size: 30,
            ),
          ),
        ),
      );
    }

    return Title(
        title: 'MapPage',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          drawer: StreamBuilder<List<NotesRecord>>(
            stream: queryNotesRecord(
              queryBuilder: (notesRecord) => notesRecord
                  .where('user', isEqualTo: currentUserReference)
                  .whereIn('label', FFAppState().filterByLabel),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: SpinKitRipple(
                      color: Color(0x80E8AA21),
                      size: 30,
                    ),
                  ),
                );
              }
              List<NotesRecord> drawerNotesRecordList = snapshot.data!;
              return Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Drawer(
                  elevation: 16,
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 24, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24, 35, 0, 0),
                                        child: Image.asset(
                                          'assets/images/Frame_8.png',
                                          height: 20,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                      if (loggedIn)
                                        InkWell(
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child: Container(
                                                    height: 300,
                                                    child:
                                                        UserBottomSheetWidget(),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(24, 4, 0, 0),
                                                child: Text(
                                                  currentUserEmail
                                                      .maybeHandleOverflow(
                                                    maxChars: 30,
                                                    replacement: '…',
                                                  ),
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Syne',
                                                        fontSize: 14,
                                                      ),
                                                ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 2,
                                                borderWidth: 0,
                                                buttonSize: 24,
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .yellowSwaim,
                                                  size: 14,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 24),
                                  child: Stack(
                                    children: [
                                      if (!FFAppState().isSettingsOpened)
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 30,
                                          icon: FaIcon(
                                            FontAwesomeIcons.ellipsisV,
                                            color: FlutterFlowTheme.of(context)
                                                .yellowSwaim,
                                            size: 18,
                                          ),
                                          onPressed: () async {
                                            FFAppState().update(() {
                                              FFAppState().isSettingsOpened =
                                                  true;
                                            });
                                          },
                                        ),
                                      if (FFAppState().isSettingsOpened)
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 30,
                                          icon: Icon(
                                            Icons.close,
                                            color: FlutterFlowTheme.of(context)
                                                .yellowSwaim,
                                            size: 18,
                                          ),
                                          onPressed: () async {
                                            FFAppState().update(() {
                                              FFAppState().isSettingsOpened =
                                                  false;
                                            });
                                          },
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (!FFAppState().isSettingsOpened)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                decoration: BoxDecoration(),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 10),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () async {
                                                FFAppState().update(() {
                                                  FFAppState().isSwaimsMode =
                                                      false;
                                                });
                                              },
                                              text: 'NOTES',
                                              options: FFButtonOptions(
                                                width: 100,
                                                height: 26,
                                                color: FFAppState().isSwaimsMode
                                                    ? Colors.white
                                                    : Color(0xFFBFBFBF),
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: FFAppState()
                                                              .isSwaimsMode
                                                          ? Color(0xFFBFBFBF)
                                                          : Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                borderSide: BorderSide(
                                                  color: Color(0xFFBFBFBF),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                FFAppState().update(() {
                                                  FFAppState().isSwaimsMode =
                                                      true;
                                                });
                                              },
                                              text: 'SWAIMS',
                                              options: FFButtonOptions(
                                                width: 100,
                                                height: 26,
                                                color: FFAppState().isSwaimsMode
                                                    ? Color(0xFFBFBFBF)
                                                    : Colors.white,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: FFAppState()
                                                              .isSwaimsMode
                                                          ? Colors.white
                                                          : Color(0xFFBFBFBF),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                borderSide: BorderSide(
                                                  color: Color(0xFFBFBFBF),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (FFAppState().isSwaimsMode)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 10),
                                          child: InkWell(
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child:
                                                        CountrySelectWidget(),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFAppState().countrySearch,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .yellowSwaim,
                                                        fontSize: 16,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      if (!FFAppState().isSwaimsMode)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            FutureBuilder<List<LabelsRecord>>(
                                              future: queryLabelsRecordOnce(
                                                queryBuilder: (labelsRecord) =>
                                                    labelsRecord
                                                        .where('is_base',
                                                            isEqualTo: true)
                                                        .where('name',
                                                            isNotEqualTo:
                                                                'Not set'),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 30,
                                                      height: 30,
                                                      child: SpinKitRipple(
                                                        color:
                                                            Color(0x80E8AA21),
                                                        size: 30,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<LabelsRecord>
                                                    baseLabelsLabelsRecordList =
                                                    snapshot.data!;
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      baseLabelsLabelsRecordList
                                                          .length,
                                                  itemBuilder: (context,
                                                      baseLabelsIndex) {
                                                    final baseLabelsLabelsRecord =
                                                        baseLabelsLabelsRecordList[
                                                            baseLabelsIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 4),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Filtered by this category',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  Color(
                                                                      0x00000000),
                                                            ),
                                                          );
                                                          if (FFAppState()
                                                                  .filterByLabel
                                                                  .contains(
                                                                      baseLabelsLabelsRecord
                                                                          .reference) ==
                                                              true) {
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState().removeFromFilterByLabel(
                                                                  baseLabelsLabelsRecord
                                                                      .reference);
                                                            });
                                                          } else {
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState().addToFilterByLabel(
                                                                  baseLabelsLabelsRecord
                                                                      .reference);
                                                            });
                                                          }
                                                        },
                                                        child: Text(
                                                          baseLabelsLabelsRecord
                                                              .name!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FFAppState()
                                                                            .filterByLabel
                                                                            .contains(baseLabelsLabelsRecord
                                                                                .reference) ==
                                                                        true
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .background
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .text2Gray,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                            StreamBuilder<List<LabelsRecord>>(
                                              stream: queryLabelsRecord(
                                                queryBuilder: (labelsRecord) =>
                                                    labelsRecord
                                                        .where('is_base',
                                                            isEqualTo: false)
                                                        .where('userId',
                                                            isEqualTo:
                                                                currentUserReference),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 30,
                                                      height: 30,
                                                      child: SpinKitRipple(
                                                        color:
                                                            Color(0x80E8AA21),
                                                        size: 30,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<LabelsRecord>
                                                    customLabelsLabelsRecordList =
                                                    snapshot.data!;
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      customLabelsLabelsRecordList
                                                          .length,
                                                  itemBuilder: (context,
                                                      customLabelsIndex) {
                                                    final customLabelsLabelsRecord =
                                                        customLabelsLabelsRecordList[
                                                            customLabelsIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 4),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Filtered by query',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  Color(
                                                                      0x00000000),
                                                            ),
                                                          );
                                                          if (FFAppState()
                                                                  .filterByLabel
                                                                  .contains(
                                                                      customLabelsLabelsRecord
                                                                          .reference) ==
                                                              true) {
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState().removeFromFilterByLabel(
                                                                  customLabelsLabelsRecord
                                                                      .reference);
                                                            });
                                                          } else {
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState().addToFilterByLabel(
                                                                  customLabelsLabelsRecord
                                                                      .reference);
                                                            });
                                                          }
                                                        },
                                                        onLongPress: () async {
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'Delete this label'),
                                                                        content:
                                                                            Text('Do you want to delete this label?'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                Text('No'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                Text('Yes'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (confirmDialogResponse) {
                                                            apiResult7xmggg =
                                                                await RemoveLabelCall
                                                                    .call(
                                                              labelId: functions
                                                                  .getLabelId(
                                                                      customLabelsLabelsRecord
                                                                          .reference),
                                                            );
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                  .filterByLabel = [];
                                                            });
                                                          } else {
                                                            Navigator.pop(
                                                                context);
                                                          }

                                                          setState(() {});
                                                        },
                                                        child: Text(
                                                          customLabelsLabelsRecord
                                                              .name!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FFAppState()
                                                                            .filterByLabel
                                                                            .contains(customLabelsLabelsRecord
                                                                                .reference) ==
                                                                        true
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .background
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .text2Gray,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding:
                                                          MediaQuery.of(context)
                                                              .viewInsets,
                                                      child: Container(
                                                        height: 250,
                                                        child: PopupWidget(),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              },
                                              child: Text(
                                                '+ add',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grayIcon,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (FFAppState().isSwaimsMode)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            StreamBuilder<
                                                List<
                                                    AggregationCategoriesRecord>>(
                                              stream:
                                                  queryAggregationCategoriesRecord(),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 30,
                                                      height: 30,
                                                      child: SpinKitRipple(
                                                        color:
                                                            Color(0x80E8AA21),
                                                        size: 30,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<AggregationCategoriesRecord>
                                                    listViewAggregationCategoriesRecordList =
                                                    snapshot.data!;
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewAggregationCategoriesRecordList
                                                          .length,
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewAggregationCategoriesRecord =
                                                        listViewAggregationCategoriesRecordList[
                                                            listViewIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 4),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Filtered by this category',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  Color(
                                                                      0x00000000),
                                                            ),
                                                          );
                                                          if (FFAppState()
                                                                  .selectedSwaimsCategoriesInFilter
                                                                  .contains(
                                                                      listViewAggregationCategoriesRecord
                                                                          .reference) ==
                                                              true) {
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState().removeFromSelectedSwaimsCategoriesInFilter(
                                                                  listViewAggregationCategoriesRecord
                                                                      .reference);
                                                            });
                                                          } else {
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState().addToSelectedSwaimsCategoriesInFilter(
                                                                  listViewAggregationCategoriesRecord
                                                                      .reference);
                                                            });
                                                          }
                                                        },
                                                        child: Text(
                                                          listViewAggregationCategoriesRecord
                                                              .name!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FFAppState()
                                                                            .selectedSwaimsCategoriesInFilter
                                                                            .contains(listViewAggregationCategoriesRecord
                                                                                .reference) ==
                                                                        true
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .background
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .text2Gray,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if (FFAppState().isSettingsOpened)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 28, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 4),
                                        child: InkWell(
                                          onTap: () async {
                                            context.pushNamed('ContactUs');
                                          },
                                          child: Text(
                                            'Contact Us',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xFF808080),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 4),
                                        child: InkWell(
                                          onTap: () async {
                                            context.pushNamed('FAQ');
                                          },
                                          child: Text(
                                            'FAQ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xFF808080),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 4),
                                        child: InkWell(
                                          onTap: () async {
                                            await Share.share(
                                                'https://swaim.co');
                                          },
                                          child: Text(
                                            'Share',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xFF808080),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 4),
                                        child: InkWell(
                                          onTap: () async {
                                            HapticFeedback.lightImpact();
                                            await launchURL(
                                                'https://www.linkedin.com/company/swaim-geonotes/?viewAsMember=true');
                                          },
                                          child: Text(
                                            'Rate Us',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xFF808080),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      if (FFAppState().isGuideVisible)
                        Align(
                          alignment: AlignmentDirectional(0, 1),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 90,
                            decoration: BoxDecoration(
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 1,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).grayDark,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      14, 6, 14, 0),
                                  child: SelectionArea(
                                      child: Text(
                                    'Switch List and Map modes by  button double tap ------>',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFF797979),
                                          fontSize: 16,
                                        ),
                                  )),
                                ),
                                InkWell(
                                  onTap: () async {
                                    FFAppState().update(() {
                                      FFAppState().isGuideVisible = false;
                                    });
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFCCCCCC),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SelectionArea(
                                            child: Text(
                                          'HIDE',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                              ),
                                        )),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.menu,
                color: FlutterFlowTheme.of(context).yellowSwaim,
                size: 30,
              ),
              onPressed: () async {
                scaffoldKey.currentState!.openDrawer();
              },
            ),
            title: Stack(
              children: [
                if (FFAppState().isSearchOnMapEnabled)
                  Align(
                    alignment: AlignmentDirectional(0, -0.98),
                    child: TextFormField(
                      controller: textController,
                      onChanged: (_) => EasyDebounce.debounce(
                        'textController',
                        Duration(milliseconds: 2000),
                        () async {
                          FFAppState().update(() {
                            FFAppState().searchInputValue =
                                textController!.text;
                          });
                        },
                      ),
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Find a swaim...',
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          FFAppState().update(() {
                            FFAppState().isSwaimsMode = false;
                          });
                        },
                        text: 'NOTES',
                        options: FFButtonOptions(
                          width: 100,
                          height: 26,
                          color: FFAppState().isSwaimsMode
                              ? Colors.white
                              : Color(0xFFBFBFBF),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: FFAppState().isSwaimsMode
                                        ? Color(0xFFBFBFBF)
                                        : Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                          borderSide: BorderSide(
                            color: Color(0xFFBFBFBF),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          FFAppState().update(() {
                            FFAppState().isSwaimsMode = true;
                          });
                        },
                        text: 'SWAIMS',
                        options: FFButtonOptions(
                          width: 100,
                          height: 26,
                          color: FFAppState().isSwaimsMode
                              ? Color(0xFFBFBFBF)
                              : Colors.white,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: FFAppState().isSwaimsMode
                                        ? Colors.white
                                        : Color(0xFFBFBFBF),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                          borderSide: BorderSide(
                            color: Color(0xFFBFBFBF),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                child: ToggleIcon(
                  onPressed: () async {
                    setState(() => FFAppState().isSearchOnMapEnabled =
                        !FFAppState().isSearchOnMapEnabled);
                  },
                  value: FFAppState().isSearchOnMapEnabled,
                  onIcon: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).yellowSwaim,
                    size: 20,
                  ),
                  offIcon: Icon(
                    Icons.search,
                    color: FlutterFlowTheme.of(context).yellowSwaim,
                    size: 20,
                  ),
                ),
              ),
            ],
            centerTitle: true,
            elevation: 2,
          ),
          body: Stack(
            children: [
              StreamBuilder<List<AggregationCategoriesRecord>>(
                stream: queryAggregationCategoriesRecord(
                  limit: 20,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: SpinKitRipple(
                          color: Color(0x80E8AA21),
                          size: 30,
                        ),
                      ),
                    );
                  }
                  List<AggregationCategoriesRecord>
                      containerAggregationCategoriesRecordList = snapshot.data!;
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Stack(
                      children: [
                        if (FFAppState().isSwaimsMode)
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 1,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: StreamBuilder<List<AggregationsRecord>>(
                                stream: queryAggregationsRecord(
                                  queryBuilder: (aggregationsRecord) =>
                                      aggregationsRecord
                                          .whereIn(
                                              'category',
                                              FFAppState()
                                                  .selectedSwaimsCategoriesInFilter)
                                          .where('country',
                                              isEqualTo:
                                                  FFAppState().countrySearch),
                                  limit: 20,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: SpinKitRipple(
                                          color: Color(0x80E8AA21),
                                          size: 30,
                                        ),
                                      ),
                                    );
                                  }
                                  List<AggregationsRecord>
                                      googleMapAggregationsRecordList =
                                      snapshot.data!;
                                  return FlutterFlowGoogleMap(
                                    controller: googleMapsController1,
                                    onCameraIdle: (latLng) => setState(
                                        () => googleMapsCenter1 = latLng),
                                    initialLocation: googleMapsCenter1 ??=
                                        widget.swaimLocation != null
                                            ? widget.swaimLocation!
                                            : currentUserLocationValue!,
                                    markers: functions
                                        .filterSwaimsByInputVal(
                                            googleMapAggregationsRecordList
                                                .toList(),
                                            textController!.text)
                                        .map(
                                          (googleMapAggregationsRecord) =>
                                              FlutterFlowMarker(
                                            googleMapAggregationsRecord
                                                .reference.path,
                                            googleMapAggregationsRecord
                                                .location!,
                                            () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child:
                                                        AggregationBottomSheetWidget(
                                                      aggregation:
                                                          googleMapAggregationsRecord
                                                              .reference,
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                          ),
                                        )
                                        .toList(),
                                    markerColor: GoogleMarkerColor.yellow,
                                    mapType: MapType.normal,
                                    style: GoogleMapStyle.silver,
                                    initialZoom: 18,
                                    allowInteraction: true,
                                    allowZoom: true,
                                    showZoomControls: false,
                                    showLocation: false,
                                    showCompass: false,
                                    showMapToolbar: false,
                                    showTraffic: false,
                                    centerMapOnMarkerTap: true,
                                  );
                                },
                              ),
                            ),
                          ),
                        if (!FFAppState().isSwaimsMode)
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 1,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: StreamBuilder<List<NotesRecord>>(
                                stream: queryNotesRecord(
                                  queryBuilder: (notesRecord) => notesRecord
                                      .where('user',
                                          isEqualTo: currentUserReference)
                                      .whereIn(
                                          'label', FFAppState().filterByLabel),
                                  limit: 20,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: SpinKitRipple(
                                          color: Color(0x80E8AA21),
                                          size: 30,
                                        ),
                                      ),
                                    );
                                  }
                                  List<NotesRecord> googleMapNotesRecordList =
                                      snapshot.data!;
                                  return FlutterFlowGoogleMap(
                                    controller: googleMapsController2,
                                    onCameraIdle: (latLng) => setState(
                                        () => googleMapsCenter2 = latLng),
                                    initialLocation: googleMapsCenter2 ??=
                                        widget.noteLocation != null
                                            ? widget.noteLocation!
                                            : currentUserLocationValue!,
                                    markers: functions
                                        .filterNotesFromEmptyLocations(
                                            googleMapNotesRecordList.toList(),
                                            textController!.text)
                                        .map(
                                          (googleMapNotesRecord) =>
                                              FlutterFlowMarker(
                                            googleMapNotesRecord.reference.path,
                                            googleMapNotesRecord.location!,
                                            () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child:
                                                        NoteBottomSheetWidget(
                                                      note: googleMapNotesRecord
                                                          .reference,
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                          ),
                                        )
                                        .toList(),
                                    markerColor: GoogleMarkerColor.magenta,
                                    mapType: MapType.normal,
                                    style: GoogleMapStyle.silver,
                                    initialZoom: 18,
                                    allowInteraction: true,
                                    allowZoom: true,
                                    showZoomControls: false,
                                    showLocation: true,
                                    showCompass: false,
                                    showMapToolbar: true,
                                    showTraffic: false,
                                    centerMapOnMarkerTap: true,
                                  );
                                },
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
              Align(
                alignment: AlignmentDirectional(0.91, 0.85),
                child: Container(
                  width: 80,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Color(0x00EEEEEE),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (FFAppState().isSwaimsMode)
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0x00EEEEEE),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 2),
                                    spreadRadius: 3,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: StreamBuilder<List<LabelsRecord>>(
                                  stream: queryLabelsRecord(
                                    queryBuilder: (labelsRecord) => labelsRecord
                                        .where('name', isEqualTo: 'Not set'),
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: SpinKitRipple(
                                            color: Color(0x80E8AA21),
                                            size: 30,
                                          ),
                                        ),
                                      );
                                    }
                                    List<LabelsRecord>
                                        iconButtonLabelsRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final iconButtonLabelsRecord =
                                        iconButtonLabelsRecordList.isNotEmpty
                                            ? iconButtonLabelsRecordList.first
                                            : null;
                                    return FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 20,
                                      borderWidth: 0,
                                      buttonSize: 40,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      icon: Icon(
                                        Icons.sticky_note_2,
                                        color: Color(0xFF747474),
                                        size: 20,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed('NotesPage');
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (!FFAppState().isSwaimsMode)
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0x00EEEEEE),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 2),
                                    spreadRadius: 3,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: StreamBuilder<List<LabelsRecord>>(
                                  stream: queryLabelsRecord(
                                    queryBuilder: (labelsRecord) => labelsRecord
                                        .where('name', isEqualTo: 'Not set'),
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: SpinKitRipple(
                                            color: Color(0x80E8AA21),
                                            size: 30,
                                          ),
                                        ),
                                      );
                                    }
                                    List<LabelsRecord>
                                        iconButtonLabelsRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final iconButtonLabelsRecord =
                                        iconButtonLabelsRecordList.isNotEmpty
                                            ? iconButtonLabelsRecordList.first
                                            : null;
                                    return FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 20,
                                      borderWidth: 0,
                                      buttonSize: 40,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      icon: Icon(
                                        Icons.sticky_note_2,
                                        color: Color(0xFF747474),
                                        size: 20,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed('NotesPage');
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (!FFAppState().isSwaimsMode)
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color(0x00EEEEEE),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x33000000),
                                  offset: Offset(0, 2),
                                  spreadRadius: 3,
                                )
                              ],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: StreamBuilder<List<LabelsRecord>>(
                                stream: queryLabelsRecord(
                                  queryBuilder: (labelsRecord) => labelsRecord
                                      .where('name', isEqualTo: 'Not set'),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: SpinKitRipple(
                                          color: Color(0x80E8AA21),
                                          size: 30,
                                        ),
                                      ),
                                    );
                                  }
                                  List<LabelsRecord>
                                      iconButtonLabelsRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final iconButtonLabelsRecord =
                                      iconButtonLabelsRecordList.isNotEmpty
                                          ? iconButtonLabelsRecordList.first
                                          : null;
                                  return FlutterFlowIconButton(
                                    borderRadius: 30,
                                    borderWidth: 0,
                                    buttonSize: 60,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    icon: Icon(
                                      Icons.add,
                                      color: Color(0xFF747474),
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      context.pushNamed(
                                        'addSwaim',
                                        queryParams: {
                                          'initialLabel': serializeParam(
                                            iconButtonLabelsRecord,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'initialLabel':
                                              iconButtonLabelsRecord,
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      if (FFAppState().isSwaimsMode)
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color(0x00EEEEEE),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x33000000),
                                  offset: Offset(0, 2),
                                  spreadRadius: 3,
                                )
                              ],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: StreamBuilder<List<LabelsRecord>>(
                                stream: queryLabelsRecord(
                                  queryBuilder: (labelsRecord) => labelsRecord
                                      .where('name', isEqualTo: 'Not set'),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: SpinKitRipple(
                                          color: Color(0x80E8AA21),
                                          size: 30,
                                        ),
                                      ),
                                    );
                                  }
                                  List<LabelsRecord>
                                      iconButtonLabelsRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final iconButtonLabelsRecord =
                                      iconButtonLabelsRecordList.isNotEmpty
                                          ? iconButtonLabelsRecordList.first
                                          : null;
                                  return FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 0,
                                    buttonSize: 60,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    icon: Icon(
                                      Icons.star_border_rounded,
                                      color: Color(0xFF747474),
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      context.pushNamed(
                                          'FavoriteAggregationsListPage');
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              if (FFAppState().isSwaimsMode)
                Align(
                  alignment: AlignmentDirectional(0, -0.97),
                  child: Container(
                    width: double.infinity,
                    height: 30,
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: Builder(
                              builder: (context) {
                                final bbbb = FFAppState()
                                    .selectedSwaimsCategoriesInFilter
                                    .map((e) => e)
                                    .toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: bbbb.length,
                                  itemBuilder: (context, bbbbIndex) {
                                    final bbbbItem = bbbb[bbbbIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6, 2, 6, 2),
                                      child: InkWell(
                                        onTap: () async {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Filtered by this category',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  Color(0x00000000),
                                            ),
                                          );
                                          if (FFAppState()
                                                  .selectedSwaimsCategoriesInFilter
                                                  .contains(bbbbItem) ==
                                              true) {
                                            FFAppState().update(() {
                                              FFAppState()
                                                  .removeFromSelectedSwaimsCategoriesInFilter(
                                                      bbbbItem);
                                            });
                                          } else {
                                            FFAppState().update(() {
                                              FFAppState()
                                                  .addToSelectedSwaimsCategoriesInFilter(
                                                      bbbbItem);
                                            });
                                          }
                                        },
                                        child: Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .background,
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .background,
                                              width: 2,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 0, 0),
                                                child: StreamBuilder<
                                                    AggregationCategoriesRecord>(
                                                  stream:
                                                      AggregationCategoriesRecord
                                                          .getDocument(
                                                              bbbbItem),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 30,
                                                          height: 30,
                                                          child: SpinKitRipple(
                                                            color: Color(
                                                                0x80E8AA21),
                                                            size: 30,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final textAggregationCategoriesRecord =
                                                        snapshot.data!;
                                                    return Text(
                                                      textAggregationCategoriesRecord
                                                          .name!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2,
                                                    );
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 4, 0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  size: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              if (!FFAppState().isSwaimsMode)
                Align(
                  alignment: AlignmentDirectional(0, -0.97),
                  child: Container(
                    width: double.infinity,
                    height: 30,
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: Builder(
                              builder: (context) {
                                final bbbb =
                                    FFAppState().filterByLabel.toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: bbbb.length,
                                  itemBuilder: (context, bbbbIndex) {
                                    final bbbbItem = bbbb[bbbbIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6, 2, 6, 2),
                                      child: InkWell(
                                        onTap: () async {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Filtered by this category',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  Color(0x00000000),
                                            ),
                                          );
                                          if (FFAppState()
                                                  .filterByLabel
                                                  .contains(bbbbItem) ==
                                              true) {
                                            FFAppState().update(() {
                                              FFAppState()
                                                  .removeFromFilterByLabel(
                                                      bbbbItem);
                                            });
                                          } else {
                                            FFAppState().update(() {
                                              FFAppState()
                                                  .addToFilterByLabel(bbbbItem);
                                            });
                                          }
                                        },
                                        child: Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .yellowSwaim,
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .yellowSwaim,
                                              width: 2,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 0, 0),
                                                child:
                                                    StreamBuilder<LabelsRecord>(
                                                  stream:
                                                      LabelsRecord.getDocument(
                                                          bbbbItem),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 30,
                                                          height: 30,
                                                          child: SpinKitRipple(
                                                            color: Color(
                                                                0x80E8AA21),
                                                            size: 30,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final textLabelsRecord =
                                                        snapshot.data!;
                                                    return Text(
                                                      textLabelsRecord.name!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2,
                                                    );
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 4, 0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  size: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ));
  }
}
