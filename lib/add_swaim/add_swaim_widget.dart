import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AddSwaimWidget extends StatefulWidget {
  const AddSwaimWidget({Key key}) : super(key: key);

  @override
  _AddSwaimWidgetState createState() => _AddSwaimWidgetState();
}

class _AddSwaimWidgetState extends State<AddSwaimWidget> {
  TextEditingController textController1;
  TextEditingController textController2;
  var placePickerValue = FFPlace();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFEEEEEE),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 48,
          icon: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.of(context).darkBG,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Add Swaim',
          style: FlutterFlowTheme.of(context).title3,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFEEEEEE),
      body: SafeArea(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 16, 15, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                        child: TextFormField(
                          controller: textController1,
                          onFieldSubmitted: (_) async {
                            final listsMapsDataNotesCreateData =
                                createListsMapsDataNotesRecordData(
                              name: '',
                            );
                            await ListsMapsDataNotesRecord.collection
                                .doc()
                                .set(listsMapsDataNotesCreateData);
                          },
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Swaim Name',
                            labelStyle: FlutterFlowTheme.of(context)
                                .title3
                                .override(
                                  fontFamily: 'Overpass',
                                  color: FlutterFlowTheme.of(context).iconGray,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                            hintText: 'Swaim Name...',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).grayLines,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).grayLines,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Overpass',
                                color: FlutterFlowTheme.of(context).darkBG,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                        child: TextFormField(
                          controller: textController2,
                          onFieldSubmitted: (_) async {
                            final listsMapsDataNotesCreateData =
                                createListsMapsDataNotesRecordData(
                              description: '',
                            );
                            await ListsMapsDataNotesRecord.collection
                                .doc()
                                .set(listsMapsDataNotesCreateData);
                          },
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Overpass',
                                  color: FlutterFlowTheme.of(context).iconGray,
                                  fontSize: 15,
                                ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).grayLines,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).grayLines,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Overpass',
                                    color: FlutterFlowTheme.of(context).darkBG,
                                    fontSize: 15,
                                  ),
                          maxLines: 4,
                          keyboardType: TextInputType.multiline,
                        ),
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 30),
                              child: FlutterFlowPlacePicker(
                                iOSGoogleMapsApiKey:
                                    'AIzaSyDsOfXNkOl75yQJbyD33MCIbnSKNUUcKxM',
                                androidGoogleMapsApiKey:
                                    'AIzaSyCW3z3-WGhy6Ca-3lDkB6PrN4eLnrB3OnI',
                                webGoogleMapsApiKey:
                                    'AIzaSyAib8SGnyJmip3--iN2dlz_nHuDsKrG0QA',
                                onSelect: (place) =>
                                    setState(() => placePickerValue = place),
                                defaultText: 'Set Location',
                                icon: Icon(
                                  Icons.place,
                                  color: FlutterFlowTheme.of(context).iconGray,
                                  size: 24,
                                ),
                                buttonOptions: FFButtonOptions(
                                  width: 240,
                                  height: 50,
                                  color: Color(0x7BFFC24B),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Overpass',
                                        color: FlutterFlowTheme.of(context)
                                            .iconGray,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: FFButtonWidget(
                          onPressed: () async {
                            final listsMapsDataNotesCreateData =
                                createListsMapsDataNotesRecordData(
                              name: textController1.text,
                              location: placePickerValue.latLng,
                              createdAt: getCurrentTimestamp,
                              description: textController2.text,
                            );
                            await ListsMapsDataNotesRecord.collection
                                .doc()
                                .set(listsMapsDataNotesCreateData);
                            Navigator.pop(context);
                          },
                          text: 'Add Swaim',
                          icon: FaIcon(
                            FontAwesomeIcons.stripeS,
                          ),
                          options: FFButtonOptions(
                            width: 290,
                            height: 50,
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).title3.override(
                                      fontFamily: 'Overpass',
                                      color: FlutterFlowTheme.of(context).white,
                                    ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 8,
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
  }
}
