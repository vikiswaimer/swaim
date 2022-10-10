import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_list_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteAggregationsListPageWidget extends StatefulWidget {
  const FavoriteAggregationsListPageWidget({Key? key}) : super(key: key);

  @override
  _FavoriteAggregationsListPageWidgetState createState() =>
      _FavoriteAggregationsListPageWidgetState();
}

class _FavoriteAggregationsListPageWidgetState
    extends State<FavoriteAggregationsListPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.chevron_left,
            color: FlutterFlowTheme.of(context).primaryColor,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Swaims',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Montserrat',
                color: FlutterFlowTheme.of(context).primaryColor,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
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
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.82, 0.93),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed('SelectInfoSources');
                              },
                              text: '',
                              icon: Icon(
                                Icons.tune,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 30,
                              ),
                              options: FFButtonOptions(
                                width: 50,
                                height: 40,
                                color: Color(0xFFEEEEEE),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Overpass',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.02, 0.87),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: FlutterFlowIconButton(
                              borderColor: Color(0x80222235),
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 65,
                              fillColor:
                                  FlutterFlowTheme.of(context).tertiaryColor,
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
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.88, 0.92),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed('MapPage');
                              },
                              text: '',
                              icon: FaIcon(
                                FontAwesomeIcons.map,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 28,
                              ),
                              options: FFButtonOptions(
                                width: 50,
                                height: 40,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Overpass',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                borderRadius: BorderRadius.circular(8),
                              ),
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5, 110, 5, 120),
            child: StreamBuilder<List<FavoriteAggregationsRecord>>(
              stream: queryFavoriteAggregationsRecord(
                queryBuilder: (favoriteAggregationsRecord) =>
                    favoriteAggregationsRecord.where('userId',
                        isEqualTo: currentUserReference),
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
                List<FavoriteAggregationsRecord>
                    listViewFavoriteAggregationsRecordList = snapshot.data!;
                if (listViewFavoriteAggregationsRecordList.isEmpty) {
                  return EmptyListWidget();
                }
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewFavoriteAggregationsRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewFavoriteAggregationsRecord =
                        listViewFavoriteAggregationsRecordList[listViewIndex];
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 1),
                      child: InkWell(
                        onTap: () async {
                          context.pushNamed(
                            'FavoriteSwaimPage',
                            queryParams: {
                              'swaimRef': serializeParam(
                                listViewFavoriteAggregationsRecord.reference,
                                ParamType.DocumentReference,
                              ),
                              'favAggregation': serializeParam(
                                listViewFavoriteAggregationsRecord,
                                ParamType.Document,
                              ),
                              'label': serializeParam(
                                listViewFavoriteAggregationsRecord.labelRef,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'favAggregation':
                                  listViewFavoriteAggregationsRecord,
                            },
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
                              StreamBuilder<AggregationsRecord>(
                                stream: AggregationsRecord.getDocument(
                                    listViewFavoriteAggregationsRecord
                                        .aggregation!),
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
                                  final imageAggregationsRecord =
                                      snapshot.data!;
                                  return Image.network(
                                    imageAggregationsRecord.picture!,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: StreamBuilder<AggregationsRecord>(
                                  stream: AggregationsRecord.getDocument(
                                      listViewFavoriteAggregationsRecord
                                          .aggregation!),
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
                                    final textAggregationsRecord =
                                        snapshot.data!;
                                    return Text(
                                      textAggregationsRecord.title!,
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Overpass',
                                            fontSize: 24,
                                          ),
                                    );
                                  },
                                ),
                              ),
                              StreamBuilder<AggregationsRecord>(
                                stream: AggregationsRecord.getDocument(
                                    listViewFavoriteAggregationsRecord
                                        .aggregation!),
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
                                  final containerAggregationsRecord =
                                      snapshot.data!;
                                  return Container(
                                    width: 100,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  );
                                },
                              ),
                              StreamBuilder<AggregationsRecord>(
                                stream: AggregationsRecord.getDocument(
                                    listViewFavoriteAggregationsRecord
                                        .aggregation!),
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
                                  final textAggregationsRecord = snapshot.data!;
                                  return Text(
                                    textAggregationsRecord.description!,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  );
                                },
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
