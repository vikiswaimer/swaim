import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseLabelWidget extends StatefulWidget {
  const ChooseLabelWidget({
    Key? key,
    this.swaimRef,
  }) : super(key: key);

  final FavoriteAggregationsRecord? swaimRef;

  @override
  _ChooseLabelWidgetState createState() => _ChooseLabelWidgetState();
}

class _ChooseLabelWidgetState extends State<ChooseLabelWidget> {
  ApiCallResponse? apiResultypt;
  ApiCallResponse? setLabelForSwaim;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<LabelsRecord>(
      stream: LabelsRecord.getDocument(widget.swaimRef!.labelRef!),
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
        final containerLabelsRecord = snapshot.data!;
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
                                  List<LabelsRecord>
                                      defaultLabelsLabelsRecordList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        defaultLabelsLabelsRecordList.length,
                                    itemBuilder: (context, defaultLabelsIndex) {
                                      final defaultLabelsLabelsRecord =
                                          defaultLabelsLabelsRecordList[
                                              defaultLabelsIndex];
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          setLabelForSwaim =
                                              await SetLabelForSwaimCall.call(
                                            swaimId: functions
                                                .getFavAggregationIdFromSingleRef(
                                                    widget.swaimRef!.reference),
                                            labelId: functions.getLabelId(
                                                defaultLabelsLabelsRecord
                                                    .reference),
                                            userId: currentUserUid,
                                            aggregationId: functions
                                                .getAggregationIdFromSwaim(
                                                    widget.swaimRef!),
                                          );
                                          if ((setLabelForSwaim?.succeeded ??
                                              true)) {
                                            Navigator.pop(context);

                                            context.pushNamed(
                                              'FavoriteSwaimPage',
                                              queryParams: {
                                                'favAggregation':
                                                    serializeParam(
                                                  widget.swaimRef,
                                                  ParamType.Document,
                                                ),
                                                'swaimRef': serializeParam(
                                                  widget.swaimRef!.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                                'label': serializeParam(
                                                  defaultLabelsLabelsRecord
                                                      .reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'favAggregation':
                                                    widget.swaimRef,
                                              },
                                            );

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Label has been updated',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    Color(0x00000000),
                                              ),
                                            );
                                          } else {
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Couldn\'t set label',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    Color(0x00000000),
                                              ),
                                            );
                                          }

                                          setState(() {});
                                        },
                                        text: defaultLabelsLabelsRecord.name!,
                                        options: FFButtonOptions(
                                          width: 130,
                                          height: 40,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Overpass',
                                                    color: Colors.white,
                                                  ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                  List<LabelsRecord>
                                      customLabelsLabelsRecordList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        customLabelsLabelsRecordList.length,
                                    itemBuilder: (context, customLabelsIndex) {
                                      final customLabelsLabelsRecord =
                                          customLabelsLabelsRecordList[
                                              customLabelsIndex];
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          apiResultypt =
                                              await SetLabelForSwaimCall.call(
                                            swaimId: functions
                                                .getFavAggregationIdFromSingleRef(
                                                    widget.swaimRef!.reference),
                                            labelId: functions.getLabelId(
                                                customLabelsLabelsRecord
                                                    .reference),
                                            userId: currentUserUid,
                                            aggregationId: functions
                                                .getAggregationIdFromSwaim(
                                                    widget.swaimRef!),
                                          );
                                          if ((setLabelForSwaim?.succeeded ??
                                              true)) {
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Label has been updated',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    Color(0x00000000),
                                              ),
                                            );
                                          } else {
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Couldn\'t set label',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    Color(0x00000000),
                                              ),
                                            );
                                          }

                                          setState(() {});
                                        },
                                        text: customLabelsLabelsRecord.name!,
                                        options: FFButtonOptions(
                                          width: 130,
                                          height: 40,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Overpass',
                                                    color: Colors.white,
                                                  ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
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
      },
    );
  }
}
