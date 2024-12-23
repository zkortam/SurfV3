import '/backend/backend.dart';
import '/components/loading_widget.dart';
import '/components/nav_bar_shorts_widget.dart';
import '/components/short_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'shorts_model.dart';
export 'shorts_model.dart';

class ShortsWidget extends StatefulWidget {
  const ShortsWidget({super.key});

  @override
  State<ShortsWidget> createState() => _ShortsWidgetState();
}

class _ShortsWidgetState extends State<ShortsWidget> {
  late ShortsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShortsModel());

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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Align(
          alignment: const AlignmentDirectional(0.0, -1.0),
          child: Stack(
            alignment: const AlignmentDirectional(0.0, -1.0),
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.95,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: StreamBuilder<List<PostsRecord>>(
                        stream: queryPostsRecord(
                          queryBuilder: (postsRecord) => postsRecord
                              .where(
                                'isShort',
                                isEqualTo: true,
                              )
                              .orderBy('TimePosted', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return const Center(
                              child: LoadingWidget(),
                            );
                          }
                          List<PostsRecord> pageViewPostsRecordList =
                              snapshot.data!;

                          return SizedBox(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            child: PageView.builder(
                              controller: _model.pageViewController ??=
                                  PageController(
                                      initialPage: max(
                                          0,
                                          min(
                                              0,
                                              pageViewPostsRecordList.length -
                                                  1))),
                              onPageChanged: (_) => safeSetState(() {}),
                              scrollDirection: Axis.vertical,
                              itemCount: pageViewPostsRecordList.length,
                              itemBuilder: (context, pageViewIndex) {
                                final pageViewPostsRecord =
                                    pageViewPostsRecordList[pageViewIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ShortWidget(
                                      key: Key(
                                          'Keyq2x_${pageViewIndex}_of_${pageViewPostsRecordList.length}'),
                                      post: pageViewPostsRecord,
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: SizedBox(
                  height: 60.0,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: wrapWithModel(
                          model: _model.navBarShortsModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const Hero(
                            tag: 'navBar',
                            transitionOnUserGestures: true,
                            child: Material(
                              color: Colors.transparent,
                              child: NavBarShortsWidget(
                                page: 1,
                              ),
                            ),
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
    );
  }
}
