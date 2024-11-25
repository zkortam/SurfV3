import '/backend/backend.dart';
import '/components/snippet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'snippets_model.dart';
export 'snippets_model.dart';

class SnippetsWidget extends StatefulWidget {
  const SnippetsWidget({
    super.key,
    required this.author,
  });

  final DocumentReference? author;

  @override
  State<SnippetsWidget> createState() => _SnippetsWidgetState();
}

class _SnippetsWidgetState extends State<SnippetsWidget> {
  late SnippetsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SnippetsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<SnippetsRecord>>(
            stream: querySnippetsRecord(
              queryBuilder: (snippetsRecord) => snippetsRecord
                  .where(
                    'author',
                    isEqualTo: widget!.author,
                  )
                  .where(
                    'timeCloses',
                    isGreaterThan: getCurrentTimestamp,
                  ),
            )..listen((snapshot) {
                List<SnippetsRecord> pageViewSnippetsRecordList = snapshot;
                if (_model.pageViewPreviousSnapshot != null &&
                    !const ListEquality(SnippetsRecordDocumentEquality())
                        .equals(pageViewSnippetsRecordList,
                            _model.pageViewPreviousSnapshot)) {
                  () async {}();
                }
                _model.pageViewPreviousSnapshot = snapshot;
              }),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: SpinKitFadingFour(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 40.0,
                    ),
                  ),
                );
              }
              List<SnippetsRecord> pageViewSnippetsRecordList = snapshot.data!;

              return Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 1.0,
                child: PageView.builder(
                  controller: _model.pageViewController ??= PageController(
                      initialPage: max(
                          0, min(0, pageViewSnippetsRecordList.length - 1))),
                  onPageChanged: (_) => safeSetState(() {}),
                  scrollDirection: Axis.horizontal,
                  itemCount: pageViewSnippetsRecordList.length,
                  itemBuilder: (context, pageViewIndex) {
                    final pageViewSnippetsRecord =
                        pageViewSnippetsRecordList[pageViewIndex];
                    return Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SnippetWidget(
                              key: Key(
                                  'Keyk6b_${pageViewIndex}_of_${pageViewSnippetsRecordList.length}'),
                              snippet: pageViewSnippetsRecord,
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await _model.pageViewController
                                            ?.previousPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.5,
                                        height: 1000.0,
                                        decoration: BoxDecoration(),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await _model.pageViewController
                                            ?.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.5,
                                        height: 1000.0,
                                        decoration: BoxDecoration(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
