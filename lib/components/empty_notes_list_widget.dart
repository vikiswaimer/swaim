import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyNotesListWidget extends StatefulWidget {
  const EmptyNotesListWidget({Key? key}) : super(key: key);

  @override
  _EmptyNotesListWidgetState createState() => _EmptyNotesListWidgetState();
}

class _EmptyNotesListWidgetState extends State<EmptyNotesListWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.crop_free_rounded,
          color: Color(0xFF7C8791),
          size: 90,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Seems you don’t have any notes',
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
            'Follow the link below and add some',
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
                text: 'Go!',
                options: FFButtonOptions(
                  width: 170,
                  height: 50,
                  color: Color(0xFF4B39EF),
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
              );
            },
          ),
        ),
      ],
    );
  }
}
