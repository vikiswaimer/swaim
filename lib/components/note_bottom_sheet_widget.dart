import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NoteBottomSheetWidget extends StatefulWidget {
  const NoteBottomSheetWidget({
    Key? key,
    this.note,
  }) : super(key: key);

  final DocumentReference? note;

  @override
  _NoteBottomSheetWidgetState createState() => _NoteBottomSheetWidgetState();
}

class _NoteBottomSheetWidgetState extends State<NoteBottomSheetWidget> {
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
          height: 370,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: StreamBuilder<NotesRecord>(
            stream: NotesRecord.getDocument(widget.note!),
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
              final columnNotesRecord = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 20),
                      child: Container(
                        width: 50,
                        height: 4,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).lineColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    Text(
                      columnNotesRecord.name!,
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: Text(
                        columnNotesRecord.description!
                            .maybeHandleOverflow(maxChars: 100),
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                      child: StreamBuilder<LabelsRecord>(
                        stream:
                            LabelsRecord.getDocument(columnNotesRecord.label!),
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
                          final buttonLabelsRecord = snapshot.data!;
                          return FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                'editSwaim',
                                queryParams: {
                                  'note': serializeParam(
                                    columnNotesRecord.reference,
                                    ParamType.DocumentReference,
                                  ),
                                  'label': serializeParam(
                                    buttonLabelsRecord,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'label': buttonLabelsRecord,
                                },
                              );
                            },
                            text: 'More info',
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.of(context).yellowSwaim,
                              textStyle: FlutterFlowTheme.of(context).subtitle1,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
