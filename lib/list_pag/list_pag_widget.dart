import '../add_swaim/add_swaim_widget.dart';
import '../backend/backend.dart';
import '../burger_general_menu/burger_general_menu_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../map_page/map_page_widget.dart';
import '../note_info/note_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ListPagWidget extends StatefulWidget {
  const ListPagWidget({
    Key key,
    this.datanotes,
  }) : super(key: key);

  final ListsMapsDataNotesRecord datanotes;

  @override
  _ListPagWidgetState createState() => _ListPagWidgetState();
}

class _ListPagWidgetState extends State<ListPagWidget> {
  List<ListsMapsDataNotesRecord> algoliaSearchResults1 = [];
  TextEditingController courtSearchFieldController;
  List<ListsMapsDataNotesRecord> algoliaSearchResults2 = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    courtSearchFieldController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(-1, 1),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1, -1),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 107,
                    decoration: BoxDecoration(),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.92, -0.89),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BurgerGeneralMenuWidget(),
                        ),
                      );
                    },
                    text: '',
                    icon: Icon(
                      Icons.menu,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 15,
                    ),
                    options: FFButtonOptions(
                      width: 60,
                      height: 50,
                      color: Color(0xFFEEEEEE),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Overpass',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Color(0xFFEEEEEE),
                        width: 1,
                      ),
                      borderRadius: 8,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.82, 0.93),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BurgerGeneralMenuWidget(),
                        ),
                      );
                    },
                    text: '',
                    icon: Icon(
                      Icons.tune,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 15,
                    ),
                    options: FFButtonOptions(
                      width: 60,
                      height: 50,
                      color: Color(0xFFEEEEEE),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Overpass',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Color(0xFFEEEEEE),
                        width: 0,
                      ),
                      borderRadius: 0,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.02, 0.87),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 65,
                    fillColor: FlutterFlowTheme.of(context).tertiaryColor,
                    icon: Icon(
                      Icons.add_box_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddSwaimWidget(),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.88, 0.92),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapPageWidget(),
                        ),
                      );
                    },
                    text: '',
                    icon: FaIcon(
                      FontAwesomeIcons.map,
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                    options: FFButtonOptions(
                      width: 60,
                      height: 50,
                      color: Color(0xFFEEEEEE),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Overpass',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Color(0xFFEEEEEE),
                        width: 1,
                      ),
                      borderRadius: 8,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.74, -0.88),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(90, 0, 20, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            color: Color(0x34000000),
                            offset: Offset(0, 1),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).grayLines,
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, -0.3),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                          child: TextFormField(
                            controller: courtSearchFieldController,
                            onFieldSubmitted: (_) async {
                              setState(() => algoliaSearchResults1 = null);
                              await ListsMapsDataNotesRecord.search(
                                term: widget.datanotes.name,
                              )
                                  .then((r) => algoliaSearchResults1 = r)
                                  .onError(
                                      (_, __) => algoliaSearchResults1 = [])
                                  .whenComplete(() => setState(() {}));
                            },
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Overpass',
                                    color: Color(0xFF222235),
                                  ),
                              hintText: 'Search for interesting...',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Overpass',
                                    color: Color(0xCF222235),
                                  ),
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
                            ),
                            style:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Overpass',
                                      color: Color(0xCF222235),
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.86, -0.9),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 60,
                    icon: Icon(
                      Icons.location_searching,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 30,
                    ),
                    onPressed: () async {
                      setState(() => algoliaSearchResults2 = null);
                      await ListsMapsDataNotesRecord.search(
                        term: widget.datanotes.name,
                      )
                          .then((r) => algoliaSearchResults2 = r)
                          .onError((_, __) => algoliaSearchResults2 = [])
                          .whenComplete(() => setState(() {}));
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 110, 0, 120),
            child: StreamBuilder<List<ListsMapsDataNotesRecord>>(
              stream: queryListsMapsDataNotesRecord(),
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
                List<ListsMapsDataNotesRecord>
                    listViewListsMapsDataNotesRecordList = snapshot.data;
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewListsMapsDataNotesRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewListsMapsDataNotesRecord =
                        listViewListsMapsDataNotesRecordList[listViewIndex];
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NoteInfoWidget(),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 90,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 1, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            listViewListsMapsDataNotesRecord
                                                .name,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            listViewListsMapsDataNotesRecord
                                                .description,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            dateTimeFormat(
                                                'relative',
                                                listViewListsMapsDataNotesRecord
                                                    .createdAt),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Overpass',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: Icon(
                                        Icons.chevron_right_outlined,
                                        color: Color(0xFF95A1AC),
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ],
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
    );
  }
}
