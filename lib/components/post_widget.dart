import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/comments_widget.dart';
import '/components/post_users_liked_click_widget.dart';
import '/components/posts_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'post_model.dart';
export 'post_model.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    super.key,
    required this.post,
  });

  final PostsRecord? post;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> with TickerProviderStateMixin {
  late PostModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 750.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          SaturateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 750.0.ms,
            begin: 0.0,
            end: 1.0,
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
      'containerOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 750.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          SaturateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 750.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation4': AnimationInfo(
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
    return Visibility(
      visible: true /* Warning: Trying to access variable not yet defined. */,
      child: FutureBuilder<UsersRecord>(
        future: UsersRecord.getDocumentOnce(widget.post!.author!),
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

          final containerUsersRecord = snapshot.data!;

          return InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onDoubleTap: () async {
              if (_model.isinfoshowing) {
                _model.isinfoshowing = false;
                safeSetState(() {});
              } else {
                _model.isinfoshowing = true;
                safeSetState(() {});
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
                width: 450.0,
                height: 500.0,
                constraints: const BoxConstraints(
                  maxWidth: 450.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SizedBox(
                  width: 450.0,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 450.0,
                        child: Stack(
                          children: [
                            if (widget.post?.media.length == 1)
                              FlutterFlowMediaDisplay(
                                path: widget.post!.media.first,
                                imageBuilder: (path) => ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    path,
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                videoPlayerBuilder: (path) =>
                                    FlutterFlowVideoPlayer(
                                  path: path,
                                  width: 300.0,
                                  autoPlay: false,
                                  looping: true,
                                  showControls: true,
                                  allowFullScreen: true,
                                  allowPlaybackSpeedMenu: false,
                                ),
                              ),
                            if (widget.post!.media.length > 1)
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final media =
                                        (widget.post?.media.toList() ?? [])
                                            .take(10)
                                            .toList();

                                    return SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Stack(
                                        children: [
                                          PageView.builder(
                                            controller: _model
                                                    .multipleMediaController ??=
                                                PageController(
                                                    initialPage: max(
                                                        0,
                                                        min(0,
                                                            media.length - 1))),
                                            onPageChanged: (_) =>
                                                safeSetState(() {}),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: media.length,
                                            itemBuilder: (context, mediaIndex) {
                                              final mediaItem =
                                                  media[mediaIndex];
                                              return FlutterFlowMediaDisplay(
                                                path: mediaItem,
                                                imageBuilder: (path) =>
                                                    ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: Image.network(
                                                    path,
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                videoPlayerBuilder: (path) =>
                                                    FlutterFlowVideoPlayer(
                                                  path: path,
                                                  width: 300.0,
                                                  autoPlay: false,
                                                  looping: true,
                                                  showControls: true,
                                                  allowFullScreen: true,
                                                  allowPlaybackSpeedMenu: false,
                                                ),
                                              );
                                            },
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                -1.0, -0.95),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 16.0),
                                              child: smooth_page_indicator
                                                  .SmoothPageIndicator(
                                                controller: _model
                                                        .multipleMediaController ??=
                                                    PageController(
                                                        initialPage: max(
                                                            0,
                                                            min(
                                                                0,
                                                                media.length -
                                                                    1))),
                                                count: media.length,
                                                axisDirection: Axis.horizontal,
                                                onDotClicked: (i) async {
                                                  await _model
                                                      .multipleMediaController!
                                                      .animateToPage(
                                                    i,
                                                    duration: const Duration(
                                                        milliseconds: 500),
                                                    curve: Curves.ease,
                                                  );
                                                  safeSetState(() {});
                                                },
                                                effect: smooth_page_indicator
                                                    .ExpandingDotsEffect(
                                                  expansionFactor: 3.0,
                                                  spacing: 5.0,
                                                  radius: 20.0,
                                                  dotWidth: 10.0,
                                                  dotHeight: 10.0,
                                                  dotColor: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  activeDotColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  paintStyle:
                                                      PaintingStyle.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (widget.post!.isSpoiler &&
                          (widget.post?.spoilerClickers
                                  .contains(currentUserReference) ==
                              false))
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await widget.post!.reference.update({
                              ...mapToFirestore(
                                {
                                  'SpoilerClickers': FieldValue.arrayUnion(
                                      [currentUserReference]),
                                },
                              ),
                            });
                          },
                          child: Container(
                            width: 450.0,
                            height: 500.0,
                            decoration: BoxDecoration(
                              color: const Color(0xEF050505),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.ghost,
                                    color: Colors.white,
                                    size: 45.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (_model.animation)
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await widget.post!.reference.update({
                              ...mapToFirestore(
                                {
                                  'SpoilerClickers': FieldValue.arrayUnion(
                                      [currentUserReference]),
                                },
                              ),
                            });
                          },
                          child: Container(
                            width: 450.0,
                            height: 500.0,
                            decoration: BoxDecoration(
                              color: const Color(0x8B060606),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 50.0,
                                        color: Color(0x48D7D7D7),
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
                                        child: const Icon(
                                          Icons.thumb_up_rounded,
                                          color: Colors.white,
                                          size: 80.0,
                                        ).animateOnActionTrigger(
                                          animationsMap[
                                              'iconOnActionTriggerAnimation1']!,
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
                        ).animateOnActionTrigger(
                          animationsMap['containerOnActionTriggerAnimation1']!,
                        ),
                      if (_model.animation)
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await widget.post!.reference.update({
                              ...mapToFirestore(
                                {
                                  'SpoilerClickers': FieldValue.arrayUnion(
                                      [currentUserReference]),
                                },
                              ),
                            });
                          },
                          child: Container(
                            width: 450.0,
                            height: 500.0,
                            decoration: BoxDecoration(
                              color: const Color(0x8B060606),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 50.0,
                                        color: Color(0x48D21515),
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
                                        child: const Icon(
                                          Icons.thumb_down_rounded,
                                          color: Colors.white,
                                          size: 80.0,
                                        ).animateOnActionTrigger(
                                          animationsMap[
                                              'iconOnActionTriggerAnimation2']!,
                                        ),
                                      ),
                                    ],
                                  ),
                                ).animateOnActionTrigger(
                                  animationsMap[
                                      'containerOnActionTriggerAnimation4']!,
                                ),
                              ],
                            ),
                          ),
                        ).animateOnActionTrigger(
                          animationsMap['containerOnActionTriggerAnimation3']!,
                        ),
                      if (_model.isinfoshowing)
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Container(
                              width: 450.0,
                              constraints: const BoxConstraints(
                                minHeight: 75.0,
                                maxWidth: 450.0,
                                maxHeight: 110.0,
                              ),
                              decoration: const BoxDecoration(
                                color: Color(0xA0000000),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8.0),
                                  bottomRight: Radius.circular(8.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 5.0, 5.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 2.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: const Color(0x3D000000),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    if (!widget
                                                        .post!.isStealth)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    5.0,
                                                                    2.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'Profile',
                                                              queryParameters: {
                                                                'userReference':
                                                                    serializeParam(
                                                                  widget.post
                                                                      ?.author,
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
                                                                clipBehavior: Clip
                                                                    .antiAlias,
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
                                                                      containerUsersRecord
                                                                          .photoUrl,
                                                                  fit: BoxFit
                                                                      .cover,
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
                                                                  containerUsersRecord
                                                                      .displayName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14.0,
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
                                                                      .calculateNetVotes(widget
                                                                          .post!
                                                                          .voters
                                                                          .toList())
                                                                      .toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    if (widget
                                                            .post?.isStealth ??
                                                        true)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    5.0,
                                                                    2.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Container(
                                                              width: 25.0,
                                                              height: 25.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
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
                                                                fit: BoxFit
                                                                    .cover,
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
                                                                'Anonymous',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                                    .calculateNetVotes(widget
                                                                        .post!
                                                                        .voters
                                                                        .toList())
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                                    .calculateNetVotes(widget
                                                                        .post!
                                                                        .voters
                                                                        .toList())
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 2.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    widget.post?.caption,
                                                    'None',
                                                  ),
                                                  maxLines: 3,
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
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
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                child: Text(
                                                  'View Comments',
                                                  maxLines: 3,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
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
                                    Flexible(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Flexible(
                                            child: Stack(
                                              children: [
                                                if (_model.voteValue == 1)
                                                  FlutterFlowIconButton(
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 50.0,
                                                    icon: const Icon(
                                                      Icons.thumb_up,
                                                      color: Colors.white,
                                                      size: 30.0,
                                                    ),
                                                    onPressed: () async {
                                                      final firestoreBatch =
                                                          FirebaseFirestore
                                                              .instance
                                                              .batch();
                                                      try {
                                                        if (functions
                                                                .voterInList(
                                                                    widget
                                                                        .post!
                                                                        .voters
                                                                        .toList(),
                                                                    currentUserReference!)
                                                                .toString() ==
                                                            '1') {
                                                          firestoreBatch.update(
                                                              widget.post!
                                                                  .reference,
                                                              {
                                                                ...mapToFirestore(
                                                                  {
                                                                    'Voters':
                                                                        FieldValue
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
                                                          _model.voteValue = 0;
                                                          safeSetState(() {});
                                                        } else {
                                                          _model.voteValue = 1;
                                                          safeSetState(() {});
                                                          if (functions
                                                                  .voterInList(
                                                                      widget
                                                                          .post!
                                                                          .voters
                                                                          .toList(),
                                                                      currentUserReference!)
                                                                  .toString() ==
                                                              '-1') {
                                                            firestoreBatch.update(
                                                                widget.post!
                                                                    .reference,
                                                                {
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'Voters':
                                                                          FieldValue
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

                                                            firestoreBatch.update(
                                                                widget.post!
                                                                    .reference,
                                                                {
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'Voters':
                                                                          FieldValue
                                                                              .arrayRemove([
                                                                        getVotersFirestoreData(
                                                                          createVotersStruct(
                                                                            userReference:
                                                                                currentUserReference,
                                                                            voteValue:
                                                                                -1,
                                                                            clearUnsetFields:
                                                                                false,
                                                                          ),
                                                                          true,
                                                                        )
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                          } else {
                                                            firestoreBatch.update(
                                                                widget.post!
                                                                    .reference,
                                                                {
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'Voters':
                                                                          FieldValue
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
                                                          }
                                                        }
                                                      } finally {
                                                        await firestoreBatch
                                                            .commit();
                                                      }
                                                    },
                                                  ),
                                                if (_model.voteValue != 1)
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onLongPress: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                PostUsersLikedClickWidget(
                                                              voters: widget
                                                                  .post!.voters,
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 50.0,
                                                      icon: const Icon(
                                                        Icons.thumb_up_outlined,
                                                        color: Colors.white,
                                                        size: 30.0,
                                                      ),
                                                      onPressed: () async {
                                                        final firestoreBatch =
                                                            FirebaseFirestore
                                                                .instance
                                                                .batch();
                                                        try {
                                                          if (functions
                                                                  .voterInList(
                                                                      widget
                                                                          .post!
                                                                          .voters
                                                                          .toList(),
                                                                      currentUserReference!)
                                                                  .toString() ==
                                                              '1') {
                                                            firestoreBatch.update(
                                                                widget.post!
                                                                    .reference,
                                                                {
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'Voters':
                                                                          FieldValue
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
                                                            _model.voteValue =
                                                                0;
                                                            safeSetState(() {});
                                                          } else {
                                                            _model.voteValue =
                                                                1;
                                                            safeSetState(() {});
                                                            if (functions
                                                                    .voterInList(
                                                                        widget
                                                                            .post!
                                                                            .voters
                                                                            .toList(),
                                                                        currentUserReference!)
                                                                    .toString() ==
                                                                '-1') {
                                                              firestoreBatch.update(
                                                                  widget.post!
                                                                      .reference,
                                                                  {
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'Voters':
                                                                            FieldValue.arrayUnion([
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

                                                              firestoreBatch.update(
                                                                  widget.post!
                                                                      .reference,
                                                                  {
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'Voters':
                                                                            FieldValue.arrayRemove([
                                                                          getVotersFirestoreData(
                                                                            createVotersStruct(
                                                                              userReference: currentUserReference,
                                                                              voteValue: -1,
                                                                              clearUnsetFields: false,
                                                                            ),
                                                                            true,
                                                                          )
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });
                                                            } else {
                                                              firestoreBatch.update(
                                                                  widget.post!
                                                                      .reference,
                                                                  {
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'Voters':
                                                                            FieldValue.arrayUnion([
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
                                                            }

                                                            _model.animation =
                                                                true;
                                                            safeSetState(() {});
                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        100));
                                                            await Future.wait([
                                                              Future(() async {
                                                                if (animationsMap[
                                                                        'containerOnActionTriggerAnimation1'] !=
                                                                    null) {
                                                                  await animationsMap[
                                                                          'containerOnActionTriggerAnimation1']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0)
                                                                      .whenComplete(animationsMap[
                                                                              'containerOnActionTriggerAnimation1']!
                                                                          .controller
                                                                          .reverse);
                                                                }
                                                              }),
                                                              Future(() async {
                                                                if (animationsMap[
                                                                        'containerOnActionTriggerAnimation2'] !=
                                                                    null) {
                                                                  await animationsMap[
                                                                          'containerOnActionTriggerAnimation2']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0)
                                                                      .whenComplete(animationsMap[
                                                                              'containerOnActionTriggerAnimation2']!
                                                                          .controller
                                                                          .reverse);
                                                                }
                                                              }),
                                                              Future(() async {
                                                                if (animationsMap[
                                                                        'iconOnActionTriggerAnimation1'] !=
                                                                    null) {
                                                                  await animationsMap[
                                                                          'iconOnActionTriggerAnimation1']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0)
                                                                      .whenComplete(animationsMap[
                                                                              'iconOnActionTriggerAnimation1']!
                                                                          .controller
                                                                          .reverse);
                                                                }
                                                              }),
                                                            ]);
                                                            _model.animation =
                                                                false;
                                                            safeSetState(() {});
                                                          }
                                                        } finally {
                                                          await firestoreBatch
                                                              .commit();
                                                        }
                                                      },
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Stack(
                                              children: [
                                                if (_model.voteValue == -1)
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 50.0,
                                                    icon: const Icon(
                                                      Icons.thumb_down,
                                                      color: Colors.white,
                                                      size: 30.0,
                                                    ),
                                                    onPressed: () async {
                                                      final firestoreBatch =
                                                          FirebaseFirestore
                                                              .instance
                                                              .batch();
                                                      try {
                                                        if (functions
                                                                .voterInList(
                                                                    widget
                                                                        .post!
                                                                        .voters
                                                                        .toList(),
                                                                    currentUserReference!)
                                                                .toString() ==
                                                            '-1') {
                                                          firestoreBatch.update(
                                                              widget.post!
                                                                  .reference,
                                                              {
                                                                ...mapToFirestore(
                                                                  {
                                                                    'Voters':
                                                                        FieldValue
                                                                            .arrayRemove([
                                                                      getVotersFirestoreData(
                                                                        createVotersStruct(
                                                                          userReference:
                                                                              currentUserReference,
                                                                          voteValue:
                                                                              -1,
                                                                          clearUnsetFields:
                                                                              false,
                                                                        ),
                                                                        true,
                                                                      )
                                                                    ]),
                                                                  },
                                                                ),
                                                              });
                                                          _model.voteValue = 0;
                                                          safeSetState(() {});
                                                        } else {
                                                          _model.voteValue = -1;
                                                          safeSetState(() {});
                                                          if (functions
                                                                  .voterInList(
                                                                      widget
                                                                          .post!
                                                                          .voters
                                                                          .toList(),
                                                                      currentUserReference!)
                                                                  .toString() ==
                                                              '1') {
                                                            firestoreBatch.update(
                                                                widget.post!
                                                                    .reference,
                                                                {
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'Voters':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        getVotersFirestoreData(
                                                                          createVotersStruct(
                                                                            userReference:
                                                                                currentUserReference,
                                                                            voteValue:
                                                                                -1,
                                                                            clearUnsetFields:
                                                                                false,
                                                                          ),
                                                                          true,
                                                                        )
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });

                                                            firestoreBatch.update(
                                                                widget.post!
                                                                    .reference,
                                                                {
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'Voters':
                                                                          FieldValue
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
                                                          } else {
                                                            firestoreBatch.update(
                                                                widget.post!
                                                                    .reference,
                                                                {
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'Voters':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        getVotersFirestoreData(
                                                                          createVotersStruct(
                                                                            userReference:
                                                                                currentUserReference,
                                                                            voteValue:
                                                                                -1,
                                                                            clearUnsetFields:
                                                                                false,
                                                                          ),
                                                                          true,
                                                                        )
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                          }
                                                        }
                                                      } finally {
                                                        await firestoreBatch
                                                            .commit();
                                                      }
                                                    },
                                                  ),
                                                if (_model.voteValue != -1)
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 50.0,
                                                    icon: const Icon(
                                                      Icons.thumb_down_outlined,
                                                      color: Colors.white,
                                                      size: 30.0,
                                                    ),
                                                    onPressed: () async {
                                                      final firestoreBatch =
                                                          FirebaseFirestore
                                                              .instance
                                                              .batch();
                                                      try {
                                                        if (functions
                                                                .voterInList(
                                                                    widget
                                                                        .post!
                                                                        .voters
                                                                        .toList(),
                                                                    currentUserReference!)
                                                                .toString() ==
                                                            '-1') {
                                                          firestoreBatch.update(
                                                              widget.post!
                                                                  .reference,
                                                              {
                                                                ...mapToFirestore(
                                                                  {
                                                                    'Voters':
                                                                        FieldValue
                                                                            .arrayRemove([
                                                                      getVotersFirestoreData(
                                                                        createVotersStruct(
                                                                          userReference:
                                                                              currentUserReference,
                                                                          voteValue:
                                                                              -1,
                                                                          clearUnsetFields:
                                                                              false,
                                                                        ),
                                                                        true,
                                                                      )
                                                                    ]),
                                                                  },
                                                                ),
                                                              });
                                                          _model.voteValue = 0;
                                                          safeSetState(() {});
                                                        } else {
                                                          _model.voteValue = -1;
                                                          safeSetState(() {});
                                                          if (functions
                                                                  .voterInList(
                                                                      widget
                                                                          .post!
                                                                          .voters
                                                                          .toList(),
                                                                      currentUserReference!)
                                                                  .toString() ==
                                                              '1') {
                                                            firestoreBatch.update(
                                                                widget.post!
                                                                    .reference,
                                                                {
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'Voters':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        getVotersFirestoreData(
                                                                          createVotersStruct(
                                                                            userReference:
                                                                                currentUserReference,
                                                                            voteValue:
                                                                                -1,
                                                                            clearUnsetFields:
                                                                                false,
                                                                          ),
                                                                          true,
                                                                        )
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });

                                                            firestoreBatch.update(
                                                                widget.post!
                                                                    .reference,
                                                                {
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'Voters':
                                                                          FieldValue
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
                                                          } else {
                                                            firestoreBatch.update(
                                                                widget.post!
                                                                    .reference,
                                                                {
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'Voters':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        getVotersFirestoreData(
                                                                          createVotersStruct(
                                                                            userReference:
                                                                                currentUserReference,
                                                                            voteValue:
                                                                                -1,
                                                                            clearUnsetFields:
                                                                                false,
                                                                          ),
                                                                          true,
                                                                        )
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                          }

                                                          _model.animation =
                                                              true;
                                                          safeSetState(() {});
                                                          await Future.delayed(
                                                              const Duration(
                                                                  milliseconds:
                                                                      100));
                                                          await Future.wait([
                                                            Future(() async {
                                                              if (animationsMap[
                                                                      'iconOnActionTriggerAnimation2'] !=
                                                                  null) {
                                                                await animationsMap[
                                                                        'iconOnActionTriggerAnimation2']!
                                                                    .controller
                                                                    .forward(
                                                                        from:
                                                                            0.0)
                                                                    .whenComplete(animationsMap[
                                                                            'iconOnActionTriggerAnimation2']!
                                                                        .controller
                                                                        .reverse);
                                                              }
                                                            }),
                                                            Future(() async {
                                                              if (animationsMap[
                                                                      'containerOnActionTriggerAnimation3'] !=
                                                                  null) {
                                                                await animationsMap[
                                                                        'containerOnActionTriggerAnimation3']!
                                                                    .controller
                                                                    .forward(
                                                                        from:
                                                                            0.0)
                                                                    .whenComplete(animationsMap[
                                                                            'containerOnActionTriggerAnimation3']!
                                                                        .controller
                                                                        .reverse);
                                                              }
                                                            }),
                                                            Future(() async {
                                                              if (animationsMap[
                                                                      'containerOnActionTriggerAnimation4'] !=
                                                                  null) {
                                                                await animationsMap[
                                                                        'containerOnActionTriggerAnimation4']!
                                                                    .controller
                                                                    .forward(
                                                                        from:
                                                                            0.0)
                                                                    .whenComplete(animationsMap[
                                                                            'containerOnActionTriggerAnimation4']!
                                                                        .controller
                                                                        .reverse);
                                                              }
                                                            }),
                                                          ]);
                                                          _model.animation =
                                                              false;
                                                          safeSetState(() {});
                                                        }
                                                      } finally {
                                                        await firestoreBatch
                                                            .commit();
                                                      }
                                                    },
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
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
