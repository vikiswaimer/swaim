import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/choose_label_widget.dart';
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

class FavoriteSwaimPageWidget extends StatefulWidget {
  const FavoriteSwaimPageWidget({
    Key? key,
    this.favAggregation,
    this.swaimRef,
    this.label,
  }) : super(key: key);

  final FavoriteAggregationsRecord? favAggregation;
  final DocumentReference? swaimRef;
  final DocumentReference? label;

  @override
  _FavoriteSwaimPageWidgetState createState() =>
      _FavoriteSwaimPageWidgetState();
}

class _FavoriteSwaimPageWidgetState extends State<FavoriteSwaimPageWidget> {
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
      stream:
          AggregationsRecord.getDocument(widget.favAggregation!.aggregation!),
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
        final favoriteSwaimPageAggregationsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
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
                  'FavoriteAggregationsListPage',
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
              favoriteSwaimPageAggregationsRecord.title!,
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
                              isEqualTo: widget.favAggregation!.aggregation),
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
                  List<FavoriteAggregationsRecord>
                      containerFavoriteAggregationsRecordList = snapshot.data!;
                  return Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBtnText,
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
                                apiResultRemoveAggregation =
                                    await RemoveAggregationFromFavesCall.call(
                                  favAggregationId:
                                      functions.getFavAggregationId(
                                          containerFavoriteAggregationsRecordList
                                              .map((e) => e.reference)
                                              .toList()),
                                );

                                context.pushNamed(
                                  'FavoriteAggregationsListPage',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.leftToRight,
                                    ),
                                  },
                                );

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
            elevation: 0,
          ),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(15, 16, 15, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              StreamBuilder<AggregationsRecord>(
                                stream: AggregationsRecord.getDocument(
                                    widget.favAggregation!.aggregation!),
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
                                  final imageAggregationsRecord =
                                      snapshot.data!;
                                  return Image.network(
                                    favoriteSwaimPageAggregationsRecord
                                        .picture!,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  StreamBuilder<AggregationsRecord>(
                                    stream: AggregationsRecord.getDocument(
                                        widget.favAggregation!.aggregation!),
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
                                      final textAggregationsRecord =
                                          snapshot.data!;
                                      return AutoSizeText(
                                        textAggregationsRecord.title!
                                            .maybeHandleOverflow(maxChars: 20),
                                        style:
                                            FlutterFlowTheme.of(context).title2,
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: StreamBuilder<AggregationsRecord>(
                                        stream: AggregationsRecord.getDocument(
                                            widget
                                                .favAggregation!.aggregation!),
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
                                          final descriptionTextAggregationsRecord =
                                              snapshot.data!;
                                          return Text(
                                            descriptionTextAggregationsRecord
                                                .description!,
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 22,
                                                ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  StreamBuilder<AggregationCategoriesRecord>(
                                    stream:
                                        AggregationCategoriesRecord.getDocument(
                                            favoriteSwaimPageAggregationsRecord
                                                .category!),
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
                                      final categoryAggregationCategoriesRecord =
                                          snapshot.data!;
                                      return Text(
                                        categoryAggregationCategoriesRecord
                                            .name!,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: StreamBuilder<LabelsRecord>(
                                stream: LabelsRecord.getDocument(
                                    widget.favAggregation!.labelRef!),
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
                                  final containerLabelsRecord = snapshot.data!;
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            context.pushNamed(
                                              'addSwaim',
                                              queryParams: {
                                                'payloadFromAggregation':
                                                    serializeParam(
                                                  favoriteSwaimPageAggregationsRecord
                                                      .reference,
                                                  ParamType.DocumentReference,
                                                ),
                                                'initialLabel': serializeParam(
                                                  containerLabelsRecord,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'initialLabel':
                                                    containerLabelsRecord,
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .rightToLeft,
                                                ),
                                              },
                                            );
                                          },
                                          text: 'Add to note',
                                          options: FFButtonOptions(
                                            width: 130,
                                            height: 40,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.white,
                                                    ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 0, 0),
                                          child: StreamBuilder<LabelsRecord>(
                                            stream: LabelsRecord.getDocument(
                                                widget.label!),
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
                                              final chooseLabeLabelsRecord =
                                                  snapshot.data!;
                                              return Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return Padding(
                                                              padding: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets,
                                                              child:
                                                                  ChooseLabelWidget(
                                                                swaimRef: widget
                                                                    .favAggregation,
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));
                                                      },
                                                      text:
                                                          chooseLabeLabelsRecord
                                                              .name!,
                                                      options: FFButtonOptions(
                                                        width: 130,
                                                        height: 40,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
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
    );
  }
}
