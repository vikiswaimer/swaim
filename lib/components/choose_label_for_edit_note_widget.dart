import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseLabelForEditNoteWidget extends StatefulWidget {
  const ChooseLabelForEditNoteWidget({Key? key}) : super(key: key);

  @override
  _ChooseLabelForEditNoteWidgetState createState() =>
      _ChooseLabelForEditNoteWidgetState();
}

class _ChooseLabelForEditNoteWidgetState
    extends State<ChooseLabelForEditNoteWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: Container(
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  color: Color(0xFFDBE2E7),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          StreamBuilder<List<LabelsRecord>>(
                            stream: queryLabelsRecord(
                              queryBuilder: (labelsRecord) => labelsRecord
                                  .where('is_base', isEqualTo: true)
                                  .where('name', isNotEqualTo: 'Not set'),
                            ),
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
                              List<LabelsRecord> defaultLabelsLabelsRecordList =
                                  snapshot.data!;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: defaultLabelsLabelsRecordList.length,
                                itemBuilder: (context, defaultLabelsIndex) {
                                  final defaultLabelsLabelsRecord =
                                      defaultLabelsLabelsRecordList[
                                          defaultLabelsIndex];
                                  return FFButtonWidget(
                                    onPressed: () async {
                                      setState(() => FFAppState()
                                              .labelInEditSwaim =
                                          defaultLabelsLabelsRecord.reference);
                                      Navigator.pop(context);
                                    },
                                    text: defaultLabelsLabelsRecord.name!,
                                    options: FFButtonOptions(
                                      width: 130,
                                      height: 40,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Overpass',
                                            color: Colors.white,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          StreamBuilder<List<LabelsRecord>>(
                            stream: queryLabelsRecord(
                              queryBuilder: (labelsRecord) => labelsRecord
                                  .where('is_base', isEqualTo: false)
                                  .where('userId',
                                      isEqualTo: currentUserReference),
                            ),
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
                              List<LabelsRecord> customLabelsLabelsRecordList =
                                  snapshot.data!;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: customLabelsLabelsRecordList.length,
                                itemBuilder: (context, customLabelsIndex) {
                                  final customLabelsLabelsRecord =
                                      customLabelsLabelsRecordList[
                                          customLabelsIndex];
                                  return FFButtonWidget(
                                    onPressed: () async {
                                      setState(() => FFAppState()
                                              .labelInEditSwaim =
                                          customLabelsLabelsRecord.reference);
                                      Navigator.pop(context);
                                    },
                                    text: customLabelsLabelsRecord.name!,
                                    options: FFButtonOptions(
                                      width: 130,
                                      height: 40,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Overpass',
                                            color: Colors.white,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
