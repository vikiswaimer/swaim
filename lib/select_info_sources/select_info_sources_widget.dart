import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_checkbox_group.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectInfoSourcesWidget extends StatefulWidget {
  const SelectInfoSourcesWidget({
    Key? key,
    this.notes,
  }) : super(key: key);

  final NotesRecord? notes;

  @override
  _SelectInfoSourcesWidgetState createState() =>
      _SelectInfoSourcesWidgetState();
}

class _SelectInfoSourcesWidgetState extends State<SelectInfoSourcesWidget> {
  List<String>? checkboxGroupValues;
  String? dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

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
            buttonSize: 60,
            icon: Icon(
              Icons.chevron_left,
              color: FlutterFlowTheme.of(context).primaryColor,
              size: 45,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(-1, 1),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 90,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.82, 0.93),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: '',
                    icon: FaIcon(
                      FontAwesomeIcons.list,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 30,
                    ),
                    options: FFButtonOptions(
                      width: 60,
                      height: 50,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Overpass',
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.02, 0.87),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 65,
                    fillColor: FlutterFlowTheme.of(context).tertiaryColor,
                    icon: Icon(
                      Icons.add_box_outlined,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 30,
                    ),
                    onPressed: () async {
                      context.pushNamed('addSwaim');
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.88, 0.92),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('MapPage');
                    },
                    text: '',
                    icon: FaIcon(
                      FontAwesomeIcons.map,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 28,
                    ),
                    options: FFButtonOptions(
                      width: 60,
                      height: 50,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Overpass',
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 110, 0, 120),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.9, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(14, 0, 14, 0),
                      child: FlutterFlowCheckboxGroup(
                        initiallySelected: checkboxGroupValues ??= [],
                        options: [
                          'Want to visit',
                          'Need to buy',
                          'Photo view-points',
                          'Love places',
                          'Favorite stores',
                          'Trip places',
                          'Go to chilling',
                          'Art places'
                        ].toList(),
                        onChanged: (val) =>
                            setState(() => checkboxGroupValues = val),
                        activeColor: FlutterFlowTheme.of(context).primaryColor,
                        checkColor: Colors.white,
                        checkboxBorderColor: Color(0xFF95A1AC),
                        textStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                ),
                        itemPadding:
                            EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(14, 0, 14, 0),
                    child: FlutterFlowDropDown(
                      options: ['All world', 'Georgia', 'Europe'],
                      onChanged: (val) => setState(() => dropDownValue = val),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Overpass',
                                color: Colors.black,
                              ),
                      hintText: 'Select country',
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      borderRadius: 0,
                      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
