import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/comments_widget.dart';
import '/components/posts_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'short_model.dart';
export 'short_model.dart';

class ShortWidget extends StatefulWidget {
  const ShortWidget({
    super.key,
    required this.post,
  });

  final PostsRecord? post;

  @override
  State<ShortWidget> createState() => _ShortWidgetState();
}

class _ShortWidgetState extends State<ShortWidget>
    with TickerProviderStateMixin {
  late ShortModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShortModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 250.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 250.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          SaturateEffect(
            curve: Curves.easeInOut,
            delay: 250.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 250.ms),
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 250.0.ms,
            duration: 1000.0.ms,
            hz: 4,
            offset: const Offset(0.0, 0.0),
            rotation: 0.175,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 250.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 250.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          SaturateEffect(
            curve: Curves.easeInOut,
            delay: 250.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 250.ms),
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 250.0.ms,
            duration: 1000.0.ms,
            hz: 4,
            offset: const Offset(0.0, 0.0),
            rotation: 0.175,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onDoubleTap: () async {
        if (functions
                .voterInList(
                    widget.post!.voters.toList(), currentUserReference!)
                .toString() ==
            '1') {
          await widget.post!.reference.update({
            ...mapToFirestore(
              {
                'Voters': FieldValue.arrayRemove([
                  getVotersFirestoreData(
                    createVotersStruct(
                      userReference: currentUserReference,
                      voteValue: 1,
                      clearUnsetFields: false,
                    ),
                    true,
                  )
                ]),
              },
            ),
          });
          if (animationsMap['iconOnActionTriggerAnimation2'] != null) {
            await animationsMap['iconOnActionTriggerAnimation2']!
                .controller
                .forward(from: 0.0)
                .whenComplete(animationsMap['iconOnActionTriggerAnimation2']!
                    .controller
                    .reverse);
          }
        } else {
          await widget.post!.reference.update({
            ...mapToFirestore(
              {
                'Voters': FieldValue.arrayUnion([
                  getVotersFirestoreData(
                    createVotersStruct(
                      userReference: currentUserReference,
                      voteValue: 1,
                      clearUnsetFields: false,
                    ),
                    true,
                  )
                ]),
              },
            ),
          });
          if (animationsMap['iconOnActionTriggerAnimation1'] != null) {
            await animationsMap['iconOnActionTriggerAnimation1']!
                .controller
                .forward(from: 0.0)
                .whenComplete(animationsMap['iconOnActionTriggerAnimation1']!
                    .controller
                    .reverse);
          }
        }
      },
      onLongPress: () async {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: PostsCompWidget(
                post: widget.post!.reference,
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 0.94,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 1.0,
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: const BoxDecoration(),
                    child: FlutterFlowVideoPlayer(
                      path: valueOrDefault<String>(
                        widget.post?.shortVideo,
                        'https://videos.pexels.com/video-files/4678261/4678261-hd_1080_1920_25fps.mp4',
                      ),
                      videoType: VideoType.network,
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.86,
                      autoPlay: true,
                      looping: true,
                      showControls: false,
                      allowFullScreen: false,
                      allowPlaybackSpeedMenu: false,
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 50.0,
                                  color: Color(0x6FD01C27),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                  spreadRadius: 50.0,
                                )
                              ],
                              borderRadius: BorderRadius.circular(60.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.favorite,
                                    color: FlutterFlowTheme.of(context).error,
                                    size: 100.0,
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'iconOnActionTriggerAnimation1']!,
                                  ),
                                ),
                              ],
                            ),
                          ).animateOnActionTrigger(
                            animationsMap[
                                'containerOnActionTriggerAnimation1']!,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 50.0,
                                  color: Color(0x6FD01C27),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                  spreadRadius: 50.0,
                                )
                              ],
                              borderRadius: BorderRadius.circular(60.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.heart_broken_rounded,
                                    color: FlutterFlowTheme.of(context).error,
                                    size: 100.0,
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'iconOnActionTriggerAnimation2']!,
                                  ),
                                ),
                              ],
                            ),
                          ).animateOnActionTrigger(
                            animationsMap[
                                'containerOnActionTriggerAnimation2']!,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 20.0),
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: 0.75,
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Container(
                              width: double.infinity,
                              height: 75.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Container(
                            width: double.infinity,
                            height: 75.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 2.0),
                                            child: Container(
                                              height: 25.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              child: Stack(
                                                children: [
                                                  if (!widget.post!.isStealth)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: StreamBuilder<
                                                          UsersRecord>(
                                                        stream: UsersRecord
                                                            .getDocument(widget
                                                                .post!.author!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 40.0,
                                                                height: 40.0,
                                                                child:
                                                                    SpinKitFadingFour(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 40.0,
                                                                ),
                                                              ),
                                                            );
                                                          }

                                                          final rowUsersRecord =
                                                              snapshot.data!;

                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                'Profile',
                                                                queryParameters:
                                                                    {
                                                                  'userReference':
                                                                      serializeParam(
                                                                    rowUsersRecord
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Container(
                                                                  width: 25.0,
                                                                  height: 25.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    fadeInDuration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    fadeOutDuration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    imageUrl:
                                                                        rowUsersRecord
                                                                            .photoUrl,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    errorWidget: (context,
                                                                            error,
                                                                            stackTrace) =>
                                                                        Image
                                                                            .asset(
                                                                      'assets/images/error_image.png',
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    rowUsersRecord
                                                                        .displayName,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .circle,
                                                                    color: () {
                                                                      if (functions.calculateNetVotes(widget
                                                                              .post!
                                                                              .voters
                                                                              .toList()) >
                                                                          0) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .success;
                                                                      } else if (functions.calculateNetVotes(widget
                                                                              .post!
                                                                              .voters
                                                                              .toList()) <
                                                                          0) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .error;
                                                                      } else {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .secondaryText;
                                                                      }
                                                                    }(),
                                                                    size: 10.0,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    dateTimeFormat(
                                                                      "relative",
                                                                      widget
                                                                          .post!
                                                                          .timePosted!,
                                                                      locale: FFLocalizations.of(context)
                                                                              .languageShortCode ??
                                                                          FFLocalizations.of(context)
                                                                              .languageCode,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  if (widget.post?.isStealth ??
                                                      true)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Container(
                                                            width: 25.0,
                                                            height: 25.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              random_data
                                                                  .randomImageUrl(
                                                                25,
                                                                25,
                                                              ),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '0gcq0hto' /* Anonymous */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons.circle,
                                                              color: () {
                                                                if (functions.calculateNetVotes(widget
                                                                        .post!
                                                                        .voters
                                                                        .toList()) >
                                                                    0) {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .success;
                                                                } else if (functions.calculateNetVotes(widget
                                                                        .post!
                                                                        .voters
                                                                        .toList()) <
                                                                    0) {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .error;
                                                                } else {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText;
                                                                }
                                                              }(),
                                                              size: 10.0,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Text(
                                                              functions
                                                                  .calculateNetVotes(
                                                                      widget
                                                                          .post!
                                                                          .voters
                                                                          .toList())
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons.circle,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 10.0,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Text(
                                                              functions
                                                                  .calculateNetVotes(
                                                                      widget
                                                                          .post!
                                                                          .voters
                                                                          .toList())
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            width: 260.0,
                                            decoration: const BoxDecoration(),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  widget.post?.caption,
                                                  'None',
                                                ),
                                                maxLines: 3,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: CommentsWidget(
                                                        post: widget
                                                            .post?.reference,
                                                        authorID: widget
                                                            .post?.author,
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'm2qx33nc' /* View Comments */,
                                                ),
                                                maxLines: 3,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderRadius: 8.0,
                                              buttonSize: 45.0,
                                              icon: Icon(
                                                Icons.mode_comment_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 30.0,
                                              ),
                                              onPressed: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: CommentsWidget(
                                                        post: widget
                                                            .post?.reference,
                                                        authorID: widget
                                                            .post?.author,
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                widget.post?.comments.length
                                                    .toString(),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Stack(
                                              children: [
                                                if (functions
                                                        .voterInList(
                                                            widget.post!.voters
                                                                .toList(),
                                                            currentUserReference!)
                                                        .toString() ==
                                                    '1')
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 8.0,
                                                    buttonSize: 45.0,
                                                    icon: Icon(
                                                      Icons.favorite_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      size: 30.0,
                                                    ),
                                                    onPressed: () async {
                                                      if (functions
                                                              .voterInList(
                                                                  widget.post!
                                                                      .voters
                                                                      .toList(),
                                                                  currentUserReference!)
                                                              .toString() ==
                                                          '1') {
                                                        await widget
                                                            .post!.reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'Voters': FieldValue
                                                                  .arrayRemove([
                                                                getVotersFirestoreData(
                                                                  createVotersStruct(
                                                                    userReference:
                                                                        currentUserReference,
                                                                    voteValue:
                                                                        1,
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  true,
                                                                )
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation2'] !=
                                                            null) {
                                                          await animationsMap[
                                                                  'containerOnActionTriggerAnimation2']!
                                                              .controller
                                                              .forward(
                                                                  from: 0.0)
                                                              .whenComplete(
                                                                  animationsMap[
                                                                          'containerOnActionTriggerAnimation2']!
                                                                      .controller
                                                                      .reverse);
                                                        }
                                                        if (animationsMap[
                                                                'iconOnActionTriggerAnimation2'] !=
                                                            null) {
                                                          await animationsMap[
                                                                  'iconOnActionTriggerAnimation2']!
                                                              .controller
                                                              .forward(
                                                                  from: 0.0)
                                                              .whenComplete(
                                                                  animationsMap[
                                                                          'iconOnActionTriggerAnimation2']!
                                                                      .controller
                                                                      .reverse);
                                                        }
                                                      } else {
                                                        await widget
                                                            .post!.reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'Voters': FieldValue
                                                                  .arrayUnion([
                                                                getVotersFirestoreData(
                                                                  createVotersStruct(
                                                                    userReference:
                                                                        currentUserReference,
                                                                    voteValue:
                                                                        1,
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  true,
                                                                )
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation1'] !=
                                                            null) {
                                                          await animationsMap[
                                                                  'containerOnActionTriggerAnimation1']!
                                                              .controller
                                                              .forward(
                                                                  from: 0.0)
                                                              .whenComplete(
                                                                  animationsMap[
                                                                          'containerOnActionTriggerAnimation1']!
                                                                      .controller
                                                                      .reverse);
                                                        }
                                                        if (animationsMap[
                                                                'iconOnActionTriggerAnimation1'] !=
                                                            null) {
                                                          await animationsMap[
                                                                  'iconOnActionTriggerAnimation1']!
                                                              .controller
                                                              .forward(
                                                                  from: 0.0)
                                                              .whenComplete(
                                                                  animationsMap[
                                                                          'iconOnActionTriggerAnimation1']!
                                                                      .controller
                                                                      .reverse);
                                                        }
                                                      }
                                                    },
                                                  ),
                                                if (functions
                                                        .voterInList(
                                                            widget.post!.voters
                                                                .toList(),
                                                            currentUserReference!)
                                                        .toString() !=
                                                    '1')
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 8.0,
                                                    buttonSize: 45.0,
                                                    icon: Icon(
                                                      Icons.favorite_border,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      size: 30.0,
                                                    ),
                                                    onPressed: () async {
                                                      if (functions
                                                              .voterInList(
                                                                  widget.post!
                                                                      .voters
                                                                      .toList(),
                                                                  currentUserReference!)
                                                              .toString() ==
                                                          '1') {
                                                        await widget
                                                            .post!.reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'Voters': FieldValue
                                                                  .arrayRemove([
                                                                getVotersFirestoreData(
                                                                  createVotersStruct(
                                                                    userReference:
                                                                        currentUserReference,
                                                                    voteValue:
                                                                        1,
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  true,
                                                                )
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        if (animationsMap[
                                                                'iconOnActionTriggerAnimation2'] !=
                                                            null) {
                                                          await animationsMap[
                                                                  'iconOnActionTriggerAnimation2']!
                                                              .controller
                                                              .forward(
                                                                  from: 0.0)
                                                              .whenComplete(
                                                                  animationsMap[
                                                                          'iconOnActionTriggerAnimation2']!
                                                                      .controller
                                                                      .reverse);
                                                        }
                                                      } else {
                                                        await widget
                                                            .post!.reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'Voters': FieldValue
                                                                  .arrayUnion([
                                                                getVotersFirestoreData(
                                                                  createVotersStruct(
                                                                    userReference:
                                                                        currentUserReference,
                                                                    voteValue:
                                                                        1,
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  true,
                                                                )
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        if (animationsMap[
                                                                'iconOnActionTriggerAnimation1'] !=
                                                            null) {
                                                          await animationsMap[
                                                                  'iconOnActionTriggerAnimation1']!
                                                              .controller
                                                              .forward(
                                                                  from: 0.0)
                                                              .whenComplete(
                                                                  animationsMap[
                                                                          'iconOnActionTriggerAnimation1']!
                                                                      .controller
                                                                      .reverse);
                                                        }
                                                      }
                                                    },
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                widget.post?.voters.length
                                                    .toString(),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
