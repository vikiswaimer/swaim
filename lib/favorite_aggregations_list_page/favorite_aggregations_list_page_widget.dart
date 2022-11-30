import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_list_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteAggregationsListPageWidget extends StatefulWidget {
  const FavoriteAggregationsListPageWidget({Key? key}) : super(key: key);

  @override
  _FavoriteAggregationsListPageWidgetState createState() =>
      _FavoriteAggregationsListPageWidgetState();
}

class _FavoriteAggregationsListPageWidgetState
    extends State<FavoriteAggregationsListPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.chevron_left,
            color: FlutterFlowTheme.of(context).primaryColor,
            size: 30,
          ),
          onPressed: () async {
            context.pushNamed('NotesPage');
          },
        ),
        title: Text(
          'Swaims',
          style: FlutterFlowTheme.of(context).title2,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
            child: Stack(
              children: [],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 10),
            child: StreamBuilder<List<FavoriteAggregationsRecord>>(
              stream: queryFavoriteAggregationsRecord(
                queryBuilder: (favoriteAggregationsRecord) =>
                    favoriteAggregationsRecord.where('userId',
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
                List<FavoriteAggregationsRecord>
                    listViewFavoriteAggregationsRecordList = snapshot.data!;
                if (listViewFavoriteAggregationsRecordList.isEmpty) {
                  return EmptyListWidget();
                }
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewFavoriteAggregationsRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewFavoriteAggregationsRecord =
                        listViewFavoriteAggregationsRecordList[listViewIndex];
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 1),
                      child: StreamBuilder<LabelsRecord>(
                        stream: LabelsRecord.getDocument(
                            listViewFavoriteAggregationsRecord.labelRef!),
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
                          final storeListViewLabelsRecord = snapshot.data!;
                          return InkWell(
                            onTap: () async {
                              context.pushNamed(
                                'FavoriteSwaimPage',
                                queryParams: {
                                  'swaimRef': serializeParam(
                                    listViewFavoriteAggregationsRecord
                                        .reference,
                                    ParamType.DocumentReference,
                                  ),
                                  'favAggregation': serializeParam(
                                    listViewFavoriteAggregationsRecord,
                                    ParamType.Document,
                                  ),
                                  'label': serializeParam(
                                    listViewFavoriteAggregationsRecord.labelRef,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'favAggregation':
                                      listViewFavoriteAggregationsRecord,
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                  ),
                                },
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 460,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  StreamBuilder<AggregationsRecord>(
                                    stream: AggregationsRecord.getDocument(
                                        listViewFavoriteAggregationsRecord
                                            .aggregation!),
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
                                      final imageAggregationsRecord =
                                          snapshot.data!;
                                      return Image.network(
                                        imageAggregationsRecord.picture!,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 0),
                                    child: StreamBuilder<AggregationsRecord>(
                                      stream: AggregationsRecord.getDocument(
                                          listViewFavoriteAggregationsRecord
                                              .aggregation!),
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
                                        final textAggregationsRecord =
                                            snapshot.data!;
                                        return Text(
                                          textAggregationsRecord.title!,
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                fontSize: 24,
                                              ),
                                        );
                                      },
                                    ),
                                  ),
                                  if (storeListViewLabelsRecord.name !=
                                      'Not set')
                                    StreamBuilder<AggregationsRecord>(
                                      stream: AggregationsRecord.getDocument(
                                          listViewFavoriteAggregationsRecord
                                              .aggregation!),
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
                                        final containerAggregationsRecord =
                                            snapshot.data!;
                                        return Container(
                                          width: 100,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .background,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                storeListViewLabelsRecord.name!,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: StreamBuilder<AggregationsRecord>(
                                      stream: AggregationsRecord.getDocument(
                                          listViewFavoriteAggregationsRecord
                                              .aggregation!),
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
                                        final textAggregationsRecord =
                                            snapshot.data!;
                                        return Text(
                                          textAggregationsRecord.description!
                                              .maybeHandleOverflow(
                                            maxChars: 100,
                                            replacement: '…',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
