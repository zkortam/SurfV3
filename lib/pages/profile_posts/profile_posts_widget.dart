import '/backend/backend.dart';
import '/components/post_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'profile_posts_model.dart';
export 'profile_posts_model.dart';

class ProfilePostsWidget extends StatefulWidget {
  const ProfilePostsWidget({
    super.key,
    required this.post,
  });

  final PostsRecord? post;

  @override
  State<ProfilePostsWidget> createState() => _ProfilePostsWidgetState();
}

class _ProfilePostsWidgetState extends State<ProfilePostsWidget> {
  late ProfilePostsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePostsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.singlePostList?.animateTo(
        _model.singlePostList!.position.maxScrollExtent,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.ease,
      );
      await _model.singlePostList?.animateTo(
        0,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.ease,
      );
    });

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
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            controller: _model.columnController,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                StreamBuilder<List<PostsRecord>>(
                  stream: queryPostsRecord(
                    queryBuilder: (postsRecord) => postsRecord
                        .where(
                          'Author',
                          isEqualTo: widget.post?.author,
                        )
                        .where(
                          'TimePosted',
                          isGreaterThan: widget.post?.timePosted,
                        )
                        .where(
                          'isShort',
                          isEqualTo: false,
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
                    List<PostsRecord> listView1PostsRecordList = snapshot.data!;

                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listView1PostsRecordList.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                      itemBuilder: (context, listView1Index) {
                        final listView1PostsRecord =
                            listView1PostsRecordList[listView1Index];
                        return Visibility(
                          visible: widget.post?.reference !=
                              listView1PostsRecord.reference,
                          child: PostWidget(
                            key: Key(
                                'Keymf0_${listView1Index}_of_${listView1PostsRecordList.length}'),
                            post: listView1PostsRecord,
                          ),
                        );
                      },
                      controller: _model.listView1,
                    );
                  },
                ),
                ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  controller: _model.singlePostList,
                  children: [
                    wrapWithModel(
                      model: _model.postModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: PostWidget(
                        post: widget.post!,
                      ),
                    ),
                  ].divide(const SizedBox(height: 10.0)),
                ),
                StreamBuilder<List<PostsRecord>>(
                  stream: queryPostsRecord(
                    queryBuilder: (postsRecord) => postsRecord
                        .where(
                          'Author',
                          isEqualTo: widget.post?.author,
                        )
                        .where(
                          'TimePosted',
                          isLessThan: widget.post?.timePosted,
                        )
                        .where(
                          'isShort',
                          isEqualTo: false,
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
                    List<PostsRecord> listView2PostsRecordList = snapshot.data!;

                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listView2PostsRecordList.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                      itemBuilder: (context, listView2Index) {
                        final listView2PostsRecord =
                            listView2PostsRecordList[listView2Index];
                        return Visibility(
                          visible: widget.post?.reference !=
                              listView2PostsRecord.reference,
                          child: PostWidget(
                            key: Key(
                                'Key39g_${listView2Index}_of_${listView2PostsRecordList.length}'),
                            post: listView2PostsRecord,
                          ),
                        );
                      },
                      controller: _model.listView2,
                    );
                  },
                ),
              ].divide(const SizedBox(height: 10.0)),
            ),
          ),
        ),
      ),
    );
  }
}
