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
  ApiCallResponse? apiResultnck;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController? textController1;
  TextEditingController? textController2;
  var placePickerValue = FFPlace();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => FFAppState().labelInEditSwaim = widget.label!.reference);
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
      appBar: AppBar(
        backgroundColor: Color(0xFFEEEEEE),
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
          child: FlutterFlowIconButton(
            borderRadius: 30,
            buttonSize: 40,
            icon: Icon(
              Icons.chevron_left_rounded,
              color: FlutterFlowTheme.of(context).primaryColor,
              size: 28,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
        ),
        title: Text(
          'EditingSwaim',
          style: FlutterFlowTheme.of(context).title3.override(
                fontFamily: 'Overpass',
                color: FlutterFlowTheme.of(context).primaryColor,
                fontSize: 18,
              ),
        ),
        actions: [
          StreamBuilder<NotesRecord>(
            stream: NotesRecord.getDocument(widget.note!),
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
              final iconButtonNotesRecord = snapshot.data!;
              return FlutterFlowIconButton(
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.done,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 20,
                ),
                onPressed: () async {
                  await UpdateNoteCall.call(
                    name: textController1?.text ?? '',
                    description: textController2?.text ?? '',
                    user: currentUserUid,
                    noteId: functions.getEditeNoteId(
                        'swaimoriginalsaved://swaimplayground.com${GoRouter.of(context).location}'),
                    latitude: functions.getLatitude(placePickerValue.latLng),
                    longitude: functions.getLongitude(placePickerValue.latLng),
                    label: functions.getLabelId(FFAppState().labelInEditSwaim!),
                    swaimRef: functions
                        .getIdFromAggregation(iconButtonNotesRecord.swaimRef!),
                  );

                  context.pushNamed('NotesPage');
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.delete,
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 20,
              ),
              onPressed: () async {
                apiResultnck = await DeleteNoteCall.call(
                  noteId: functions.getEditeNoteId(
                      'swaimoriginalsaved://swaimplayground.com${GoRouter.of(context).location}'),
                );

                context.pushNamed('NotesPage');

                setState(() {});
              },
            ),
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
                  width: 60,
                  height: 60,
                  child: SpinKitRipple(
                    color: Color(0xFF222235),
                    size: 60,
                  ),
                ),
              );
            }
            final formNotesRecord = snapshot.data!;
            return Form(
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
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                            child: TextFormField(
                              controller: textController1 ??=
                                  TextEditingController(
                                text: formNotesRecord.name,
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Swaim Name',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Overpass',
                                      color: Color(0xFF8B97A2),
                                      fontSize: 24,
                                      fontWeight: FontWeight.normal,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).text2Gray,
                                    width: 2,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).text2Gray,
                                    width: 2,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
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
                              style: FlutterFlowTheme.of(context)
                                  .title3
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).darkBG,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          TextFormField(
                            controller: textController2 ??=
                                TextEditingController(
                              text: formNotesRecord.description,
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Changing your note',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color:
                                        FlutterFlowTheme.of(context).text2Gray,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).text2Gray,
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).text2Gray,
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).darkBG,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                            maxLines: 6,
                            keyboardType: TextInputType.multiline,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 80,
                            decoration: BoxDecoration(
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: StreamBuilder<LabelsRecord>(
                                    stream: LabelsRecord.getDocument(
                                        FFAppState().labelInEditSwaim!),
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
                                      final containerLabelsRecord =
                                          snapshot.data!;
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              'Label: ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                            Text(
                                              containerLabelsRecord.name!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                            FFButtonWidget(
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
                                                ).then(
                                                    (value) => setState(() {}));
                                              },
                                              text: 'Set label',
                                              options: FFButtonOptions(
                                                width: 130,
                                                height: 40,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              'Overpass',
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
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 30),
                                  child: FlutterFlowPlacePicker(
                                    iOSGoogleMapsApiKey:
                                        'AIzaSyCPvCM4JF4R50eTKWv_Kam874FBsodPqbE',
                                    androidGoogleMapsApiKey:
                                        'AIzaSyCPvCM4JF4R50eTKWv_Kam874FBsodPqbE',
                                    webGoogleMapsApiKey:
                                        'AIzaSyCPvCM4JF4R50eTKWv_Kam874FBsodPqbE',
                                    onSelect: (place) async {
                                      setState(() => placePickerValue = place);
                                    },
                                    defaultText: 'Change Location',
                                    icon: Icon(
                                      Icons.place,
                                      color: FlutterFlowTheme.of(context)
                                          .text2Gray,
                                      size: 24,
                                    ),
                                    buttonOptions: FFButtonOptions(
                                      width: 240,
                                      height: 50,
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Overpass',
                                            fontWeight: FontWeight.w300,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          StreamBuilder<AggregationsRecord>(
                            stream: AggregationsRecord.getDocument(
                                formNotesRecord.swaimRef!),
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
                                width: MediaQuery.of(context).size.width,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                ),
                                child: Visibility(
                                  visible: containerAggregationsRecord.title !=
                                      'null',
                                  child: StreamBuilder<AggregationsRecord>(
                                    stream: AggregationsRecord.getDocument(
                                        formNotesRecord.swaimRef!),
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
                                      final rowAggregationsRecord =
                                          snapshot.data!;
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: Image.network(
                                              containerAggregationsRecord
                                                  .picture!,
                                              width: 60,
                                              height: 60,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      containerAggregationsRecord
                                                          .title!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
