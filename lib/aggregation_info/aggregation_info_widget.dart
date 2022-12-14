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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

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
    context.watch<FFAppState>();

    return StreamBuilder<AggregationsRecord>(
      stream: AggregationsRecord.getDocument(widget.aggregation!),
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
        final aggregationInfoAggregationsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
          endDrawer: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Drawer(
              elevation: 16,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SelectionArea(
                                  child: Text(
                                'INFORMATION',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              )),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 15,
                                  borderWidth: 1,
                                  buttonSize: 40,
                                  icon: Icon(
                                    Icons.chevron_right_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .yellowSwaim,
                                    size: 24,
                                  ),
                                  onPressed: () async {
                                    if (scaffoldKey
                                            .currentState!.isDrawerOpen ||
                                        scaffoldKey
                                            .currentState!.isEndDrawerOpen) {
                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                          decoration: BoxDecoration(
                            color: Color(0xFFE0E0E0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SelectionArea(
                                  child: Text(
                                aggregationInfoAggregationsRecord.country!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                    ),
                              )),
                              SelectionArea(
                                  child: Text(
                                ', ',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              )),
                              SelectionArea(
                                  child: Text(
                                aggregationInfoAggregationsRecord.city!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFFA8A8A8),
                                      fontSize: 16,
                                    ),
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child:
                              StreamBuilder<List<FavoriteAggregationsRecord>>(
                            stream: queryFavoriteAggregationsRecord(
                              queryBuilder: (favoriteAggregationsRecord) =>
                                  favoriteAggregationsRecord
                                      .where('userId',
                                          isEqualTo: currentUserReference)
                                      .where('aggregation',
                                          isEqualTo:
                                              aggregationInfoAggregationsRecord
                                                  .reference),
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
                              List<FavoriteAggregationsRecord>
                                  containerFavoriteAggregationsRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the document does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final containerFavoriteAggregationsRecord =
                                  containerFavoriteAggregationsRecordList
                                          .isNotEmpty
                                      ? containerFavoriteAggregationsRecordList
                                          .first
                                      : null;
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Color(0x00FFFFFF),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: StreamBuilder<LabelsRecord>(
                                  stream: LabelsRecord.getDocument(
                                      containerFavoriteAggregationsRecord!
                                          .labelRef!),
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
                                    final textLabelsRecord = snapshot.data!;
                                    return Text(
                                      textLabelsRecord.name!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .yellowSwaim,
                                            fontSize: 16,
                                          ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        if (aggregationInfoAggregationsRecord.source != null &&
                            aggregationInfoAggregationsRecord.source != '')
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Text(
                              aggregationInfoAggregationsRecord.source!,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        if (aggregationInfoAggregationsRecord.contactData !=
                                null &&
                            aggregationInfoAggregationsRecord.contactData != '')
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Text(
                              aggregationInfoAggregationsRecord.contactData!,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: InkWell(
                            onTap: () async {
                              await launchURL(
                                  aggregationInfoAggregationsRecord.website!);
                            },
                            child: Text(
                              aggregationInfoAggregationsRecord.website!,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Text(
                            aggregationInfoAggregationsRecord.workingHours!,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Color(0xFFE0E0E0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 1.01),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 40),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0x00FFFFFF),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 1,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE0E0E0),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (!isWeb)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 6, 0, 0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 40,
                                      icon: Icon(
                                        Icons.ios_share,
                                        color: FlutterFlowTheme.of(context)
                                            .yellowSwaim,
                                        size: 24,
                                      ),
                                      onPressed: () async {
                                        await Share.share(
                                            'swaimoriginalsaved://swaim.com${GoRouter.of(context).location}');
                                      },
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 6, 0, 0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 40,
                                    icon: Icon(
                                      Icons.map_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .yellowSwaim,
                                      size: 24,
                                    ),
                                    onPressed: () async {
                                      context.pushNamed(
                                        'MapPage',
                                        queryParams: {
                                          'swaimLocation': serializeParam(
                                            aggregationInfoAggregationsRecord
                                                .location,
                                            ParamType.LatLng,
                                          ),
                                          'noteLocation': serializeParam(
                                            aggregationInfoAggregationsRecord
                                                .location,
                                            ParamType.LatLng,
                                          ),
                                        }.withoutNulls,
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
                  ),
                ],
              ),
            ),
          ),
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
                color: FlutterFlowTheme.of(context).yellowSwaim,
                size: 30,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              aggregationInfoAggregationsRecord.title!,
              style: FlutterFlowTheme.of(context).title2,
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 20,
                  borderWidth: 0,
                  buttonSize: 40,
                  icon: FaIcon(
                    FontAwesomeIcons.ellipsisV,
                    color: FlutterFlowTheme.of(context).yellowSwaim,
                    size: 20,
                  ),
                  onPressed: () async {
                    scaffoldKey.currentState!.openEndDrawer();
                  },
                ),
              ),
            ],
            centerTitle: false,
            elevation: 0,
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  aggregationInfoAggregationsRecord.picture!,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(1, 10, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      aggregationInfoAggregationsRecord.title!
                                          .maybeHandleOverflow(maxChars: 20),
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                    StreamBuilder<
                                        List<FavoriteAggregationsRecord>>(
                                      stream: queryFavoriteAggregationsRecord(
                                        queryBuilder: (favoriteAggregationsRecord) =>
                                            favoriteAggregationsRecord
                                                .where('userId',
                                                    isEqualTo:
                                                        currentUserReference)
                                                .where('aggregation',
                                                    isEqualTo:
                                                        aggregationInfoAggregationsRecord
                                                            .reference),
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
                                            containerFavoriteAggregationsRecordList =
                                            snapshot.data!;
                                        return Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                          ),
                                          child: Stack(
                                            children: [
                                              if (containerFavoriteAggregationsRecordList
                                                      .length ==
                                                  1)
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 20,
                                                  borderWidth: 0,
                                                  buttonSize: 40,
                                                  icon: Icon(
                                                    Icons.star_rate_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .yellowSwaim,
                                                    size: 24,
                                                  ),
                                                  onPressed: () async {
                                                    if (containerFavoriteAggregationsRecordList
                                                            .length ==
                                                        1) {
                                                      apiResultRemoveAggregation =
                                                          await RemoveAggregationFromFavesCall
                                                              .call(
                                                        favAggregationId: functions
                                                            .getFavAggregationId(
                                                                containerFavoriteAggregationsRecordList
                                                                    .map((e) =>
                                                                        e.reference)
                                                                    .toList()),
                                                      );
                                                    } else {
                                                      apiResultAddAggregation =
                                                          await AddAggregationToFavesCall
                                                              .call(
                                                        aggregationId: functions
                                                            .getEditeNoteId(
                                                                'swaimoriginalsaved://swaim.com${GoRouter.of(context).location}'),
                                                        userId: currentUserUid,
                                                      );
                                                    }

                                                    setState(() {});
                                                  },
                                                ),
                                              if (containerFavoriteAggregationsRecordList
                                                      .length !=
                                                  1)
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 20,
                                                  borderWidth: 0,
                                                  buttonSize: 40,
                                                  icon: Icon(
                                                    Icons.star_outline_rounded,
                                                    color: Color(0xFF747474),
                                                    size: 24,
                                                  ),
                                                  onPressed: () async {
                                                    if (containerFavoriteAggregationsRecordList
                                                            .length ==
                                                        1) {
                                                      apiResultnsu =
                                                          await RemoveAggregationFromFavesCall
                                                              .call(
                                                        favAggregationId: functions
                                                            .getFavAggregationId(
                                                                containerFavoriteAggregationsRecordList
                                                                    .map((e) =>
                                                                        e.reference)
                                                                    .toList()),
                                                      );
                                                    } else {
                                                      apiResult2um =
                                                          await AddAggregationToFavesCall
                                                              .call(
                                                        aggregationId: functions
                                                            .getEditeNoteId(
                                                                'swaimoriginalsaved://swaim.com${GoRouter.of(context).location}'),
                                                        userId: currentUserUid,
                                                      );
                                                    }

                                                    setState(() {});
                                                  },
                                                ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
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
                                        textAlign: TextAlign.justify,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
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
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (aggregationInfoAggregationsRecord.source !=
                                  null &&
                              aggregationInfoAggregationsRecord.source != '')
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 20, 24, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Text(
                                      'Source:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        6, 0, 0, 0),
                                    child: Text(
                                      aggregationInfoAggregationsRecord.source!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 0, 24, 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                          width: 30,
                                          height: 30,
                                          child: SpinKitRipple(
                                            color: Color(0x80E8AA21),
                                            size: 30,
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
                                            'payloadFromAggregation':
                                                serializeParam(
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
                                              transitionType: PageTransitionType
                                                  .rightToLeft,
                                            ),
                                          },
                                        );
                                      },
                                      text: 'Attach to note',
                                      options: FFButtonOptions(
                                        width: 130,
                                        height: 40,
                                        color: FlutterFlowTheme.of(context)
                                            .yellowSwaim,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
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
                                FFButtonWidget(
                                  onPressed: () async {
                                    setState(() {
                                      FFAppState().isSwaimsMode = true;
                                    });

                                    context.pushNamed(
                                      'MapPage',
                                      queryParams: {
                                        'swaimLocation': serializeParam(
                                          aggregationInfoAggregationsRecord
                                              .location,
                                          ParamType.LatLng,
                                        ),
                                        'noteLocation': serializeParam(
                                          aggregationInfoAggregationsRecord
                                              .location,
                                          ParamType.LatLng,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: 'Show on map',
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 40,
                                    color: FlutterFlowTheme.of(context)
                                        .yellowSwaim,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
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
            ],
          ),
        );
      },
    );
  }
}
