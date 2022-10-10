import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/backend.dart';
import '../components/aggregation_bottom_sheet_widget.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class AggregationsMapPageWidget extends StatefulWidget {
  const AggregationsMapPageWidget({Key? key}) : super(key: key);

  @override
  _AggregationsMapPageWidgetState createState() =>
      _AggregationsMapPageWidgetState();
}

class _AggregationsMapPageWidgetState extends State<AggregationsMapPageWidget> {
  Completer<List<AggregationsRecord>>? _algoliaRequestCompleter;
  TextEditingController? textController;
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Align(
              alignment: AlignmentDirectional(0, 0),
              child: FutureBuilder<List<AggregationsRecord>>(
                future: (_algoliaRequestCompleter ??=
                        Completer<List<AggregationsRecord>>()
                          ..complete(AggregationsRecord.search(
                            term: textController!.text,
                            location: getCurrentUserLocation(
                                defaultLocation:
                                    LatLng(37.4298229, -122.1735655)),
                          )))
                    .future,
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
                  List<AggregationsRecord> googleMapAggregationsRecordList =
                      snapshot.data!;
                  return FlutterFlowGoogleMap(
                    controller: googleMapsController,
                    onCameraIdle: (latLng) =>
                        setState(() => googleMapsCenter = latLng),
                    initialLocation: googleMapsCenter ??=
                        currentUserLocationValue!,
                    markers: googleMapAggregationsRecordList
                        .map(
                          (googleMapAggregationsRecord) => FlutterFlowMarker(
                            googleMapAggregationsRecord.reference.path,
                            googleMapAggregationsRecord.location!,
                            () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: AggregationBottomSheetWidget(
                                      aggregation:
                                          googleMapAggregationsRecord.reference,
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                          ),
                        )
                        .toList(),
                    markerColor: GoogleMarkerColor.orange,
                    mapType: MapType.normal,
                    style: GoogleMapStyle.night,
                    initialZoom: 10,
                    allowInteraction: true,
                    allowZoom: true,
                    showZoomControls: false,
                    showLocation: true,
                    showCompass: false,
                    showMapToolbar: false,
                    showTraffic: false,
                    centerMapOnMarkerTap: true,
                  );
                },
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Container(
                      width: 275,
                      child: TextFormField(
                        controller: textController,
                        onFieldSubmitted: (_) async {
                          setState(() => _algoliaRequestCompleter = null);
                          await waitForAlgoliaRequestCompleter();
                        },
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Find a swaim',
                          hintStyle: FlutterFlowTheme.of(context).bodyText2,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          filled: true,
                          fillColor: Color(0xE7E6E2BA),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(16, 0, 14, 0),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Color(0xFF222235),
                            size: 16,
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Overpass',
                              color: Color(0xFF222235),
                              fontSize: 16,
                              lineHeight: 1,
                            ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future waitForAlgoliaRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _algoliaRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
