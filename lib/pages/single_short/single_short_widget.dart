import '/backend/backend.dart';
import '/components/nav_bar_shorts_widget.dart';
import '/components/short_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'single_short_model.dart';
export 'single_short_model.dart';

class SingleShortWidget extends StatefulWidget {
  const SingleShortWidget({
    super.key,
    required this.shortsRef,
  });

  final DocumentReference? shortsRef;

  @override
  State<SingleShortWidget> createState() => _SingleShortWidgetState();
}

class _SingleShortWidgetState extends State<SingleShortWidget> {
  late SingleShortModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SingleShortModel());

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
                    StreamBuilder<List<PostsRecord>>(
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
                        List<PostsRecord> containerPostsRecordList =
                            snapshot.data!;

                        return Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.95,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Builder(
                            builder: (context) {
                              final posts = containerPostsRecordList.toList();

                              return SizedBox(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: PageView.builder(
                                  controller: _model.pageViewController ??=
                                      PageController(
                                          initialPage: max(
                                              0,
                                              min(
                                                  valueOrDefault<int>(
                                                    functions.findIndexOfPost(
                                                        widget.shortsRef!,
                                                        containerPostsRecordList
                                                            .toList()),
                                                    0,
                                                  ),
                                                  posts.length - 1))),
                                  onPageChanged: (_) => safeSetState(() {}),
                                  scrollDirection: Axis.vertical,
                                  itemCount: posts.length,
                                  itemBuilder: (context, postsIndex) {
                                    final postsItem = posts[postsIndex];
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ShortWidget(
                                          key: Key(
                                              'Keyupd_${postsIndex}_of_${posts.length}'),
                                          post: postsItem,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      },
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
