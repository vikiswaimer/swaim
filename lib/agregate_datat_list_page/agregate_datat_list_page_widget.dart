import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/user_bottom_sheet_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:text_search/text_search.dart';

class AgregateDatatListPageWidget extends StatefulWidget {
  const AgregateDatatListPageWidget({Key? key}) : super(key: key);

  @override
  _AgregateDatatListPageWidgetState createState() =>
      _AgregateDatatListPageWidgetState();
}

class _AgregateDatatListPageWidgetState
    extends State<AgregateDatatListPageWidget> {
  ApiCallResponse? apiResult2um;
  ApiCallResponse? apiResultnsu;
  ApiCallResponse? apiResultAddAggregation;
  ApiCallResponse? apiResultRemoveAggregation;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<AggregationsRecord> simpleSearchResults = [];
  TextEditingController? textController;

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
        width: MediaQuery.of(context).size.width * 0.7,
        child: Drawer(
          elevation: 16,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 35, 0, 0),
                                child: Image.asset(
                                  'assets/images/Frame_8.png',
                                  height: 20,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              if (loggedIn)
                                InkWell(
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: Container(
                                            height: 300,
                                            child: UserBottomSheetWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24, 4, 0, 0),
                                        child: Text(
                                          currentUserEmail.maybeHandleOverflow(
                                            maxChars: 34,
                                            replacement: '…',
                                          ),
                                          maxLines: 2,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFFBFBFBF),
                                                fontSize: 12,
                                              ),
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 2,
                                        borderWidth: 0,
                                        buttonSize: 24,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          color: Color(0xFFBFBFBF),
                                          size: 10,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: Stack(
                            children: [
                              if (!FFAppState().isSettingsOpened)
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 30,
                                  icon: FaIcon(
                                    FontAwesomeIcons.ellipsisV,
                                    color: Color(0xFF808080),
                                    size: 14,
                                  ),
                                  onPressed: () async {
                                    setState(() =>
                                        FFAppState().isSettingsOpened = true);
                                  },
                                ),
                              if (FFAppState().isSettingsOpened)
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 30,
                                  icon: Icon(
                                    Icons.close,
                                    color: Color(0xFF808080),
                                    size: 14,
                                  ),
                                  onPressed: () async {
                                    setState(() =>
                                        FFAppState().isSettingsOpened = false);
                                  },
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!FFAppState().isSettingsOpened)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.8,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (FFAppState().isSwaimsMode)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  StreamBuilder<
                                      List<AggregationCategoriesRecord>>(
                                    stream: queryAggregationCategoriesRecord(),
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
                                      List<AggregationCategoriesRecord>
                                          listViewAggregationCategoriesRecordList =
                                          snapshot.data!;
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewAggregationCategoriesRecordList
                                                .length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewAggregationCategoriesRecord =
                                              listViewAggregationCategoriesRecordList[
                                                  listViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 4),
                                            child: InkWell(
                                              onTap: () async {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Filtered by this category',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                if (FFAppState()
                                                        .selectedSwaimsCategoriesInFilter
                                                        .contains(
                                                            listViewAggregationCategoriesRecord
                                                                .reference) ==
                                                    true) {
                                                  setState(() => FFAppState()
                                                      .selectedSwaimsCategoriesInFilter
                                                      .remove(
                                                          listViewAggregationCategoriesRecord
                                                              .reference));
                                                } else {
                                                  setState(() => FFAppState()
                                                      .selectedSwaimsCategoriesInFilter
                                                      .add(
                                                          listViewAggregationCategoriesRecord
                                                              .reference));
                                                }
                                              },
                                              child: Text(
                                                listViewAggregationCategoriesRecord
                                                    .name!,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: FFAppState()
                                                                  .selectedSwaimsCategoriesInFilter
                                                                  .contains(
                                                                      listViewAggregationCategoriesRecord
                                                                          .reference) ==
                                                              true
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .background
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .text2Gray,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  if (FFAppState().isSettingsOpened)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.8,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 28, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                child: Text(
                                  'Notifications',
                                  style: GoogleFonts.getFont(
                                    'Montserrat',
                                    color: Color(0xFF808080),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                child: Text(
                                  'Settings',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF808080),
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                child: Text(
                                  'Contact Us',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF808080),
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                child: Text(
                                  'FAQ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF808080),
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                child: InkWell(
                                  onTap: () async {
                                    await Share.share('https://swaim.com');
                                  },
                                  child: Text(
                                    'Share',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFF808080),
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                child: InkWell(
                                  onTap: () async {
                                    HapticFeedback.lightImpact();
                                  },
                                  child: Text(
                                    'Rate Us',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFF808080),
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  context.pushNamed('LoginAndSignup');
                                },
                                child: Text(
                                  'Sign Up/Login',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF808080),
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
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
              if (FFAppState().isGuideVisible)
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 90,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).grayDark,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(14, 6, 14, 0),
                          child: SelectionArea(
                              child: Text(
                            'Switch List and Map modes by double tap ',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF797979),
                                      fontSize: 16,
                                    ),
                          )),
                        ),
                        InkWell(
                          onTap: () async {
                            setState(() => FFAppState().isGuideVisible = false);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Color(0xFFCCCCCC),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SelectionArea(
                                    child: Text(
                                  'HIDE',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                      ),
                                )),
                              ],
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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.menu,
            color: FlutterFlowTheme.of(context).primaryColor,
            size: 30,
          ),
          onPressed: () async {
            scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: Stack(
          children: [
            if (FFAppState().isSearchModeOnSwaimsEnabled)
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: TextFormField(
                  controller: textController,
                  onChanged: (_) => EasyDebounce.debounce(
                    'textController',
                    Duration(milliseconds: 2000),
                    () async {
                      await queryAggregationsRecordOnce()
                          .then(
                            (records) => simpleSearchResults = TextSearch(
                              records
                                  .map(
                                    (record) =>
                                        TextSearchItem(record, [record.title!]),
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
                  ),
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Find a swaim...',
                    hintStyle: FlutterFlowTheme.of(context).bodyText2,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
            if (!FFAppState().isSearchModeOnSwaimsEnabled)
              Align(
                alignment: AlignmentDirectional(-0.06, 0.67),
                child: Text(
                  'LIST',
                  style: FlutterFlowTheme.of(context).title2,
                ),
              ),
          ],
        ),
        actions: [
          Visibility(
            visible: FFAppState().isSwaimsMode,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
              child: ToggleIcon(
                onPressed: () async {
                  setState(() => FFAppState().isSearchModeOnSwaimsEnabled =
                      !FFAppState().isSearchModeOnSwaimsEnabled);
                },
                value: FFAppState().isSearchModeOnSwaimsEnabled,
                onIcon: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 20,
                ),
                offIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 60),
              child: StreamBuilder<List<AggregationsRecord>>(
                stream: queryAggregationsRecord(
                  queryBuilder: (aggregationsRecord) => aggregationsRecord
                      .whereIn(
                          'title',
                          simpleSearchResults
                              .map((e) => e.title!)
                              .toList()
                              .where((e) => e != null && e != '')
                              .toList())
                      .where('title', isNotEqualTo: 'null'),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: SpinKitRipple(
                          color: FlutterFlowTheme.of(context).yellowSwaim,
                          size: 40,
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
                      return Visibility(
                        visible: FFAppState()
                                .selectedSwaimsCategoriesInFilter
                                .contains(
                                    listViewAggregationsRecord.category) ||
                            (FFAppState()
                                    .selectedSwaimsCategoriesInFilter
                                    .length ==
                                0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
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
                            child: ClipRRect(
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.55,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 10, 0, 5),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            listViewAggregationsRecord.title!
                                                .maybeHandleOverflow(
                                                    maxChars: 15),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .title3,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 0, 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          StreamBuilder<
                                              AggregationCategoriesRecord>(
                                            stream: AggregationCategoriesRecord
                                                .getDocument(
                                                    listViewAggregationsRecord
                                                        .category!),
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
                                              final textAggregationCategoriesRecord =
                                                  snapshot.data!;
                                              return SelectionArea(
                                                  child: Text(
                                                textAggregationCategoriesRecord
                                                    .name!,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .yellowSwaim,
                                                      fontSize: 14,
                                                    ),
                                              ));
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        Image.network(
                                          listViewAggregationsRecord.picture!,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                          fit: BoxFit.cover,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.87, -0.88),
                                          child: StreamBuilder<
                                              List<FavoriteAggregationsRecord>>(
                                            stream:
                                                queryFavoriteAggregationsRecord(
                                              queryBuilder: (favoriteAggregationsRecord) =>
                                                  favoriteAggregationsRecord
                                                      .where('userId',
                                                          isEqualTo:
                                                              currentUserReference)
                                                      .where('aggregation',
                                                          isEqualTo:
                                                              listViewAggregationsRecord
                                                                  .reference),
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
                                                  containerFavoriteAggregationsRecordList =
                                                  snapshot.data!;
                                              return Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                ),
                                                child: Stack(
                                                  children: [
                                                    if (containerFavoriteAggregationsRecordList
                                                            .length ==
                                                        1)
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 20,
                                                        borderWidth: 0,
                                                        buttonSize: 40,
                                                        icon: Icon(
                                                          Icons
                                                              .star_rate_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24,
                                                        ),
                                                        onPressed: () async {
                                                          if (containerFavoriteAggregationsRecordList
                                                                  .length ==
                                                              1) {
                                                            apiResultRemoveAggregation =
                                                                await RemoveAggregationFromFavesCall
                                                                    .call(
                                                              favAggregationId: functions.getFavAggregationId(
                                                                  containerFavoriteAggregationsRecordList
                                                                      .map((e) =>
                                                                          e.reference)
                                                                      .toList()),
                                                            );
                                                          } else {
                                                            apiResultAddAggregation =
                                                                await AddAggregationToFavesCall
                                                                    .call(
                                                              aggregationId: functions
                                                                  .getIdFromAggregation(
                                                                      listViewAggregationsRecord
                                                                          .reference),
                                                              userId:
                                                                  currentUserUid,
                                                            );
                                                          }

                                                          setState(() {});
                                                        },
                                                      ),
                                                    if (containerFavoriteAggregationsRecordList
                                                            .length !=
                                                        1)
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 20,
                                                        borderWidth: 0,
                                                        buttonSize: 40,
                                                        icon: Icon(
                                                          Icons
                                                              .star_outline_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24,
                                                        ),
                                                        onPressed: () async {
                                                          if (containerFavoriteAggregationsRecordList
                                                                  .length ==
                                                              1) {
                                                            apiResultnsu =
                                                                await RemoveAggregationFromFavesCall
                                                                    .call(
                                                              favAggregationId: functions.getFavAggregationId(
                                                                  containerFavoriteAggregationsRecordList
                                                                      .map((e) =>
                                                                          e.reference)
                                                                      .toList()),
                                                            );
                                                          } else {
                                                            apiResult2um =
                                                                await AddAggregationToFavesCall
                                                                    .call(
                                                              aggregationId: functions
                                                                  .getIdFromAggregation(
                                                                      listViewAggregationsRecord
                                                                          .reference),
                                                              userId:
                                                                  currentUserUid,
                                                            );
                                                          }

                                                          setState(() {});
                                                        },
                                                      ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 10, 0, 0),
                                      child: Text(
                                        listViewAggregationsRecord.description!
                                            .maybeHandleOverflow(
                                          maxChars: 60,
                                          replacement: '…',
                                        ),
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            if (FFAppState().isSwaimsMode)
              Align(
                alignment: AlignmentDirectional(0.86, 0.88),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0x00EEEEEE),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x33000000),
                        offset: Offset(0, 2),
                        spreadRadius: 3,
                      )
                    ],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Align(
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
                              width: 30,
                              height: 30,
                              child: SpinKitRipple(
                                color: Color(0x80E8AA21),
                                size: 30,
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
                        return InkWell(
                          onDoubleTap: () async {
                            context.pushNamed('MapPage');
                          },
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 0,
                            buttonSize: 60,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBtnText,
                            icon: Icon(
                              Icons.star_rate_rounded,
                              color: Color(0xFF747474),
                              size: 30,
                            ),
                            onPressed: () async {
                              context.pushNamed('FavoriteAggregationsListPage');
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            if (FFAppState().isSwaimsMode)
              Align(
                alignment: AlignmentDirectional(0, -0.97),
                child: Container(
                  width: double.infinity,
                  height: 30,
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                          child: Builder(
                            builder: (context) {
                              final bbbb = FFAppState()
                                  .selectedSwaimsCategoriesInFilter
                                  .map((e) => e)
                                  .toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: bbbb.length,
                                itemBuilder: (context, bbbbIndex) {
                                  final bbbbItem = bbbb[bbbbIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        6, 2, 6, 2),
                                    child: InkWell(
                                      onTap: () async {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Filtered by this category',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor: Color(0x00000000),
                                          ),
                                        );
                                        if (FFAppState()
                                                .selectedSwaimsCategoriesInFilter
                                                .contains(bbbbItem) ==
                                            true) {
                                          setState(() => FFAppState()
                                              .selectedSwaimsCategoriesInFilter
                                              .remove(bbbbItem));
                                        } else {
                                          setState(() => FFAppState()
                                              .selectedSwaimsCategoriesInFilter
                                              .add(bbbbItem));
                                        }
                                      },
                                      child: Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .yellowSwaim,
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .yellowSwaim,
                                            width: 2,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4, 0, 0, 0),
                                              child: StreamBuilder<
                                                  AggregationCategoriesRecord>(
                                                stream:
                                                    AggregationCategoriesRecord
                                                        .getDocument(bbbbItem),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 30,
                                                        height: 30,
                                                        child: SpinKitRipple(
                                                          color:
                                                              Color(0x80E8AA21),
                                                          size: 30,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final textAggregationCategoriesRecord =
                                                      snapshot.data!;
                                                  return Text(
                                                    textAggregationCategoriesRecord
                                                        .name!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2,
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4, 0, 4, 0),
                                              child: Icon(
                                                Icons.close,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                size: 12,
                                              ),
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
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
