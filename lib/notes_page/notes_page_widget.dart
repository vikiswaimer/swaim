import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/backend.dart';
import '../components/empty_list_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';

class NotesPageWidget extends StatefulWidget {
  const NotesPageWidget({
    Key? key,
    this.notes,
  }) : super(key: key);

  final NotesRecord? notes;

  @override
  _NotesPageWidgetState createState() => _NotesPageWidgetState();
}

class _NotesPageWidgetState extends State<NotesPageWidget> {
  List<NotesRecord> simpleSearchResults = [];
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
    return StreamBuilder<List<AggregationsRecord>>(
      stream: queryAggregationsRecord(
        queryBuilder: (aggregationsRecord) =>
            aggregationsRecord.where('title', isEqualTo: 'null'),
        singleRecord: true,
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
        List<AggregationsRecord> notesPageAggregationsRecordList =
            snapshot.data!;
        // Return an empty Container when the document does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final notesPageAggregationsRecord =
            notesPageAggregationsRecordList.isNotEmpty
                ? notesPageAggregationsRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Stack(
            children: [
              Padding(
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                              child: Container(
                                width: 275,
                                child: TextFormField(
                                  controller: textController,
                                  onFieldSubmitted: (_) async {
                                    await queryNotesRecordOnce()
                                        .then(
                                          (records) => simpleSearchResults =
                                              TextSearch(
                                            records
                                                .map(
                                                  (record) => TextSearchItem(
                                                      record, [record.name!]),
                                                )
                                                .toList(),
                                          )
                                                  .search(textController!.text)
                                                  .map((r) => r.object)
                                                  .toList(),
                                        )
                                        .onError(
                                            (_, __) => simpleSearchResults = [])
                                        .whenComplete(() => setState(() {}));
                                  },
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Find a swaim',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
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
                                        EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 14, 0),
                                    suffixIcon: Icon(
                                      Icons.search,
                                      color: Color(0xFF222235),
                                      size: 16,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
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
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.76),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(1, 5, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                          child: Container(
                            width: 120,
                            height: 50,
                            decoration: BoxDecoration(
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x7F222235),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Text(
                                      'Want to visit',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                          child: Container(
                            width: 120,
                            height: 50,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x7F222235),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Text(
                                      'Need to buy',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                          child: Container(
                            width: 120,
                            height: 50,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x7F222235),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Text(
                                      'Photo vie-points',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                          child: Container(
                            width: 120,
                            height: 50,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x7F222235),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Text(
                                      'Favorite stores',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                          child: Container(
                            width: 120,
                            height: 50,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x7F222235),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Text(
                                      'Art places',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                          child: Container(
                            width: 120,
                            height: 50,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x7F222235),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Text(
                                      'Add to Categories',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
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
                ),
              ),
              if (loggedIn)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 155, 10, 120),
                  child: StreamBuilder<List<NotesRecord>>(
                    stream: queryNotesRecord(
                      queryBuilder: (notesRecord) => notesRecord
                          .where('user', isEqualTo: currentUserReference)
                          .whereIn('name',
                              simpleSearchResults.map((e) => e.name!).toList()),
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
                      List<NotesRecord> listViewNotesRecordList =
                          snapshot.data!;
                      if (listViewNotesRecordList.isEmpty) {
                        return EmptyListWidget();
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewNotesRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewNotesRecord =
                              listViewNotesRecordList[listViewIndex];
                          return InkWell(
                            onTap: () async {
                              context.pushNamed(
                                'NoteInfo',
                                queryParams: {
                                  'notes': serializeParam(
                                    listViewNotesRecord.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: AutoSizeText(
                                                  listViewNotesRecord.name!
                                                      .maybeHandleOverflow(
                                                    maxChars: 40,
                                                    replacement: '…',
                                                  ),
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (listViewNotesRecord.swaimRef !=
                                            notesPageAggregationsRecord!
                                                .reference)
                                          StreamBuilder<AggregationsRecord>(
                                            stream:
                                                AggregationsRecord.getDocument(
                                                    listViewNotesRecord
                                                        .swaimRef!),
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
                                              final containerAggregationsRecord =
                                                  snapshot.data!;
                                              return Container(
                                                width: 100,
                                                height: 28,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 24,
                                                        height: 24,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          containerAggregationsRecord
                                                              .picture!,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    0, 0),
                                                        child: Text(
                                                          containerAggregationsRecord
                                                              .title!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 8, 0),
                                          child: Icon(
                                            Icons.chevron_right_outlined,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              Align(
                alignment: AlignmentDirectional(0.86, 0.76),
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
                          width: 60,
                          height: 60,
                          child: SpinKitRipple(
                            color: Color(0xFF222235),
                            size: 60,
                          ),
                        ),
                      );
                    }
                    List<LabelsRecord> iconButtonLabelsRecordList =
                        snapshot.data!;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final iconButtonLabelsRecord =
                        iconButtonLabelsRecordList.isNotEmpty
                            ? iconButtonLabelsRecordList.first
                            : null;
                    return FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      fillColor: FlutterFlowTheme.of(context).background,
                      icon: Icon(
                        Icons.add,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30,
                      ),
                      onPressed: () async {
                        context.pushNamed(
                          'addSwaim',
                          queryParams: {
                            'initialLabel': serializeParam(
                              iconButtonLabelsRecord,
                              ParamType.Document,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'initialLabel': iconButtonLabelsRecord,
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
