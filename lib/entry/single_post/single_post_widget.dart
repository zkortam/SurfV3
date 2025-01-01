import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/info_widget.dart';
import '/components/post_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_plus/share_plus.dart';
import 'single_post_model.dart';
export 'single_post_model.dart';

class SinglePostWidget extends StatefulWidget {
  const SinglePostWidget({
    super.key,
    this.post,
    this.postRef,
    bool? isSharingLink,
    bool? isCopyingClipboard,
  })  : isSharingLink = isSharingLink ?? false,
        isCopyingClipboard = isCopyingClipboard ?? false;

  final PostsRecord? post;
  final DocumentReference? postRef;
  final bool isSharingLink;
  final bool isCopyingClipboard;

  @override
  State<SinglePostWidget> createState() => _SinglePostWidgetState();
}

class _SinglePostWidgetState extends State<SinglePostWidget> {
  late SinglePostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SinglePostModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.currentPageLink = await generateCurrentPageLink(
        context,
        title: 'Post',
        imageUrl: widget.post?.media.firstOrNull,
        description: widget.post?.caption,
        forceRedirect: true,
      );

      if (widget.isSharingLink) {
        unawaited(
          () async {
            await Share.share(
              _model.currentPageLink,
              sharePositionOrigin: getWidgetBoundingBox(context),
            );
          }(),
        );

        await currentUserReference!.update(createUsersRecordData(
          postInteractions: createPostInteractionsStruct(
            fieldValues: {
              'shared': FieldValue.arrayUnion([widget.post?.reference]),
            },
            clearUnsetFields: false,
          ),
        ));
      } else {
        if (widget.isCopyingClipboard) {
          await Clipboard.setData(ClipboardData(text: _model.currentPageLink));
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: false,
            context: context,
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: InfoWidget(
                    text: FFLocalizations.of(context).getText(
                      'pesitzja' /* Copied */,
                    ),
                  ),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        } else {
          return;
        }
      }
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
    return Builder(
      builder: (context) => GestureDetector(
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 55.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 3.0,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                3.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              buttonSize: 42.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              icon: Icon(
                                Icons.arrow_back,
                                color: FlutterFlowTheme.of(context).info,
                                size: 15.0,
                              ),
                              onPressed: () async {
                                context.safePop();
                              },
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 40.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'gx8uhnyb' /* Post */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
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
                  if (widget.postRef != null)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: StreamBuilder<PostsRecord>(
                        stream: PostsRecord.getDocument(widget.postRef!),
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

                          final postPostsRecord = snapshot.data!;

                          return wrapWithModel(
                            model: _model.postModel1,
                            updateCallback: () => safeSetState(() {}),
                            child: PostWidget(
                              post: postPostsRecord,
                              isLike: false,
                            ),
                          );
                        },
                      ),
                    ),
                  if (widget.postRef == null)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: wrapWithModel(
                        model: _model.postModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: PostWidget(
                          post: widget.post!,
                        ),
                      ),
                    ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                    child: StreamBuilder<List<PostsRecord>>(
                      stream: queryPostsRecord(
                        queryBuilder: (postsRecord) => postsRecord
                            .where(
                              'TimePosted',
                              isNotEqualTo: widget.post?.timePosted,
                            )
                            .where(
                              'isShort',
                              isEqualTo: false,
                            ),
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
                        List<PostsRecord> listViewPostsRecordList =
                            snapshot.data!;

                        return ListView.separated(
                          padding: const EdgeInsets.fromLTRB(
                            0,
                            0,
                            0,
                            120.0,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewPostsRecordList.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                          itemBuilder: (context, listViewIndex) {
                            final listViewPostsRecord =
                                listViewPostsRecordList[listViewIndex];
                            return PostWidget(
                              key: Key(
                                  'Keyh7w_${listViewIndex}_of_${listViewPostsRecordList.length}'),
                              post: listViewPostsRecord,
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
      ),
    );
  }
}
