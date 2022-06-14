import '../add_swaim/add_swaim_widget.dart';
import '../backend/backend.dart';
import '../burger_general_menu/burger_general_menu_widget.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../list_pag/list_pag_widget.dart';
import '../note_info/note_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';

class MapPageWidget extends StatefulWidget {
  const MapPageWidget({
    Key key,
    this.datanotes,
  }) : super(key: key);

  final ListsMapsDataNotesRecord datanotes;

  @override
  _MapPageWidgetState createState() => _MapPageWidgetState();
}

class _MapPageWidgetState extends State<MapPageWidget> {
  LatLng googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  List<ListsMapsDataNotesRecord> simpleSearchResults = [];
  TextEditingController courtSearchFieldController;
  List<ListsMapsDataNotesRecord> algoliaSearchResults = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    courtSearchFieldController = TextEditingController();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
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
    return FutureBuilder<List<ListsMapsDataNotesRecord>>(
      future: ListsMapsDataNotesRecord.search(
        term: '*',
        location: getCurrentUserLocation(
            defaultLocation: LatLng(37.4298229, -122.1735655)),
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
        List<ListsMapsDataNotesRecord> mapPageListsMapsDataNotesRecordList =
            snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: FlutterFlowGoogleMap(
                  controller: googleMapsController,
                  onCameraIdle: (latLng) =>
                      setState(() => googleMapsCenter = latLng),
                  initialLocation: googleMapsCenter ??=
                      LatLng(13.106061, -59.613158),
                  markers: (mapPageListsMapsDataNotesRecordList ?? [])
                      .map(
                        (mapPageListsMapsDataNotesRecord) => FlutterFlowMarker(
                          mapPageListsMapsDataNotesRecord.reference.path,
                          mapPageListsMapsDataNotesRecord.location,
                          () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NoteInfoWidget(),
                              ),
                            );
                          },
                        ),
                      )
                      .toList(),
                  markerColor: GoogleMarkerColor.blue,
                  mapType: MapType.terrain,
                  style: GoogleMapStyle.retro,
                  initialZoom: 14,
                  allowInteraction: true,
                  allowZoom: true,
                  showZoomControls: false,
                  showLocation: true,
                  showCompass: false,
                  showMapToolbar: false,
                  showTraffic: false,
                  centerMapOnMarkerTap: true,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, -1),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 107,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0x7AD6D6D6), Color(0x8FD4A03B)],
                      stops: [1, 1],
                      begin: AlignmentDirectional(0.14, -1),
                      end: AlignmentDirectional(-0.14, 1),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.74, -0.88),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(90, 0, 20, 0),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(0x34000000),
                          offset: Offset(0, 1),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).grayLines,
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, -0.3),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                        child: TextFormField(
                          controller: courtSearchFieldController,
                          onFieldSubmitted: (_) async {
                            await queryListsMapsDataNotesRecordOnce()
                                .then(
                                  (records) => simpleSearchResults = TextSearch(
                                    records
                                        .map(
                                          (record) => TextSearchItem(
                                              record, [record.name]),
                                        )
                                        .toList(),
                                  )
                                      .search(widget.datanotes.name)
                                      .map((r) => r.object)
                                      .toList(),
                                )
                                .onError((_, __) => simpleSearchResults = [])
                                .whenComplete(() => setState(() {}));
                          },
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Overpass',
                                      color: Color(0xFF222235),
                                    ),
                            hintText: 'Search for interesting...',
                            hintStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Overpass',
                                      color: Color(0xCF222235),
                                    ),
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
                          ),
                          style:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Overpass',
                                    color: Color(0xCF222235),
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 1),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 78,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.86, -0.9),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 60,
                  icon: Icon(
                    Icons.location_searching,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    size: 30,
                  ),
                  onPressed: () async {
                    setState(() => algoliaSearchResults = null);
                    await ListsMapsDataNotesRecord.search(
                      term: widget.datanotes.name,
                      location: widget.datanotes.location,
                    )
                        .then((r) => algoliaSearchResults = r)
                        .onError((_, __) => algoliaSearchResults = [])
                        .whenComplete(() => setState(() {}));
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.8, 0.94),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BurgerGeneralMenuWidget(),
                      ),
                    );
                  },
                  text: '',
                  icon: Icon(
                    Icons.tune,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    size: 15,
                  ),
                  options: FFButtonOptions(
                    width: 60,
                    height: 50,
                    color: Color(0xFFEEEEEE),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Overpass',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Color(0xFFEEEEEE),
                      width: 1,
                    ),
                    borderRadius: 8,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.88, 0.93),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListPagWidget(),
                      ),
                    );
                  },
                  text: '',
                  icon: Icon(
                    Icons.list,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    size: 15,
                  ),
                  options: FFButtonOptions(
                    width: 60,
                    height: 50,
                    color: Color(0xFFEEEEEE),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Overpass',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Color(0xFFEEEEEE),
                      width: 1,
                    ),
                    borderRadius: 8,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.92, -0.89),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BurgerGeneralMenuWidget(),
                      ),
                    );
                  },
                  text: '',
                  icon: Icon(
                    Icons.menu,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    size: 15,
                  ),
                  options: FFButtonOptions(
                    width: 60,
                    height: 50,
                    color: Color(0xFFEEEEEE),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Overpass',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Color(0xFFEEEEEE),
                      width: 1,
                    ),
                    borderRadius: 8,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.02, 0.87),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 65,
                  fillColor: FlutterFlowTheme.of(context).tertiaryColor,
                  icon: Icon(
                    Icons.add_box_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        duration: Duration(milliseconds: 300),
                        reverseDuration: Duration(milliseconds: 300),
                        child: AddSwaimWidget(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
