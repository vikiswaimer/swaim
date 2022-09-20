import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddSwaimWidget extends StatefulWidget {
  const AddSwaimWidget({
    Key? key,
    this.payload,
  }) : super(key: key);

  final NotesRecord? payload;

  @override
  _AddSwaimWidgetState createState() => _AddSwaimWidgetState();
}

class _AddSwaimWidgetState extends State<AddSwaimWidget> {
  TextEditingController? textController1;

  TextEditingController? textController2;

  List<String>? choiceChipsValues;
  var placePickerValue = FFPlace();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
          child: Text(
            'Add Swaim',
            style: FlutterFlowTheme.of(context).title3.override(
                  fontFamily: 'Overpass',
                  color: FlutterFlowTheme.of(context).primaryColor,
                  fontSize: 26,
                ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
            child: FlutterFlowIconButton(
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.done,
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 35,
              ),
              onPressed: () async {
                await AddNoteCall.call(
                  name: textController1!.text,
                  description: textController2!.text,
                  user: currentUserUid,
                  latitude: functions.getLatitude(placePickerValue.latLng),
                  longitude: functions.getLongitude(placePickerValue.latLng),
                );

                context.pushNamed('NotesPage');
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                        child: TextFormField(
                          controller: textController1,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Swaim Name',
                            labelStyle:
                                FlutterFlowTheme.of(context).title3.override(
                                      fontFamily: 'Overpass',
                                      color: Color(0xFF8B97A2),
                                      fontSize: 24,
                                      fontWeight: FontWeight.normal,
                                    ),
                            hintText: 'add a title to your note',
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).darkBG,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      TextFormField(
                        controller: textController2,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'add your note',
                          labelStyle: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).text2Gray,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          filled: true,
                          fillColor: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).darkBG,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                        maxLines: 18,
                        keyboardType: TextInputType.multiline,
                      ),
                      StreamBuilder<List<LabelsRecord>>(
                        stream: queryLabelsRecord(),
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
                          List<LabelsRecord> choiceChipsLabelsRecordList =
                              snapshot.data!;
                          return FlutterFlowChoiceChips(
                            initiallySelected: choiceChipsValues != null
                                ? choiceChipsValues
                                : [],
                            options: choiceChipsLabelsRecordList
                                .map((e) => e.name!)
                                .toList()
                                .map((label) => ChipData(label))
                                .toList(),
                            onChanged: (val) =>
                                setState(() => choiceChipsValues = val),
                            selectedChipStyle: ChipStyle(
                              backgroundColor: Color(0xFF323B45),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Overpass',
                                    color: Colors.white,
                                  ),
                              iconColor: Colors.white,
                              iconSize: 18,
                              elevation: 4,
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor: Colors.white,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Overpass',
                                    color: Color(0xFF323B45),
                                  ),
                              iconColor: Color(0xFF323B45),
                              iconSize: 18,
                              elevation: 4,
                            ),
                            chipSpacing: 20,
                            multiselect: true,
                            initialized: choiceChipsValues != null,
                            alignment: WrapAlignment.center,
                          );
                        },
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
                                    'AIzaSyCDDwo7UDXq61QnC69og80dxeMPF287hsU',
                                androidGoogleMapsApiKey:
                                    'AIzaSyCDDwo7UDXq61QnC69og80dxeMPF287hsU',
                                webGoogleMapsApiKey:
                                    'AIzaSyCDDwo7UDXq61QnC69og80dxeMPF287hsU',
                                onSelect: (place) async {
                                  setState(() => placePickerValue = place);
                                },
                                defaultText: 'Set Location',
                                icon: Icon(
                                  Icons.place,
                                  color: FlutterFlowTheme.of(context).text2Gray,
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
