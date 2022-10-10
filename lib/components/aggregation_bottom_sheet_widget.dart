import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AggregationBottomSheetWidget extends StatefulWidget {
  const AggregationBottomSheetWidget({
    Key? key,
    this.aggregation,
  }) : super(key: key);

  final DocumentReference? aggregation;

  @override
  _AggregationBottomSheetWidgetState createState() =>
      _AggregationBottomSheetWidgetState();
}

class _AggregationBottomSheetWidgetState
    extends State<AggregationBottomSheetWidget> {
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
        child: StreamBuilder<AggregationsRecord>(
          stream: AggregationsRecord.getDocument(widget.aggregation!),
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
            final columnAggregationsRecord = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Container(
                          width: 280,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFFE0E3E7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.network(
                            columnAggregationsRecord.picture!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Text(
                      columnAggregationsRecord.title!,
                      style: FlutterFlowTheme.of(context).title2.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF101213),
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Text(
                      columnAggregationsRecord.description!,
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF57636C),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(
                        'AggregationInfo',
                        queryParams: {
                          'aggregation': serializeParam(
                            columnAggregationsRecord.reference,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                      );
                    },
                    text: 'Go!',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Overpass',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
