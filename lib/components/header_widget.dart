import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFF1F4F8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 44, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 44,
                  icon: Icon(
                    Icons.menu_rounded,
                    color: Color(0xFF101213),
                    size: 24,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
                InkWell(
                  onTap: () async {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/userAvatar.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 16, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Hello,',
                  style: FlutterFlowTheme.of(context).title1.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF101213),
                        fontSize: 32,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                  child: Text(
                    'Maverick',
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF4B39EF),
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
            child: Text(
              'Below is the progress you have made this week.',
              style: FlutterFlowTheme.of(context).bodyText2.override(
                    fontFamily: 'Outfit',
                    color: Color(0xFF57636C),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
            child: Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x34090F13),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                      child: Text(
                        'Goals',
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              fontFamily: 'Outfit',
                              color: Color(0xFF57636C),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                    Text(
                      'Daily tracker',
                      style: FlutterFlowTheme.of(context).subtitle1.override(
                            fontFamily: 'Outfit',
                            color: Color(0xFF101213),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Progress',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              '4/10',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: LinearPercentIndicator(
                          percent: 0.4,
                          width: MediaQuery.of(context).size.width * 0.81,
                          lineHeight: 8,
                          animation: true,
                          progressColor: Color(0xFF4B39EF),
                          backgroundColor: Color(0xFFE0E3E7),
                          barRadius: Radius.circular(8),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
