import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmptyListWidget extends StatefulWidget {
  const EmptyListWidget({Key? key}) : super(key: key);

  @override
  _EmptyListWidgetState createState() => _EmptyListWidgetState();
}

class _EmptyListWidgetState extends State<EmptyListWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: SvgPicture.network(
                'https://firebasestorage.googleapis.com/v0/b/swaim-test-2.appspot.com/o/AppImage%2FLogo%20black%20version150px.svg?alt=media&token=62d73500-3856-4883-8c7b-70562203234e',
                width: 150,
                height: 60,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'This help is for you',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF090F13),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
              child: Text(
                'Follow the links below and add some Notes or Explore places!',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: StreamBuilder<List<LabelsRecord>>(
                stream: queryLabelsRecord(
                  queryBuilder: (labelsRecord) =>
                      labelsRecord.where('name', isEqualTo: 'Not set'),
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
                  List<LabelsRecord> buttonLabelsRecordList = snapshot.data!;
                  // Return an empty Container when the document does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final buttonLabelsRecord = buttonLabelsRecordList.isNotEmpty
                      ? buttonLabelsRecordList.first
                      : null;
                  return FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(
                        'addSwaim',
                        queryParams: {
                          'initialLabel': serializeParam(
                            buttonLabelsRecord,
                            ParamType.Document,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'initialLabel': buttonLabelsRecord,
                        },
                      );
                    },
                    text: 'Add notes',
                    options: FFButtonOptions(
                      width: 170,
                      height: 50,
                      color: FlutterFlowTheme.of(context).yellowSwaim,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Lexend Deca',
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                      elevation: 2,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  setState(() {
                    FFAppState().isSwaimsMode = true;
                  });

                  context.pushNamed('NotesPage');
                },
                text: 'Explore places',
                options: FFButtonOptions(
                  width: 170,
                  height: 50,
                  color: FlutterFlowTheme.of(context).yellowSwaim,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Lexend Deca',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 2,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 100,
                decoration: BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'All features of the application are intuitive and if you do not agree, write to us about it in Contact Us in the menu please.\nBest Regards, by Swaim!',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Syne',
                              fontSize: 16,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
