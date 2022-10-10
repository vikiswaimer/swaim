import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:text_search/text_search.dart';

class AgregateDatatListPageWidget extends StatefulWidget {
  const AgregateDatatListPageWidget({
    Key? key,
    this.aggregations,
  }) : super(key: key);

  final DocumentReference? aggregations;

  @override
  _AgregateDatatListPageWidgetState createState() =>
      _AgregateDatatListPageWidgetState();
}

class _AgregateDatatListPageWidgetState
    extends State<AgregateDatatListPageWidget> {
  List<AggregationsRecord> simpleSearchResults = [];
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Drawer(
          elevation: 16,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 24, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 35, 0, 0),
                      child: Image.asset(
                        'assets/images/Frame_8.png',
                        height: 20,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 15,
                      borderWidth: 1,
                      buttonSize: 30,
                      icon: Icon(
                        Icons.chevron_left,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 15,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 10, 24, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).darkBG,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 28, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notifications',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Overpass',
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                          ),
                    ),
                    Text(
                      'Settings',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Overpass',
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                          ),
                    ),
                    Text(
                      'Contact Us',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Overpass',
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                          ),
                    ),
                    Text(
                      'FAQ',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Overpass',
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                          ),
                    ),
                    InkWell(
                      onTap: () async {
                        await Share.share('https://swaim.com');
                      },
                      child: Text(
                        'Share',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Overpass',
                              fontSize: 18,
                              fontWeight: FontWeight.w200,
                            ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        HapticFeedback.lightImpact();
                      },
                      child: Text(
                        'Rate Us',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Overpass',
                              fontSize: 18,
                              fontWeight: FontWeight.w200,
                            ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        context.pushNamed('LoginAndSignup');
                      },
                      child: Text(
                        'Sign Up/Login',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Overpass',
                              fontSize: 18,
                              fontWeight: FontWeight.w200,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              if (loggedIn)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 10, 24, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).darkBG,
                    ),
                  ),
                ),
              if (loggedIn)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 24, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 14, 0, 0),
                        child: Text(
                          'Signed as ',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Overpass',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200,
                                  ),
                        ),
                      ),
                      Text(
                        currentUserEmail.maybeHandleOverflow(
                          maxChars: 40,
                          replacement: '…',
                        ),
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Overpass',
                              fontSize: 12,
                            ),
                      ),
                    ],
                  ),
                ),
              if (loggedIn)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 6, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      GoRouter.of(context).prepareAuthEvent();
                      await signOut();

                      context.goNamedAuth('WelcomePage', mounted);
                    },
                    child: Text(
                      'Log out',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Overpass',
                            color: Color(0xFFCA235E),
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                          ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: FlutterFlowIconButton(
                      borderColor: Color(0xFF222235),
                      borderRadius: 5,
                      borderWidth: 2,
                      buttonSize: 48,
                      fillColor: Color(0xE7E6E2BA),
                      icon: Icon(
                        Icons.menu,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 26,
                      ),
                      onPressed: () async {
                        scaffoldKey.currentState!.openDrawer();
                      },
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Container(
                        width: 275,
                        child: TextFormField(
                          controller: textController,
                          onFieldSubmitted: (_) async {
                            await queryAggregationsRecordOnce()
                                .then(
                                  (records) => simpleSearchResults = TextSearch(
                                    records
                                        .map(
                                          (record) => TextSearchItem(
                                              record, [record.title!]),
                                        )
                                        .toList(),
                                  )
                                      .search(textController!.text)
                                      .map((r) => r.object)
                                      .toList(),
                                )
                                .onError((_, __) => simpleSearchResults = [])
                                .whenComplete(() => setState(() {}));
                          },
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Find a swaim',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            filled: true,
                            fillColor: Color(0xE7E6E2BA),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 14, 0),
                            suffixIcon: Icon(
                              Icons.search,
                              color: Color(0xFF222235),
                              size: 16,
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Overpass',
                                    color: Color(0xFF222235),
                                    fontSize: 16,
                                    lineHeight: 1,
                                  ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5, 110, 5, 120),
              child: StreamBuilder<List<AggregationsRecord>>(
                stream: queryAggregationsRecord(
                  queryBuilder: (aggregationsRecord) =>
                      aggregationsRecord.whereIn('title',
                          simpleSearchResults.map((e) => e.title!).toList()),
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
                  List<AggregationsRecord> listViewAggregationsRecordList =
                      snapshot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewAggregationsRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewAggregationsRecord =
                          listViewAggregationsRecordList[listViewIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 1),
                        child: InkWell(
                          onTap: () async {
                            context.pushNamed(
                              'AggregationInfo',
                              queryParams: {
                                'aggregation': serializeParam(
                                  listViewAggregationsRecord.reference,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 460,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.network(
                                  listViewAggregationsRecord.picture!,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Text(
                                    listViewAggregationsRecord.title!,
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Overpass',
                                          fontSize: 24,
                                        ),
                                  ),
                                ),
                                StreamBuilder<CountriesRecord>(
                                  stream: CountriesRecord.getDocument(
                                      listViewAggregationsRecord.country!),
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
                                    final containerCountriesRecord =
                                        snapshot.data!;
                                    return Container(
                                      width: 100,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 5),
                                        child: Text(
                                          containerCountriesRecord.name!,
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Overpass',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .background,
                                              ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Text(
                                  listViewAggregationsRecord.description!,
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.85, 0.75),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                fillColor: FlutterFlowTheme.of(context).background,
                icon: Icon(
                  Icons.star_rate_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30,
                ),
                onPressed: () async {
                  context.pushNamed('FavoriteAggregationsListPage');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
