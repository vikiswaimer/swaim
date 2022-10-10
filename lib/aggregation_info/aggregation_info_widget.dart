import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AggregationInfoWidget extends StatefulWidget {
  const AggregationInfoWidget({
    Key? key,
    this.aggregation,
  }) : super(key: key);

  final DocumentReference? aggregation;

  @override
  _AggregationInfoWidgetState createState() => _AggregationInfoWidgetState();
}

class _AggregationInfoWidgetState extends State<AggregationInfoWidget> {
  ApiCallResponse? apiResult2um;
  ApiCallResponse? apiResultnsu;
  ApiCallResponse? apiResultAddAggregation;
  ApiCallResponse? apiResultRemoveAggregation;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AggregationsRecord>(
      stream: AggregationsRecord.getDocument(widget.aggregation!),
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
        final aggregationInfoAggregationsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                context.pushNamed(
                  'AgregateDatatListPage',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.leftToRight,
                    ),
                  },
                );
              },
            ),
            title: Text(
              aggregationInfoAggregationsRecord.title!,
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Montserrat',
                    color: FlutterFlowTheme.of(context).primaryColor,
                    fontSize: 22,
                  ),
            ),
            actions: [
              StreamBuilder<List<FavoriteAggregationsRecord>>(
                stream: queryFavoriteAggregationsRecord(
                  queryBuilder: (favoriteAggregationsRecord) =>
                      favoriteAggregationsRecord
                          .where('userId', isEqualTo: currentUserReference)
                          .where('aggregation',
                              isEqualTo:
                                  aggregationInfoAggregationsRecord.reference),
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
                      containerFavoriteAggregationsRecordList = snapshot.data!;
                  return Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                      child: Stack(
                        children: [
                          if (containerFavoriteAggregationsRecordList.length ==
                              1)
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: Icon(
                                Icons.star_rate_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30,
                              ),
                              onPressed: () async {
                                if (containerFavoriteAggregationsRecordList
                                        .length ==
                                    1) {
                                  apiResultRemoveAggregation =
                                      await RemoveAggregationFromFavesCall.call(
                                    favAggregationId:
                                        functions.getFavAggregationId(
                                            containerFavoriteAggregationsRecordList
                                                .map((e) => e.reference)
                                                .toList()),
                                  );
                                } else {
                                  apiResultAddAggregation =
                                      await AddAggregationToFavesCall.call(
                                    aggregationId: functions.getEditeNoteId(
                                        'swaimoriginalsaved://swaimplayground.com${GoRouter.of(context).location}'),
                                    userId: currentUserUid,
                                  );
                                }

                                setState(() {});
                              },
                            ),
                          if (containerFavoriteAggregationsRecordList.length !=
                              1)
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: Icon(
                                Icons.star_outline_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30,
                              ),
                              onPressed: () async {
                                if (containerFavoriteAggregationsRecordList
                                        .length ==
                                    1) {
                                  apiResultnsu =
                                      await RemoveAggregationFromFavesCall.call(
                                    favAggregationId:
                                        functions.getFavAggregationId(
                                            containerFavoriteAggregationsRecordList
                                                .map((e) => e.reference)
                                                .toList()),
                                  );
                                } else {
                                  apiResult2um =
                                      await AddAggregationToFavesCall.call(
                                    aggregationId: functions.getEditeNoteId(
                                        'swaimoriginalsaved://swaimplayground.com${GoRouter.of(context).location}'),
                                    userId: currentUserUid,
                                  );
                                }

                                setState(() {});
                              },
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
            centerTitle: false,
            elevation: 2,
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 16, 15, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                aggregationInfoAggregationsRecord.picture!,
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: AutoSizeText(
                                    aggregationInfoAggregationsRecord.title!
                                        .maybeHandleOverflow(maxChars: 20),
                                    style: FlutterFlowTheme.of(context).title2,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      aggregationInfoAggregationsRecord
                                          .description!,
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Overpass',
                                            fontSize: 22,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StreamBuilder<List<LabelsRecord>>(
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
                                  width: 60,
                                  height: 60,
                                  child: SpinKitRipple(
                                    color: Color(0xFF222235),
                                    size: 60,
                                  ),
                                ),
                              );
                            }
                            List<LabelsRecord> buttonLabelsRecordList =
                                snapshot.data!;
                            // Return an empty Container when the document does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final buttonLabelsRecord =
                                buttonLabelsRecordList.isNotEmpty
                                    ? buttonLabelsRecordList.first
                                    : null;
                            return FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  'addSwaim',
                                  queryParams: {
                                    'payloadFromAggregation': serializeParam(
                                      widget.aggregation,
                                      ParamType.DocumentReference,
                                    ),
                                    'initialLabel': serializeParam(
                                      buttonLabelsRecord,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'initialLabel': buttonLabelsRecord,
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                    ),
                                  },
                                );
                              },
                              text: 'Attach to note',
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color: FlutterFlowTheme.of(context).background,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Overpass',
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
