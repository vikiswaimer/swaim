import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/popup_widget.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class MapPageWidget extends StatefulWidget {
  const MapPageWidget({
    Key? key,
    this.note,
  }) : super(key: key);

  final DocumentReference? note;

  @override
  _MapPageWidgetState createState() => _MapPageWidgetState();
}

class _MapPageWidgetState extends State<MapPageWidget> {
  ApiCallResponse? apiResult7xm;
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Center(
        child: SizedBox(
          width: 60,
          height: 60,
          child: SpinKitRipple(
            color: Color(0xFF222235),
            size: 60,
          ),
        ),
      );
    }
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Drawer(
          elevation: 16,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 24, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 35, 0, 0),
                      child: Image.asset(
                        'assets/images/Frame_8.png',
                        height: 20,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 15,
                      borderWidth: 1,
                      buttonSize: 30,
                      icon: Icon(
                        Icons.chevron_left,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 15,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 10, 24, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).darkBG,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 28, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notifications',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Overpass',
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                          ),
                    ),
                    Text(
                      'Settings',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Overpass',
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                          ),
                    ),
                    Text(
                      'Contact Us',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Overpass',
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                          ),
                    ),
                    Text(
                      'FAQ',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Overpass',
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                          ),
                    ),
                    InkWell(
                      onTap: () async {
                        await Share.share('https://swaim.com');
                      },
                      child: Text(
                        'Share',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Overpass',
                              fontSize: 18,
                              fontWeight: FontWeight.w200,
                            ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        HapticFeedback.lightImpact();
                      },
                      child: Text(
                        'Rate Us',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Overpass',
                              fontSize: 18,
                              fontWeight: FontWeight.w200,
                            ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        context.pushNamed('LoginAndSignup');
                      },
                      child: Text(
                        'Sign Up/Login',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Overpass',
                              fontSize: 18,
                              fontWeight: FontWeight.w200,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              if (loggedIn)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 10, 24, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).darkBG,
                    ),
                  ),
                ),
              if (loggedIn)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 24, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 14, 0, 0),
                        child: Text(
                          'Signed as ',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Overpass',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200,
                                  ),
                        ),
                      ),
                      Text(
                        currentUserEmail.maybeHandleOverflow(
                          maxChars: 40,
                          replacement: '…',
                        ),
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Overpass',
                              fontSize: 12,
                            ),
                      ),
                    ],
                  ),
                ),
              if (loggedIn)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 6, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      GoRouter.of(context).prepareAuthEvent();
                      await signOut();

                      context.goNamedAuth('WelcomePage', mounted);
                    },
                    child: Text(
                      'Log out',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Overpass',
                            color: Color(0xFFCA235E),
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                          ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          if (loggedIn)
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: StreamBuilder<List<NotesRecord>>(
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
                        width: 60,
                        height: 60,
                        child: SpinKitRipple(
                          color: Color(0xFF222235),
                          size: 60,
                        ),
                      ),
                    );
                  }
                  List<NotesRecord> googleMapNotesRecordList = snapshot.data!;
                  return FlutterFlowGoogleMap(
                    controller: googleMapsController,
                    onCameraIdle: (latLng) =>
                        setState(() => googleMapsCenter = latLng),
                    initialLocation: googleMapsCenter ??=
                        currentUserLocationValue!,
                    markers: googleMapNotesRecordList
                        .map(
                          (googleMapNotesRecord) => FlutterFlowMarker(
                            googleMapNotesRecord.reference.path,
                            googleMapNotesRecord.location!,
                            () async {
                              context.pushNamed(
                                'NoteInfo',
                                queryParams: {
                                  'notes': serializeParam(
                                    googleMapNotesRecord.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            },
                          ),
                        )
                        .toList(),
                    markerColor: GoogleMarkerColor.magenta,
                    mapType: MapType.terrain,
                    style: GoogleMapStyle.retro,
                    initialZoom: 10,
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
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: FlutterFlowIconButton(
                    borderColor: Color(0xFF222235),
                    borderRadius: 5,
                    borderWidth: 2,
                    buttonSize: 48,
                    fillColor: Color(0xE7E6E2BA),
                    icon: Icon(
                      Icons.menu,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 26,
                    ),
                    onPressed: () async {
                      scaffoldKey.currentState!.openDrawer();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                  child: Text(
                    'Explore your notes',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Overpass',
                          color: FlutterFlowTheme.of(context).primaryColor,
                          fontSize: 28,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, -0.76),
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
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: FutureBuilder<List<LabelsRecord>>(
                        future: queryLabelsRecordOnce(
                          queryBuilder: (labelsRecord) => labelsRecord
                              .where('is_base', isEqualTo: true)
                              .where('name', isNotEqualTo: 'Not set'),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 60,
                                height: 60,
                                child: SpinKitRipple(
                                  color: Color(0xFF222235),
                                  size: 60,
                                ),
                              ),
                            );
                          }
                          List<LabelsRecord> listViewLabelsRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: listViewLabelsRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewLabelsRecord =
                                  listViewLabelsRecordList[listViewIndex];
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                child: InkWell(
                                  onTap: () async {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Filtered by this category',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor: Color(0x00000000),
                                      ),
                                    );
                                    if (FFAppState().filterByLabel.contains(
                                            listViewLabelsRecord.reference) ==
                                        true) {
                                      setState(() => FFAppState()
                                          .filterByLabel
                                          .remove(
                                              listViewLabelsRecord.reference));
                                    } else {
                                      setState(() => FFAppState()
                                          .filterByLabel
                                          .add(listViewLabelsRecord.reference));
                                    }
                                  },
                                  child: Container(
                                    width: 90,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x7F222235),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: FFAppState()
                                                    .filterByLabel
                                                    .contains(
                                                        listViewLabelsRecord
                                                            .reference) ==
                                                true
                                            ? FlutterFlowTheme.of(context)
                                                .background
                                            : FlutterFlowTheme.of(context)
                                                .text2Gray,
                                        width: 2,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          listViewLabelsRecord.name!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Overpass',
                                                fontSize: 12,
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
                    StreamBuilder<List<LabelsRecord>>(
                      stream: queryLabelsRecord(
                        queryBuilder: (labelsRecord) => labelsRecord
                            .where('is_base', isEqualTo: false)
                            .where('userId', isEqualTo: currentUserReference),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: SpinKitRipple(
                                color: Color(0xFF222235),
                                size: 60,
                              ),
                            ),
                          );
                        }
                        List<LabelsRecord> customLabelsLabelsRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: customLabelsLabelsRecordList.length,
                          itemBuilder: (context, customLabelsIndex) {
                            final customLabelsLabelsRecord =
                                customLabelsLabelsRecordList[customLabelsIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                              child: InkWell(
                                onTap: () async {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Filtered by query',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0x00000000),
                                    ),
                                  );
                                  if (FFAppState().filterByLabel.contains(
                                          customLabelsLabelsRecord.reference) ==
                                      true) {
                                    setState(() => FFAppState()
                                        .filterByLabel
                                        .remove(customLabelsLabelsRecord
                                            .reference));
                                  } else {
                                    setState(() => FFAppState()
                                        .filterByLabel
                                        .add(customLabelsLabelsRecord
                                            .reference));
                                  }
                                },
                                onLongPress: () async {
                                  var confirmDialogResponse = await showDialog<
                                          bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Delete this label'),
                                            content: Text(
                                                'Do you want to delete this label?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('No'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Yes'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                                  if (confirmDialogResponse) {
                                    apiResult7xm = await RemoveLabelCall.call(
                                      labelId: functions.getLabelId(
                                          customLabelsLabelsRecord.reference),
                                    );
                                  } else {
                                    Navigator.pop(context);
                                  }

                                  setState(() {});
                                },
                                child: Container(
                                  width: 90,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Color(0x7F222235),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      width: 3,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 0),
                                          child: Text(
                                            customLabelsLabelsRecord.name!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Overpass',
                                                  fontSize: 12,
                                                ),
                                          ),
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(6, 2, 0, 2),
                      child: InkWell(
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: Container(
                                  height: 250,
                                  child: PopupWidget(),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: Container(
                          width: 60,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).background,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x7F222235),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).background,
                              width: 3,
                            ),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 24,
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
    );
  }
}
