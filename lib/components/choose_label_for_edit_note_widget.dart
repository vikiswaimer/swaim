import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/popup_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
      child: Material(
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
            crossAxisAlignment: CrossAxisAlignment.center,
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
                padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                        child: StreamBuilder<List<LabelsRecord>>(
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
                                  width: 30,
                                  height: 30,
                                  child: SpinKitRipple(
                                    color: Color(0x80E8AA21),
                                    size: 30,
                                  ),
                                ),
                              );
                            }
                            List<LabelsRecord> defaultLabelsLabelsRecordList =
                                snapshot.data!;
                            return Wrap(
                              spacing: 0,
                              runSpacing: 0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: List.generate(
                                  defaultLabelsLabelsRecordList.length,
                                  (defaultLabelsIndex) {
                                final defaultLabelsLabelsRecord =
                                    defaultLabelsLabelsRecordList[
                                        defaultLabelsIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 4, 0, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      setState(() {
                                        FFAppState().labelInEditSwaim =
                                            defaultLabelsLabelsRecord.reference;
                                      });
                                      Navigator.pop(context);
                                    },
                                    text: defaultLabelsLabelsRecord.name!,
                                    options: FFButtonOptions(
                                      width: 100,
                                      height: 26,
                                      color: FlutterFlowTheme.of(context)
                                          .yellowSwaim,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                          ),
                                      borderSide: BorderSide(
                                        color: Color(0x00E8AA21),
                                        width: 0,
                                      ),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                        child: StreamBuilder<List<LabelsRecord>>(
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
                                  width: 30,
                                  height: 30,
                                  child: SpinKitRipple(
                                    color: Color(0x80E8AA21),
                                    size: 30,
                                  ),
                                ),
                              );
                            }
                            List<LabelsRecord> customLabelsLabelsRecordList =
                                snapshot.data!;
                            return Wrap(
                              spacing: 0,
                              runSpacing: 0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: List.generate(
                                  customLabelsLabelsRecordList.length,
                                  (customLabelsIndex) {
                                final customLabelsLabelsRecord =
                                    customLabelsLabelsRecordList[
                                        customLabelsIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 4, 0, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      setState(() {
                                        FFAppState().labelInEditSwaim =
                                            customLabelsLabelsRecord.reference;
                                      });
                                      Navigator.pop(context);
                                    },
                                    text: customLabelsLabelsRecord.name!,
                                    options: FFButtonOptions(
                                      width: 100,
                                      height: 26,
                                      color: FlutterFlowTheme.of(context)
                                          .yellowSwaim,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: PopupWidget(),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                          text: 'Add',
                          icon: Icon(
                            Icons.add,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 100,
                            height: 30,
                            color: FlutterFlowTheme.of(context).yellowSwaim,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).yellowSwaim,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
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
      ),
    );
  }
}
