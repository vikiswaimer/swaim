import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
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
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EditSwaimWidget extends StatefulWidget {
  const EditSwaimWidget({
    Key? key,
    this.note,
  }) : super(key: key);

  final DocumentReference? note;

  @override
  _EditSwaimWidgetState createState() => _EditSwaimWidgetState();
}

class _EditSwaimWidgetState extends State<EditSwaimWidget> {
  TextEditingController? textController1;

  TextEditingController? textController2;

  String? dropDownValue;
  var placePickerValue = FFPlace();
  ApiCallResponse? apiResultnck;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<NotesRecord>(
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
        final editSwaimNotesRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
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
                  size: 45,
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
                    fontSize: 26,
                  ),
            ),
            actions: [
              FlutterFlowIconButton(
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.done,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 35,
                ),
                onPressed: () async {
                  await UpdateNoteCall.call(
                    name: textController1?.text ?? '',
                    description: textController2?.text ?? '',
                    user: currentUserUid,
                    noteId: functions.getEditeNoteId(
                        'swaimoriginalsaved://swaimplayground.com${GoRouter.of(context).location}'),
                  );

                  context.pushNamed('NotesPage');
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
                    size: 30,
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
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                            child: TextFormField(
                              controller: textController1 ??=
                                  TextEditingController(
                                text: editSwaimNotesRecord.name,
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
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .title3
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).darkBG,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          TextFormField(
                            controller: textController2 ??=
                                TextEditingController(
                              text: editSwaimNotesRecord.description,
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
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              filled: true,
                              fillColor:
                                  FlutterFlowTheme.of(context).tertiaryColor,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context).darkBG,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                            maxLines: 18,
                            keyboardType: TextInputType.multiline,
                          ),
                          FlutterFlowDropDown(
                            options: [
                              'Without',
                              'Trip places',
                              'Favorite stores',
                              'Love places',
                              'Photo view-points',
                              'Need to buy',
                              'Want to visit',
                              'Go to chilling',
                              'Art places'
                            ],
                            onChanged: (val) =>
                                setState(() => dropDownValue = val),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Overpass',
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                            hintText: 'Change category',
                            fillColor:
                                FlutterFlowTheme.of(context).secondaryColor,
                            elevation: 2,
                            borderColor: Colors.transparent,
                            borderWidth: 0,
                            borderRadius: 0,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            hidesUnderline: true,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
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
                                        'AIzaSyCDDwo7UDXq61QnC69og80dxeMPF287hsU',
                                    androidGoogleMapsApiKey:
                                        'AIzaSyCDDwo7UDXq61QnC69og80dxeMPF287hsU',
                                    webGoogleMapsApiKey:
                                        'AIzaSyCDDwo7UDXq61QnC69og80dxeMPF287hsU',
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
                                          .primaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .title3
                                          .override(
                                            fontFamily: 'Overpass',
                                            color: FlutterFlowTheme.of(context)
                                                .text2Gray,
                                            fontWeight: FontWeight.normal,
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
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final notesCreateData = createNotesRecordData(
                                  name: textController1?.text ?? '',
                                  location: placePickerValue.latLng,
                                  description: textController2?.text ?? '',
                                );
                                await NotesRecord.collection
                                    .doc()
                                    .set(notesCreateData);
                                context.pop();
                              },
                              text: 'Add Swaim',
                              icon: FaIcon(
                                FontAwesomeIcons.stripeS,
                              ),
                              options: FFButtonOptions(
                                width: 290,
                                height: 50,
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Overpass',
                                      color: FlutterFlowTheme.of(context).white,
                                    ),
                                elevation: 3,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
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
        );
      },
    );
  }
}
