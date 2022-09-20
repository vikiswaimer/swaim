import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AgregateDatatListPageWidget extends StatefulWidget {
  const AgregateDatatListPageWidget({
    Key? key,
    this.aggregations,
  }) : super(key: key);

  final DocumentReference? aggregations;

  @override
  _AgregateDatatListPageWidgetState createState() =>
      _AgregateDatatListPageWidgetState();
}

class _AgregateDatatListPageWidgetState
    extends State<AgregateDatatListPageWidget> {
  TextEditingController? labelSearchFieldController;

  List<AggregationsRecord>? algoliaSearchResults1 = [];
  List<NotesRecord>? algoliaSearchResults2 = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    labelSearchFieldController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(-1, 1),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 90,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1, -1),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 107,
                    decoration: BoxDecoration(),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 35, 0, 0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 50,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    icon: Icon(
                      Icons.menu,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30,
                    ),
                    onPressed: () async {
                      context.pushNamed('BurgerGeneralMenu');
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.59, -0.89),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(90, 0, 20, 120),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 40,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0,
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            offset: Offset(0, 1),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, -0.3),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                          child: TextFormField(
                            controller: labelSearchFieldController,
                            onFieldSubmitted: (_) async {
                              setState(() => algoliaSearchResults1 = null);
                              await AggregationsRecord.search(
                                term: labelSearchFieldController!.text,
                              )
                                  .then((r) => algoliaSearchResults1 = r)
                                  .onError(
                                      (_, __) => algoliaSearchResults1 = [])
                                  .whenComplete(() => setState(() {}));
                            },
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Overpass',
                                    color: Color(0xFF222235),
                                  ),
                              hintText: 'Search for interesting...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
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
                  alignment: AlignmentDirectional(-0.02, 0.87),
                  child: FlutterFlowIconButton(
                    borderColor: Color(0x80222235),
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
                      context.pushNamed('addSwaim');
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.88, 0.92),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('MapPage');
                    },
                    text: '',
                    icon: FaIcon(
                      FontAwesomeIcons.map,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 28,
                    ),
                    options: FFButtonOptions(
                      width: 50,
                      height: 40,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Overpass',
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.89, 0.74),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('AgregateDataModeButton pressed ...');
                    },
                    text: 'Interest Mode',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Overpass',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.82, 0.93),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('SelectInfoSources');
                    },
                    text: '',
                    icon: Icon(
                      Icons.tune,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 30,
                    ),
                    options: FFButtonOptions(
                      width: 50,
                      height: 40,
                      color: Color(0xFFEEEEEE),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Overpass',
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.84, -0.92),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 50,
                    icon: Icon(
                      Icons.location_searching,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 30,
                    ),
                    onPressed: () async {
                      setState(() => algoliaSearchResults2 = null);
                      await NotesRecord.search(
                        term: labelSearchFieldController!.text,
                      )
                          .then((r) => algoliaSearchResults2 = r)
                          .onError((_, __) => algoliaSearchResults2 = [])
                          .whenComplete(() => setState(() {}));
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5, 110, 5, 120),
            child: StreamBuilder<List<AggregationsRecord>>(
              stream: queryAggregationsRecord(),
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
                List<AggregationsRecord> listViewAggregationsRecordList =
                    snapshot.data!;
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewAggregationsRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewAggregationsRecord =
                        listViewAggregationsRecordList[listViewIndex];
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 1),
                      child: InkWell(
                        onTap: () async {
                          context.pushNamed(
                            'AggregationInfo',
                            queryParams: {
                              'aggregation': serializeParam(
                                  listViewAggregationsRecord.reference,
                                  ParamType.DocumentReference),
                            }.withoutNulls,
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 460,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.network(
                                'https://picsum.photos/seed/330/600',
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Text(
                                  listViewAggregationsRecord.title!,
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Overpass',
                                        fontSize: 24,
                                      ),
                                ),
                              ),
                              StreamBuilder<CountriesRecord>(
                                stream: CountriesRecord.getDocument(
                                    listViewAggregationsRecord.country!),
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
                                  final containerCountriesRecord =
                                      snapshot.data!;
                                  return Container(
                                    width: 100,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 5),
                                      child: Text(
                                        containerCountriesRecord.name!,
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Overpass',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .background,
                                            ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Text(
                                listViewAggregationsRecord.description!,
                                style: FlutterFlowTheme.of(context).bodyText1,
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
    );
  }
}
