import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/choose_label_for_edit_note_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class EditSwaimWidget extends StatefulWidget {
  const EditSwaimWidget({
    Key? key,
    this.note,
    this.label,
  }) : super(key: key);

  final DocumentReference? note;
  final LabelsRecord? label;

  @override
  _EditSwaimWidgetState createState() => _EditSwaimWidgetState();
}

class _EditSwaimWidgetState extends State<EditSwaimWidget> {
  ApiCallResponse? apiResultb9b;
  TextEditingController? textController1;
  var placePickerValue = FFPlace();
  TextEditingController? textController2;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().labelInEditSwaim = widget.label!.reference;
      });
    });

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

    return Title(
        title: 'editSwaim',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
          endDrawer: StreamBuilder<NotesRecord>(
            stream: NotesRecord.getDocument(widget.note!),
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
              final endDrawerNotesRecord = snapshot.data!;
              return Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Drawer(
                  elevation: 16,
                  child: StreamBuilder<AggregationsRecord>(
                    stream: AggregationsRecord.getDocument(
                        endDrawerNotesRecord.swaimRef!),
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
                      final stackAggregationsRecord = snapshot.data!;
                      return Stack(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 0, 0),
                                      child: SelectionArea(
                                          child: Text(
                                        'INFORMATION',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      )),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 5, 0),
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
                                              scaffoldKey.currentState!
                                                  .isEndDrawerOpen) {
                                            Navigator.pop(context);
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 1,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE0E0E0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    StreamBuilder<NotesRecord>(
                                      stream:
                                          NotesRecord.getDocument(widget.note!),
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
                                        final nameNotesRecord = snapshot.data!;
                                        return SelectionArea(
                                            child: Text(
                                          nameNotesRecord.name!
                                              .maybeHandleOverflow(
                                            maxChars: 20,
                                            replacement: '…',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                fontSize: 14,
                                              ),
                                        ));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 20, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFAFAFA),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    widget.label!.name!,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .yellowSwaim,
                                          fontSize: 14,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 20, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 1,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE0E0E0),
                                  ),
                                ),
                              ),
                              if (stackAggregationsRecord.title != 'null')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 10, 24, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      context.pushNamed(
                                        'AggregationInfo',
                                        queryParams: {
                                          'aggregation': serializeParam(
                                            stackAggregationsRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFAFAFA),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Image.asset(
                                            'assets/images/_3.png',
                                            width: 20,
                                            fit: BoxFit.cover,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 0, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'AggregationInfo',
                                                    queryParams: {
                                                      'aggregation':
                                                          serializeParam(
                                                        stackAggregationsRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    StreamBuilder<
                                                        AggregationsRecord>(
                                                      stream: AggregationsRecord
                                                          .getDocument(
                                                              endDrawerNotesRecord
                                                                  .swaimRef!),
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
                                                        final textAggregationsRecord =
                                                            snapshot.data!;
                                                        return SelectionArea(
                                                            child: Text(
                                                          textAggregationsRecord
                                                              .title!
                                                              .maybeHandleOverflow(
                                                            maxChars: 30,
                                                            replacement: '…',
                                                          ),
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 14,
                                                              ),
                                                        ));
                                                      },
                                                    ),
                                                    StreamBuilder<
                                                        AggregationsRecord>(
                                                      stream: AggregationsRecord
                                                          .getDocument(
                                                              stackAggregationsRecord
                                                                  .reference),
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
                                                        final containerAggregationsRecord =
                                                            snapshot.data!;
                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFFAFAFA),
                                                          ),
                                                          child: StreamBuilder<
                                                              AggregationCategoriesRecord>(
                                                            stream: AggregationCategoriesRecord
                                                                .getDocument(
                                                                    containerAggregationsRecord
                                                                        .category!),
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
                                                              final categoryAggregationCategoriesRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return SelectionArea(
                                                                  child: Text(
                                                                categoryAggregationCategoriesRecord
                                                                    .name!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .yellowSwaim,
                                                                      fontSize:
                                                                          14,
                                                                    ),
                                                              ));
                                                            },
                                                          ),
                                                        );
                                                      },
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
                                ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 1.01),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 20, 40),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 1,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE0E0E0),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        if (!isWeb)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 6, 0, 0),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30,
                                              borderWidth: 1,
                                              buttonSize: 40,
                                              icon: Icon(
                                                Icons.ios_share,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .yellowSwaim,
                                                size: 24,
                                              ),
                                              onPressed: () async {
                                                await Share.share(
                                                    'swaimoriginalsaved://swaim.com${GoRouter.of(context).location}');
                                              },
                                            ),
                                          ),
                                        if (endDrawerNotesRecord.location !=
                                            null)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 6, 0, 0),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30,
                                              borderWidth: 1,
                                              buttonSize: 40,
                                              icon: Icon(
                                                Icons.map_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .yellowSwaim,
                                                size: 24,
                                              ),
                                              onPressed: () async {
                                                context.pushNamed(
                                                  'MapPage',
                                                  queryParams: {
                                                    'noteLocation':
                                                        serializeParam(
                                                      endDrawerNotesRecord
                                                          .location,
                                                      ParamType.LatLng,
                                                    ),
                                                    'swaimLocation':
                                                        serializeParam(
                                                      endDrawerNotesRecord
                                                          .location,
                                                      ParamType.LatLng,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                            ),
                                          ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 6, 0, 0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            borderWidth: 1,
                                            buttonSize: 40,
                                            icon: Icon(
                                              Icons.delete_outlined,
                                              color: Color(0xFF777777),
                                              size: 24,
                                            ),
                                            onPressed: () async {
                                              var _shouldSetState = false;
                                              apiResultb9b =
                                                  await DeleteNoteCall.call(
                                                noteId: functions.getEditeNoteId(
                                                    'swaimoriginalsaved://swaim.com${GoRouter.of(context).location}'),
                                              );
                                              _shouldSetState = true;
                                              if ((apiResultb9b?.succeeded ??
                                                  true)) {
                                                context.pushNamed('NotesPage');
                                              } else {
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }

                                              if (_shouldSetState)
                                                setState(() {});
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
                      );
                    },
                  ),
                ),
              );
            },
          ),
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
              child: FlutterFlowIconButton(
                borderRadius: 30,
                buttonSize: 60,
                icon: Icon(
                  Icons.chevron_left,
                  color: FlutterFlowTheme.of(context).yellowSwaim,
                  size: 28,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
            ),
            actions: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20,
                borderWidth: 1,
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
              StreamBuilder<NotesRecord>(
                stream: NotesRecord.getDocument(widget.note!),
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
                  final iconButtonNotesRecord = snapshot.data!;
                  return FlutterFlowIconButton(
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 60,
                    icon: Icon(
                      Icons.check,
                      color: FlutterFlowTheme.of(context).yellowSwaim,
                      size: 20,
                    ),
                    onPressed: () async {
                      await UpdateNoteCall.call(
                        name: textController1?.text ?? '',
                        description: textController2?.text ?? '',
                        user: currentUserUid,
                        noteId: functions.getEditeNoteId(
                            'swaimoriginalsaved://swaim.com${GoRouter.of(context).location}'),
                        latitude: functions
                                    .getLatitude(placePickerValue.latLng)
                                    .toString() !=
                                '0'
                            ? functions.getLatitude(placePickerValue.latLng)
                            : functions
                                .getLatitude(iconButtonNotesRecord.location!),
                        longitude: functions
                                    .getLongitude(placePickerValue.latLng)
                                    .toString() !=
                                '0'
                            ? functions.getLongitude(placePickerValue.latLng)
                            : functions
                                .getLongitude(iconButtonNotesRecord.location!),
                        label: functions
                            .getLabelId(FFAppState().labelInEditSwaim!),
                        swaimRef: functions.getIdFromAggregation(
                            iconButtonNotesRecord.swaimRef!),
                        createdAt: functions
                            .dateToString(iconButtonNotesRecord.createdAt!),
                        updatedAt: functions.dateToString(getCurrentTimestamp),
                      );

                      context.pushNamed(
                        'NotesPage',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.bottomToTop,
                          ),
                        },
                      );
                    },
                  );
                },
              ),
            ],
            centerTitle: false,
            elevation: 0,
          ),
          body: SafeArea(
            child: StreamBuilder<NotesRecord>(
              stream: NotesRecord.getDocument(widget.note!),
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
                final formNotesRecord = snapshot.data!;
                return Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 16, 15, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: StreamBuilder<LabelsRecord>(
                            stream: LabelsRecord.getDocument(
                                FFAppState().labelInEditSwaim!),
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
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 140,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: functions
                                                    .getLatitude(
                                                        placePickerValue.latLng)
                                                    .toString() !=
                                                '0'
                                            ? Color(0xFFE8AA21)
                                            : Color(0xFFD9D9D9),
                                      ),
                                      child: FlutterFlowPlacePicker(
                                        iOSGoogleMapsApiKey:
                                            'AIzaSyCPvCM4JF4R50eTKWv_Kam874FBsodPqbE',
                                        androidGoogleMapsApiKey:
                                            'AIzaSyCPvCM4JF4R50eTKWv_Kam874FBsodPqbE',
                                        webGoogleMapsApiKey:
                                            'AIzaSyCPvCM4JF4R50eTKWv_Kam874FBsodPqbE',
                                        onSelect: (place) async {
                                          setState(
                                              () => placePickerValue = place);
                                        },
                                        defaultText: 'EDIT LOCATION',
                                        buttonOptions: FFButtonOptions(
                                          width: 120,
                                          height: 25,
                                          color: Colors.transparent,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2,
                                          elevation: 0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child:
                                                    ChooseLabelForEditNoteWidget(),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                        text: containerLabelsRecord.name ==
                                                'Not set'
                                            ? '+ LABEL'
                                            : containerLabelsRecord.name!,
                                        options: FFButtonOptions(
                                          width: 120,
                                          height: 25,
                                          color: functions.getLabelId(
                                                      FFAppState()
                                                          .labelInEditSwaim!) !=
                                                  'er7SZTHrkAdI2E1WBERe'
                                              ? Colors.white
                                              : Color(0xFFD9D9D9),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: functions.getLabelId(
                                                                FFAppState()
                                                                    .labelInEditSwaim!) !=
                                                            'er7SZTHrkAdI2E1WBERe'
                                                        ? Color(0xFFE8AA21)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBtnText,
                                                    fontSize: 14,
                                                  ),
                                          elevation: 0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                      ),
                                    ),
                                    if (!functions.isLocationEmpty(
                                        formNotesRecord.location!))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 0, 0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 36,
                                          icon: Icon(
                                            Icons.map_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .yellowSwaim,
                                            size: 20,
                                          ),
                                          onPressed: () async {
                                            context.pushNamed(
                                              'MapPage',
                                              queryParams: {
                                                'noteLocation': serializeParam(
                                                  formNotesRecord.location,
                                                  ParamType.LatLng,
                                                ),
                                                'swaimLocation': serializeParam(
                                                  formNotesRecord.location,
                                                  ParamType.LatLng,
                                                ),
                                              }.withoutNulls,
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                              child: Text(
                                'H1',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 22,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: textController1 ??=
                                    TextEditingController(
                                  text: formNotesRecord.name,
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF8B97A2),
                                        fontSize: 24,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF5F5F5F),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: textController2 ??= TextEditingController(
                            text: formNotesRecord.description,
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xFF5F5F5F),
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                          maxLines: 26,
                          keyboardType: TextInputType.multiline,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
