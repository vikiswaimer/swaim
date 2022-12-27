import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/choose_label_for_add_note_widget.dart';
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
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddSwaimWidget extends StatefulWidget {
  const AddSwaimWidget({
    Key? key,
    this.payloadFromAggregation,
    this.initialLabel,
  }) : super(key: key);

  final DocumentReference? payloadFromAggregation;
  final LabelsRecord? initialLabel;

  @override
  _AddSwaimWidgetState createState() => _AddSwaimWidgetState();
}

class _AddSwaimWidgetState extends State<AddSwaimWidget> {
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
      FFAppState().update(() {
        FFAppState().labelInAddSwaim = widget.initialLabel!.reference;
      });
    });

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

    return Title(
        title: 'addSwaim',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
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
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.check,
                  color: FlutterFlowTheme.of(context).yellowSwaim,
                  size: 20,
                ),
                onPressed: () async {
                  if (widget.payloadFromAggregation == null) {
                    await AddNoteCall.call(
                      name: textController1!.text,
                      description: textController2!.text,
                      user: currentUserUid,
                      latitude: functions.getLatitude(placePickerValue.latLng),
                      longitude:
                          functions.getLongitude(placePickerValue.latLng),
                      labels:
                          functions.getLabelId(FFAppState().labelInAddSwaim!),
                      createdAt: functions.dateToString(getCurrentTimestamp),
                      updatedAt: functions.dateToString(getCurrentTimestamp),
                    );
                  } else {
                    await AddNoteWithAttachedSwaimCall.call(
                      name: textController1!.text,
                      description: textController2!.text,
                      latitude: functions.getLatitude(placePickerValue.latLng),
                      longitude:
                          functions.getLongitude(placePickerValue.latLng),
                      user: currentUserUid,
                      labels:
                          functions.getLabelId(FFAppState().labelInAddSwaim!),
                      swaimRef: functions
                          .getIdFromAggregation(widget.payloadFromAggregation!),
                      createdAt: functions.dateToString(getCurrentTimestamp),
                      updatedAt: functions.dateToString(getCurrentTimestamp),
                    );
                  }

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
              ),
            ],
            centerTitle: true,
            elevation: 0,
          ),
          body: SafeArea(
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 16, 15, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: StreamBuilder<LabelsRecord>(
                              stream: LabelsRecord.getDocument(
                                  FFAppState().labelInAddSwaim!),
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
                                        width: 120,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color: functions
                                                      .getLatitude(
                                                          placePickerValue
                                                              .latLng)
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
                                          defaultText: '+ LOCATION',
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
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child:
                                                      ChooseLabelForAddNoteWidget(),
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
                                                            .labelInAddSwaim!) !=
                                                    'er7SZTHrkAdI2E1WBERe'
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryBtnText
                                                : Color(0xFFD9D9D9),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: functions.getLabelId(
                                                                  FFAppState()
                                                                      .labelInAddSwaim!) !=
                                                              'er7SZTHrkAdI2E1WBERe'
                                                          ? Color(0xFFE8AA21)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
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
                                  controller: textController1,
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
                                  style: FlutterFlowTheme.of(context).title3,
                                ),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: textController2,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
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
                            style: FlutterFlowTheme.of(context).bodyText1,
                            maxLines: 26,
                            keyboardType: TextInputType.multiline,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
