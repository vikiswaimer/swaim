import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/country_select_widget.dart';
import '../components/empty_list_widget.dart';
import '../components/popup_widget.dart';
import '../components/user_bottom_sheet_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:text_search/text_search.dart';

class NotesPageWidget extends StatefulWidget {
  const NotesPageWidget({
    Key? key,
    this.notes,
  }) : super(key: key);

  final NotesRecord? notes;

  @override
  _NotesPageWidgetState createState() => _NotesPageWidgetState();
}

class _NotesPageWidgetState extends State<NotesPageWidget> {
  ApiCallResponse? apiResult2um;
  ApiCallResponse? apiResultnsu;
  ApiCallResponse? apiResultAddAggregation;
  ApiCallResponse? apiResultRemoveAggregation;
  ApiCallResponse? apiResultlrl;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<AggregationsRecord> simpleSearchResults2 = [];
  TextEditingController? textController2;
  List<NotesRecord> simpleSearchResults1 = [];
  TextEditingController? textController1;
  ApiCallResponse? apiResult7xmggg;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<AggregationsRecord>>(
      stream: queryAggregationsRecord(
        queryBuilder: (aggregationsRecord) =>
            aggregationsRecord.where('title', isEqualTo: 'null'),
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
        List<AggregationsRecord> notesPageAggregationsRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final notesPageAggregationsRecord =
            notesPageAggregationsRecordList.isNotEmpty
                ? notesPageAggregationsRecordList.first
                : null;
        return Title(
            title: 'NotesPage',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
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
                                                ).then(
                                                    (value) => setState(() {}));
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                24, 4, 0, 0),
                                                    child: Text(
                                                      currentUserEmail
                                                          .maybeHandleOverflow(
                                                        maxChars: 30,
                                                        replacement: '…',
                                                      ),
                                                      maxLines: 2,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily: 'Syne',
                                                            fontSize: 14,
                                                          ),
                                                    ),
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 2,
                                                    borderWidth: 0,
                                                    buttonSize: 24,
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .yellowSwaim,
                                                size: 18,
                                              ),
                                              onPressed: () async {
                                                FFAppState().update(() {
                                                  FFAppState()
                                                      .isSettingsOpened = true;
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .yellowSwaim,
                                                size: 18,
                                              ),
                                              onPressed: () async {
                                                FFAppState().update(() {
                                                  FFAppState()
                                                      .isSettingsOpened = false;
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.8,
                                    decoration: BoxDecoration(),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .isSwaimsMode = false;
                                                    });
                                                  },
                                                  text: 'NOTES',
                                                  options: FFButtonOptions(
                                                    width: 100,
                                                    height: 26,
                                                    color: FFAppState()
                                                            .isSwaimsMode
                                                        ? Colors.white
                                                        : Color(0xFFBFBFBF),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FFAppState()
                                                                  .isSwaimsMode
                                                              ? Color(
                                                                  0xFFBFBFBF)
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
                                                        BorderRadius.circular(
                                                            0),
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .isSwaimsMode = true;
                                                    });
                                                  },
                                                  text: 'SWAIMS',
                                                  options: FFButtonOptions(
                                                    width: 100,
                                                    height: 26,
                                                    color: FFAppState()
                                                            .isSwaimsMode
                                                        ? Color(0xFFBFBFBF)
                                                        : Colors.white,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FFAppState()
                                                                  .isSwaimsMode
                                                              ? Colors.white
                                                              : Color(
                                                                  0xFFBFBFBF),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFBFBFBF),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (FFAppState().isSwaimsMode)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 10),
                                              child: InkWell(
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child:
                                                            CountrySelectWidget(),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      FFAppState()
                                                          .countrySearch,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
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
                                                FutureBuilder<
                                                    List<LabelsRecord>>(
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
                                                            color: Color(
                                                                0x80E8AA21),
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
                                                                  .fromSTEB(0,
                                                                      0, 0, 4),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              ScaffoldMessenger
                                                                      .of(context)
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
                                                                    color: FFAppState().filterByLabel.contains(baseLabelsLabelsRecord.reference) ==
                                                                            true
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .background
                                                                        : FlutterFlowTheme.of(context)
                                                                            .text2Gray,
                                                                    fontSize:
                                                                        18,
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
                                                StreamBuilder<
                                                    List<LabelsRecord>>(
                                                  stream: queryLabelsRecord(
                                                    queryBuilder: (labelsRecord) =>
                                                        labelsRecord
                                                            .where('is_base',
                                                                isEqualTo:
                                                                    false)
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
                                                            color: Color(
                                                                0x80E8AA21),
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
                                                                  .fromSTEB(0,
                                                                      0, 0, 4),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              ScaffoldMessenger
                                                                      .of(context)
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
                                                            onLongPress:
                                                                () async {
                                                              var confirmDialogResponse =
                                                                  await showDialog<
                                                                          bool>(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Delete this label'),
                                                                            content:
                                                                                Text('Do you want to delete this label?'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                child: Text('No'),
                                                                              ),
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                child: Text('Yes'),
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
                                                                    color: FFAppState().filterByLabel.contains(customLabelsLabelsRecord.reference) ==
                                                                            true
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .background
                                                                        : FlutterFlowTheme.of(context)
                                                                            .text2Gray,
                                                                    fontSize:
                                                                        18,
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
                                                              MediaQuery.of(
                                                                      context)
                                                                  .viewInsets,
                                                          child: Container(
                                                            height: 250,
                                                            child:
                                                                PopupWidget(),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  },
                                                  child: Text(
                                                    '+ add',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                            color: Color(
                                                                0x80E8AA21),
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
                                                      itemBuilder: (context,
                                                          listViewIndex) {
                                                        final listViewAggregationCategoriesRecord =
                                                            listViewAggregationCategoriesRecordList[
                                                                listViewIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 4),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              ScaffoldMessenger
                                                                      .of(context)
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
                                                                    color: FFAppState().selectedSwaimsCategoriesInFilter.contains(listViewAggregationCategoriesRecord.reference) ==
                                                                            true
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .background
                                                                        : FlutterFlowTheme.of(context)
                                                                            .text2Gray,
                                                                    fontSize:
                                                                        18,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.8,
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 4),
                                            child: InkWell(
                                              onTap: () async {
                                                context.pushNamed('ContactUs');
                                              },
                                              child: Text(
                                                'Contact Us',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFF808080),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 4),
                                            child: InkWell(
                                              onTap: () async {
                                                context.pushNamed('FAQ');
                                              },
                                              child: Text(
                                                'FAQ',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFF808080),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 4),
                                            child: InkWell(
                                              onTap: () async {
                                                await Share.share(
                                                    'https://swaim.co');
                                              },
                                              child: Text(
                                                'Share',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFF808080),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 4),
                                            child: InkWell(
                                              onTap: () async {
                                                HapticFeedback.lightImpact();
                                                await launchURL(
                                                    'https://www.linkedin.com/company/swaim-geonotes/?viewAsMember=true');
                                              },
                                              child: Text(
                                                'Rate Us',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFF808080),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.normal,
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
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 1,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .grayDark,
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
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
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
                    if (FFAppState().isSearchOnNotesListEnabled)
                      Align(
                        alignment: AlignmentDirectional(0, -0.98),
                        child: TextFormField(
                          controller: textController1,
                          onChanged: (_) => EasyDebounce.debounce(
                            'textController1',
                            Duration(milliseconds: 2000),
                            () async {
                              await queryNotesRecordOnce()
                                  .then(
                                    (records) => simpleSearchResults1 =
                                        TextSearch(
                                      records
                                          .map(
                                            (record) => TextSearchItem(
                                                record, [record.name!]),
                                          )
                                          .toList(),
                                    )
                                            .search(textController1!.text)
                                            .map((r) => r.object)
                                            .toList(),
                                  )
                                  .onError((_, __) => simpleSearchResults1 = [])
                                  .whenComplete(() => setState(() {}));
                            },
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Find a note...',
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
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
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
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
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
                    if (FFAppState().isSearchModeOnSwaimsEnabled)
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: TextFormField(
                          controller: textController2,
                          onChanged: (_) => EasyDebounce.debounce(
                            'textController2',
                            Duration(milliseconds: 2000),
                            () async {
                              await queryAggregationsRecordOnce()
                                  .then(
                                    (records) => simpleSearchResults2 =
                                        TextSearch(
                                      records
                                          .map(
                                            (record) => TextSearchItem(
                                                record, [record.title!]),
                                          )
                                          .toList(),
                                    )
                                            .search(textController2!.text)
                                            .map((r) => r.object)
                                            .take(10)
                                            .toList(),
                                  )
                                  .onError((_, __) => simpleSearchResults2 = [])
                                  .whenComplete(() => setState(() {}));
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
                  ],
                ),
                actions: [
                  Visibility(
                    visible: !FFAppState().isSwaimsMode,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: ToggleIcon(
                        onPressed: () async {
                          setState(() =>
                              FFAppState().isSearchOnNotesListEnabled =
                                  !FFAppState().isSearchOnNotesListEnabled);
                        },
                        value: FFAppState().isSearchOnNotesListEnabled,
                        onIcon: Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 20,
                        ),
                        offIcon: Icon(
                          Icons.search,
                          color: FlutterFlowTheme.of(context).yellowSwaim,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: FFAppState().isSwaimsMode,
                    child: ToggleIcon(
                      onPressed: () async {
                        setState(() =>
                            FFAppState().isSearchModeOnSwaimsEnabled =
                                !FFAppState().isSearchModeOnSwaimsEnabled);
                      },
                      value: FFAppState().isSearchModeOnSwaimsEnabled,
                      onIcon: Icon(
                        Icons.close,
                        color: Colors.black,
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
                elevation: 1,
              ),
              body: Stack(
                children: [
                  if (FFAppState().isSwaimsMode)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: StreamBuilder<List<AggregationsRecord>>(
                        stream: queryAggregationsRecord(
                          queryBuilder: (aggregationsRecord) =>
                              aggregationsRecord
                                  .whereIn(
                                      'title',
                                      simpleSearchResults2
                                          .map((e) => e.title!)
                                          .toList())
                                  .where('title', isNotEqualTo: 'null')
                                  .where('country',
                                      isEqualTo: FFAppState().countrySearch),
                          limit: 10,
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
                              listViewAggregationsRecordList = snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewAggregationsRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewAggregationsRecord =
                                  listViewAggregationsRecordList[listViewIndex];
                              return Visibility(
                                visible: FFAppState()
                                        .selectedSwaimsCategoriesInFilter
                                        .contains(listViewAggregationsRecord
                                            .category) ||
                                    (FFAppState()
                                            .selectedSwaimsCategoriesInFilter
                                            .length ==
                                        0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 1),
                                  child: InkWell(
                                    onTap: () async {
                                      context.pushNamed(
                                        'AggregationInfo',
                                        queryParams: {
                                          'aggregation': serializeParam(
                                            listViewAggregationsRecord
                                                .reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: ClipRRect(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 10, 0, 5),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      listViewAggregationsRecord
                                                          .title!
                                                          .maybeHandleOverflow(
                                                              maxChars: 20),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title3,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 0, 0, 10),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    StreamBuilder<
                                                        AggregationCategoriesRecord>(
                                                      stream: AggregationCategoriesRecord
                                                          .getDocument(
                                                              listViewAggregationsRecord
                                                                  .category!),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 30,
                                                              height: 30,
                                                              child:
                                                                  SpinKitRipple(
                                                                color: Color(
                                                                    0x80E8AA21),
                                                                size: 30,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final textAggregationCategoriesRecord =
                                                            snapshot.data!;
                                                        return SelectionArea(
                                                            child: Text(
                                                          textAggregationCategoriesRecord
                                                              .name!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .yellowSwaim,
                                                                fontSize: 14,
                                                              ),
                                                        ));
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Stack(
                                                children: [
                                                  Image.network(
                                                    listViewAggregationsRecord
                                                        .picture!,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.4,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.9, -0.9),
                                                    child: Container(
                                                      width: 90,
                                                      height: 40,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          StreamBuilder<
                                                              List<
                                                                  LabelsRecord>>(
                                                            stream:
                                                                queryLabelsRecord(
                                                              queryBuilder: (labelsRecord) =>
                                                                  labelsRecord.where(
                                                                      'name',
                                                                      isEqualTo:
                                                                          'Not set'),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 30,
                                                                    height: 30,
                                                                    child:
                                                                        SpinKitRipple(
                                                                      color: Color(
                                                                          0x80E8AA21),
                                                                      size: 30,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<LabelsRecord>
                                                                  iconButtonLabelsRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final iconButtonLabelsRecord =
                                                                  iconButtonLabelsRecordList
                                                                          .isNotEmpty
                                                                      ? iconButtonLabelsRecordList
                                                                          .first
                                                                      : null;
                                                              return FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius: 0,
                                                                borderWidth: 1,
                                                                buttonSize: 40,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                                icon: Icon(
                                                                  Icons.add,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .yellowSwaim,
                                                                  size: 24,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'addSwaim',
                                                                    queryParams:
                                                                        {
                                                                      'payloadFromAggregation':
                                                                          serializeParam(
                                                                        listViewAggregationsRecord
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                      'initialLabel':
                                                                          serializeParam(
                                                                        iconButtonLabelsRecord,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <
                                                                        String,
                                                                        dynamic>{
                                                                      'initialLabel':
                                                                          iconButtonLabelsRecord,
                                                                    },
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                          StreamBuilder<
                                                              List<
                                                                  FavoriteAggregationsRecord>>(
                                                            stream:
                                                                queryFavoriteAggregationsRecord(
                                                              queryBuilder: (favoriteAggregationsRecord) => favoriteAggregationsRecord
                                                                  .where(
                                                                      'userId',
                                                                      isEqualTo:
                                                                          currentUserReference)
                                                                  .where(
                                                                      'aggregation',
                                                                      isEqualTo:
                                                                          listViewAggregationsRecord
                                                                              .reference),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 30,
                                                                    height: 30,
                                                                    child:
                                                                        SpinKitRipple(
                                                                      color: Color(
                                                                          0x80E8AA21),
                                                                      size: 30,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<FavoriteAggregationsRecord>
                                                                  containerFavoriteAggregationsRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              return Container(
                                                                width: 40,
                                                                height: 40,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                        borderRadius:
                                                                            20,
                                                                        borderWidth:
                                                                            0,
                                                                        buttonSize:
                                                                            40,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .star_rate_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).yellowSwaim,
                                                                          size:
                                                                              24,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          if (containerFavoriteAggregationsRecordList.length ==
                                                                              1) {
                                                                            apiResultRemoveAggregation =
                                                                                await RemoveAggregationFromFavesCall.call(
                                                                              favAggregationId: functions.getFavAggregationId(containerFavoriteAggregationsRecordList.map((e) => e.reference).toList()),
                                                                            );
                                                                          } else {
                                                                            apiResultAddAggregation =
                                                                                await AddAggregationToFavesCall.call(
                                                                              aggregationId: functions.getIdFromAggregation(listViewAggregationsRecord.reference),
                                                                              userId: currentUserUid,
                                                                            );
                                                                          }

                                                                          setState(
                                                                              () {});
                                                                        },
                                                                      ),
                                                                    if (containerFavoriteAggregationsRecordList
                                                                            .length !=
                                                                        1)
                                                                      FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            20,
                                                                        borderWidth:
                                                                            0,
                                                                        buttonSize:
                                                                            40,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .star_outline_rounded,
                                                                          color:
                                                                              Color(0xFF747474),
                                                                          size:
                                                                              24,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          if (containerFavoriteAggregationsRecordList.length ==
                                                                              1) {
                                                                            apiResultnsu =
                                                                                await RemoveAggregationFromFavesCall.call(
                                                                              favAggregationId: functions.getFavAggregationId(containerFavoriteAggregationsRecordList.map((e) => e.reference).toList()),
                                                                            );
                                                                          } else {
                                                                            apiResult2um =
                                                                                await AddAggregationToFavesCall.call(
                                                                              aggregationId: functions.getIdFromAggregation(listViewAggregationsRecord.reference),
                                                                              userId: currentUserUid,
                                                                            );
                                                                          }

                                                                          setState(
                                                                              () {});
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
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 10, 0, 0),
                                                child: Text(
                                                  listViewAggregationsRecord
                                                      .description!
                                                      .maybeHandleOverflow(
                                                    maxChars: 60,
                                                    replacement: '…',
                                                  ),
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 10,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFD9D9D9),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  if (loggedIn && (FFAppState().isSwaimsMode == false))
                    Align(
                      alignment: AlignmentDirectional(0, -0.85),
                      child: StreamBuilder<List<NotesRecord>>(
                        stream: queryNotesRecord(
                          queryBuilder: (notesRecord) => notesRecord
                              .where('user', isEqualTo: currentUserReference)
                              .whereIn(
                                  'name',
                                  simpleSearchResults1
                                      .map((e) => e.name!)
                                      .toList()
                                      .where((e) => e != null && e != '')
                                      .toList()),
                          limit: 10,
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
                          List<NotesRecord> notesNotesRecordList =
                              snapshot.data!;
                          if (notesNotesRecordList.isEmpty) {
                            return EmptyListWidget();
                          }
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: notesNotesRecordList.length,
                            itemBuilder: (context, notesIndex) {
                              final notesNotesRecord =
                                  notesNotesRecordList[notesIndex];
                              return Visibility(
                                visible: FFAppState()
                                        .filterByLabel
                                        .contains(notesNotesRecord.label) ||
                                    (FFAppState().filterByLabel.length == 0),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).white,
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        StreamBuilder<LabelsRecord>(
                                          stream: LabelsRecord.getDocument(
                                              notesNotesRecord.label!),
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
                                            final listTileLabelsRecord =
                                                snapshot.data!;
                                            return InkWell(
                                              onTap: () async {
                                                context.pushNamed(
                                                  'editSwaim',
                                                  queryParams: {
                                                    'note': serializeParam(
                                                      notesNotesRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'label': serializeParam(
                                                      listTileLabelsRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'label':
                                                        listTileLabelsRecord,
                                                  },
                                                );
                                              },
                                              child: Slidable(
                                                actionPane:
                                                    const SlidableScrollActionPane(),
                                                secondaryActions: [
                                                  IconSlideAction(
                                                    caption: 'Show on map',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .yellowSwaim,
                                                    icon: Icons.map,
                                                    onTap: () async {
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                                .isSwaimsMode =
                                                            false;
                                                      });

                                                      context.pushNamed(
                                                        'MapPage',
                                                        queryParams: {
                                                          'noteLocation':
                                                              serializeParam(
                                                            notesNotesRecord
                                                                .location,
                                                            ParamType.LatLng,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                  ),
                                                  IconSlideAction(
                                                    caption: 'Share',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .yellowSwaim,
                                                    icon: Icons.ios_share,
                                                    onTap: () async {
                                                      await Share.share(
                                                          'swaimoriginalsaved://swaim.co${GoRouter.of(context).location}');
                                                    },
                                                  ),
                                                  IconSlideAction(
                                                    caption: 'Delete',
                                                    color: Color(0xFF999999),
                                                    icon: Icons.delete_outline,
                                                    onTap: () async {
                                                      apiResultlrl =
                                                          await DeleteNoteCall
                                                              .call(
                                                        noteId:
                                                            functions.getNoteId(
                                                                notesNotesRecord
                                                                    .reference),
                                                      );
                                                      if ((apiResultlrl
                                                              ?.succeeded ??
                                                          true)) {
                                                        context.pushNamed(
                                                            'NotesPage');
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Error while deleteing the note',
                                                              style: TextStyle(
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
                                                      }

                                                      setState(() {});
                                                    },
                                                  ),
                                                ],
                                                child: ListTile(
                                                  leading: Icon(
                                                    Icons.location_on,
                                                    color: functions.hasNotEmptyLocation(
                                                                notesNotesRecord) ==
                                                            true
                                                        ? Color(0xFFC6C6C6)
                                                        : Colors.transparent,
                                                  ),
                                                  title: Text(
                                                    functions
                                                        .composeNameAndDate(
                                                            notesNotesRecord
                                                                .name!,
                                                            dateTimeFormat(
                                                              'relative',
                                                              notesNotesRecord
                                                                  .createdAt!,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ))
                                                        .maybeHandleOverflow(
                                                            maxChars: 40),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w200,
                                                          lineHeight: 1.8,
                                                        ),
                                                  ),
                                                  subtitle: Text(
                                                    listTileLabelsRecord.name !=
                                                            'Not set'
                                                        ? listTileLabelsRecord
                                                            .name!
                                                        : ' ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .background,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w200,
                                                        ),
                                                  ),
                                                  tileColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBtnText,
                                                  dense: false,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 1,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
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
                  if (FFAppState().isSwaimsMode &&
                      (FFAppState().selectedSwaimsCategoriesInFilter.length >
                          0))
                    Align(
                      alignment: AlignmentDirectional(0, -1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 30,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).white,
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 0, 0),
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    6, 2, 6, 2),
                                            child: InkWell(
                                              onTap: () async {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Filtered by this category',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .background,
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .background,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4, 0, 0, 0),
                                                      child: StreamBuilder<
                                                          AggregationCategoriesRecord>(
                                                        stream:
                                                            AggregationCategoriesRecord
                                                                .getDocument(
                                                                    bbbbItem),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 30,
                                                                height: 30,
                                                                child:
                                                                    SpinKitRipple(
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
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle2,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4, 0, 4, 0),
                                                      child: Icon(
                                                        Icons.close,
                                                        color:
                                                            FlutterFlowTheme.of(
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
                    ),
                  if (!FFAppState().isSwaimsMode &&
                      (FFAppState().filterByLabel.length > 0))
                    Align(
                      alignment: AlignmentDirectional(0, -1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 30,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).white,
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 0, 0),
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    6, 2, 6, 2),
                                            child: InkWell(
                                              onTap: () async {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Filtered by this category',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
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
                                                        .addToFilterByLabel(
                                                            bbbbItem);
                                                  });
                                                }
                                              },
                                              child: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .yellowSwaim,
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .yellowSwaim,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4, 0, 0, 0),
                                                      child: StreamBuilder<
                                                          LabelsRecord>(
                                                        stream: LabelsRecord
                                                            .getDocument(
                                                                bbbbItem),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 30,
                                                                height: 30,
                                                                child:
                                                                    SpinKitRipple(
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
                                                            textLabelsRecord
                                                                .name!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle2,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4, 0, 4, 0),
                                                      child: Icon(
                                                        Icons.close,
                                                        color:
                                                            FlutterFlowTheme.of(
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
                          Align(
                            alignment: AlignmentDirectional(0, 0),
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
                                alignment: AlignmentDirectional(0.86, 0.76),
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
                                        Icons.map_rounded,
                                        color: Color(0xFF747474),
                                        size: 20,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed('MapPage');
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          if (!FFAppState().isSwaimsMode)
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
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
                                        queryBuilder: (labelsRecord) =>
                                            labelsRecord.where('name',
                                                isEqualTo: 'Not set'),
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
                                            iconButtonLabelsRecordList
                                                    .isNotEmpty
                                                ? iconButtonLabelsRecordList
                                                    .first
                                                : null;
                                        return FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 0,
                                          buttonSize: 60,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
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
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (FFAppState().isSwaimsMode)
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
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
                                    alignment: AlignmentDirectional(0.86, 0.76),
                                    child: StreamBuilder<List<LabelsRecord>>(
                                      stream: queryLabelsRecord(
                                        queryBuilder: (labelsRecord) =>
                                            labelsRecord.where('name',
                                                isEqualTo: 'Not set'),
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
                                            iconButtonLabelsRecordList
                                                    .isNotEmpty
                                                ? iconButtonLabelsRecordList
                                                    .first
                                                : null;
                                        return InkWell(
                                          onDoubleTap: () async {
                                            context.pushNamed('MapPage');
                                          },
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            borderWidth: 0,
                                            buttonSize: 60,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBtnText,
                                            icon: Icon(
                                              Icons.star_outline_rounded,
                                              color: Color(0xFF747474),
                                              size: 30,
                                            ),
                                            onPressed: () async {
                                              context.pushNamed(
                                                  'FavoriteAggregationsListPage');
                                            },
                                          ),
                                        );
                                      },
                                    ),
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
            ));
      },
    );
  }
}
