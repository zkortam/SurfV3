import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
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

class _PostWidgetState extends State<PostWidget> {
  late PostModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450.0,
      height: 450.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          Stack(
            children: [
              if ((widget.post?.images.length == 1) ||
                  (widget.post?.videos.length == 1))
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: SizedBox(
                    width: 450.0,
                    height: 450.0,
                    child: PageView(
                      controller: _model.onePostController ??=
                          PageController(initialPage: 0),
                      onPageChanged: (_) => setState(() {}),
                      scrollDirection: Axis.horizontal,
                      children: [
                        FlutterFlowMediaDisplay(
                          path: valueOrDefault<String>(
                            widget.post?.images.length == 1
                                ? valueOrDefault<String>(
                                    widget.post?.images[0],
                                    '0',
                                  )
                                : valueOrDefault<String>(
                                    widget.post?.videos[0],
                                    '0',
                                  ),
                            '0',
                          ),
                          imageBuilder: (path) => ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              path,
                              width: 300.0,
                              height: 300.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                            path: path,
                            width: 300.0,
                            autoPlay: false,
                            looping: true,
                            showControls: true,
                            allowFullScreen: true,
                            allowPlaybackSpeedMenu: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if ((widget.post?.images.length == 2) ||
                  (widget.post?.videos.length == 2))
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: SizedBox(
                    width: 450.0,
                    height: 450.0,
                    child: Stack(
                      children: [
                        PageView(
                          controller: _model.twoPostsController ??=
                              PageController(initialPage: 0),
                          onPageChanged: (_) => setState(() {}),
                          scrollDirection: Axis.horizontal,
                          children: [
                            FlutterFlowMediaDisplay(
                              path: valueOrDefault<String>(
                                widget.post?.images.length == 2
                                    ? valueOrDefault<String>(
                                        widget.post?.images[0],
                                        '0',
                                      )
                                    : valueOrDefault<String>(
                                        widget.post?.videos[0],
                                        '0',
                                      ),
                                '0',
                              ),
                              imageBuilder: (path) => ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  path,
                                  width: 300.0,
                                  height: 300.0,
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
                            FlutterFlowMediaDisplay(
                              path: valueOrDefault<String>(
                                widget.post?.images.length == 2
                                    ? valueOrDefault<String>(
                                        widget.post?.images[1],
                                        '0',
                                      )
                                    : valueOrDefault<String>(
                                        widget.post?.videos[1],
                                        '0',
                                      ),
                                '0',
                              ),
                              imageBuilder: (path) => ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  path,
                                  width: 300.0,
                                  height: 300.0,
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
                          ],
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -0.95),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 16.0),
                            child: smooth_page_indicator.SmoothPageIndicator(
                              controller: _model.twoPostsController ??=
                                  PageController(initialPage: 0),
                              count: 2,
                              axisDirection: Axis.horizontal,
                              onDotClicked: (i) async {
                                await _model.twoPostsController!.animateToPage(
                                  i,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                                setState(() {});
                              },
                              effect: smooth_page_indicator.ExpandingDotsEffect(
                                expansionFactor: 2.0,
                                spacing: 5.0,
                                radius: 25.0,
                                dotWidth: 10.0,
                                dotHeight: 10.0,
                                dotColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                activeDotColor:
                                    FlutterFlowTheme.of(context).primary,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if ((widget.post?.images.length == 3) ||
                  (widget.post?.videos.length == 3))
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: SizedBox(
                    width: 450.0,
                    height: 450.0,
                    child: Stack(
                      children: [
                        PageView(
                          controller: _model.threePostsController ??=
                              PageController(initialPage: 0),
                          onPageChanged: (_) => setState(() {}),
                          scrollDirection: Axis.horizontal,
                          children: [
                            FlutterFlowMediaDisplay(
                              path: valueOrDefault<String>(
                                widget.post?.images.length == 3
                                    ? valueOrDefault<String>(
                                        widget.post?.images[0],
                                        '0',
                                      )
                                    : valueOrDefault<String>(
                                        widget.post?.videos[0],
                                        '0',
                                      ),
                                '0',
                              ),
                              imageBuilder: (path) => ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  path,
                                  width: 300.0,
                                  height: 300.0,
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
                            FlutterFlowMediaDisplay(
                              path: valueOrDefault<String>(
                                widget.post?.images.length == 3
                                    ? valueOrDefault<String>(
                                        widget.post?.images[1],
                                        '0',
                                      )
                                    : valueOrDefault<String>(
                                        widget.post?.videos[1],
                                        '0',
                                      ),
                                '0',
                              ),
                              imageBuilder: (path) => ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  path,
                                  width: 300.0,
                                  height: 300.0,
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
                            FlutterFlowMediaDisplay(
                              path: valueOrDefault<String>(
                                widget.post?.images.length == 3
                                    ? valueOrDefault<String>(
                                        widget.post?.images[2],
                                        '0',
                                      )
                                    : valueOrDefault<String>(
                                        widget.post?.videos[2],
                                        '0',
                                      ),
                                '0',
                              ),
                              imageBuilder: (path) => ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  path,
                                  width: 300.0,
                                  height: 300.0,
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
                          ],
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -0.95),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 16.0),
                            child: smooth_page_indicator.SmoothPageIndicator(
                              controller: _model.threePostsController ??=
                                  PageController(initialPage: 0),
                              count: 3,
                              axisDirection: Axis.horizontal,
                              onDotClicked: (i) async {
                                await _model.threePostsController!
                                    .animateToPage(
                                  i,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                                setState(() {});
                              },
                              effect: smooth_page_indicator.ExpandingDotsEffect(
                                expansionFactor: 2.0,
                                spacing: 5.0,
                                radius: 25.0,
                                dotWidth: 10.0,
                                dotHeight: 10.0,
                                dotColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                activeDotColor:
                                    FlutterFlowTheme.of(context).primary,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if ((widget.post?.images.length == 4) ||
                  (widget.post?.videos.length == 4))
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: SizedBox(
                    width: 450.0,
                    height: 450.0,
                    child: Stack(
                      children: [
                        PageView(
                          controller: _model.fourPostsController ??=
                              PageController(initialPage: 0),
                          onPageChanged: (_) => setState(() {}),
                          scrollDirection: Axis.horizontal,
                          children: [
                            FlutterFlowMediaDisplay(
                              path: valueOrDefault<String>(
                                widget.post?.images.length == 4
                                    ? valueOrDefault<String>(
                                        widget.post?.images[0],
                                        '0',
                                      )
                                    : valueOrDefault<String>(
                                        widget.post?.videos[0],
                                        '0',
                                      ),
                                '0',
                              ),
                              imageBuilder: (path) => ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  path,
                                  width: 300.0,
                                  height: 300.0,
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
                            FlutterFlowMediaDisplay(
                              path: valueOrDefault<String>(
                                widget.post?.images.length == 4
                                    ? valueOrDefault<String>(
                                        widget.post?.images[1],
                                        '0',
                                      )
                                    : valueOrDefault<String>(
                                        widget.post?.videos[1],
                                        '0',
                                      ),
                                '0',
                              ),
                              imageBuilder: (path) => ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  path,
                                  width: 300.0,
                                  height: 300.0,
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
                            FlutterFlowMediaDisplay(
                              path: valueOrDefault<String>(
                                widget.post?.images.length == 4
                                    ? valueOrDefault<String>(
                                        widget.post?.images[2],
                                        '0',
                                      )
                                    : valueOrDefault<String>(
                                        widget.post?.videos[2],
                                        '0',
                                      ),
                                '0',
                              ),
                              imageBuilder: (path) => ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  path,
                                  width: 300.0,
                                  height: 300.0,
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
                            FlutterFlowMediaDisplay(
                              path: valueOrDefault<String>(
                                widget.post?.images.length == 4
                                    ? valueOrDefault<String>(
                                        widget.post?.images[3],
                                        '0',
                                      )
                                    : valueOrDefault<String>(
                                        widget.post?.videos[3],
                                        '0',
                                      ),
                                '0',
                              ),
                              imageBuilder: (path) => ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  path,
                                  width: 300.0,
                                  height: 300.0,
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
                          ],
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -0.95),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 16.0),
                            child: smooth_page_indicator.SmoothPageIndicator(
                              controller: _model.fourPostsController ??=
                                  PageController(initialPage: 0),
                              count: 4,
                              axisDirection: Axis.horizontal,
                              onDotClicked: (i) async {
                                await _model.fourPostsController!.animateToPage(
                                  i,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                                setState(() {});
                              },
                              effect: smooth_page_indicator.ExpandingDotsEffect(
                                expansionFactor: 2.0,
                                spacing: 5.0,
                                radius: 20.0,
                                dotWidth: 10.0,
                                dotHeight: 10.0,
                                dotColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                activeDotColor:
                                    FlutterFlowTheme.of(context).primary,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if ((widget.post?.images.length == 5) ||
                  (widget.post?.videos.length == 5))
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: SizedBox(
                    width: 450.0,
                    height: 450.0,
                    child: Stack(
                      children: [
                        PageView(
                          controller: _model.fivePostsController ??=
                              PageController(initialPage: 0),
                          onPageChanged: (_) => setState(() {}),
                          scrollDirection: Axis.horizontal,
                          children: [
                            FlutterFlowMediaDisplay(
                              path: valueOrDefault<String>(
                                widget.post?.images.length == 5
                                    ? valueOrDefault<String>(
                                        widget.post?.images[0],
                                        '0',
                                      )
                                    : valueOrDefault<String>(
                                        widget.post?.videos[0],
                                        '0',
                                      ),
                                '0',
                              ),
                              imageBuilder: (path) => ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  path,
                                  width: 300.0,
                                  height: 300.0,
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
                            FlutterFlowMediaDisplay(
                              path: valueOrDefault<String>(
                                widget.post?.images.length == 5
                                    ? valueOrDefault<String>(
                                        widget.post?.images[1],
                                        '0',
                                      )
                                    : valueOrDefault<String>(
                                        widget.post?.videos[1],
                                        '0',
                                      ),
                                '0',
                              ),
                              imageBuilder: (path) => ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  path,
                                  width: 300.0,
                                  height: 300.0,
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
                            FlutterFlowMediaDisplay(
                              path: valueOrDefault<String>(
                                widget.post?.images.length == 5
                                    ? valueOrDefault<String>(
                                        widget.post?.images[2],
                                        '0',
                                      )
                                    : valueOrDefault<String>(
                                        widget.post?.videos[2],
                                        '0',
                                      ),
                                '0',
                              ),
                              imageBuilder: (path) => ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  path,
                                  width: 300.0,
                                  height: 300.0,
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
                            FlutterFlowMediaDisplay(
                              path: valueOrDefault<String>(
                                widget.post?.images.length == 5
                                    ? valueOrDefault<String>(
                                        widget.post?.images[3],
                                        '0',
                                      )
                                    : valueOrDefault<String>(
                                        widget.post?.videos[3],
                                        '0',
                                      ),
                                '0',
                              ),
                              imageBuilder: (path) => ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  path,
                                  width: 300.0,
                                  height: 300.0,
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
                            FlutterFlowMediaDisplay(
                              path: valueOrDefault<String>(
                                widget.post?.images.length == 5
                                    ? valueOrDefault<String>(
                                        widget.post?.images[4],
                                        '0',
                                      )
                                    : valueOrDefault<String>(
                                        widget.post?.videos[4],
                                        '0',
                                      ),
                                '0',
                              ),
                              imageBuilder: (path) => ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  path,
                                  width: 300.0,
                                  height: 300.0,
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
                          ],
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -0.95),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 16.0),
                            child: smooth_page_indicator.SmoothPageIndicator(
                              controller: _model.fivePostsController ??=
                                  PageController(initialPage: 0),
                              count: 5,
                              axisDirection: Axis.horizontal,
                              onDotClicked: (i) async {
                                await _model.fivePostsController!.animateToPage(
                                  i,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                                setState(() {});
                              },
                              effect: smooth_page_indicator.ExpandingDotsEffect(
                                expansionFactor: 3.0,
                                spacing: 5.0,
                                radius: 20.0,
                                dotWidth: 10.0,
                                dotHeight: 10.0,
                                dotColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                activeDotColor:
                                    FlutterFlowTheme.of(context).primary,
                                paintStyle: PaintingStyle.fill,
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
          if (widget.post!.isSpoiler &&
              (widget.post?.spoilerClickers.contains(currentUserReference) ==
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
                      'SpoilerClickers':
                          FieldValue.arrayUnion([currentUserReference]),
                    },
                  ),
                });
              },
              child: Container(
                width: 450.0,
                height: 450.0,
                decoration: BoxDecoration(
                  color: const Color(0xEF050505),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
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
          Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(
                minHeight: 60.0,
                maxHeight: 95.0,
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
                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 2.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0x3D000000),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Stack(
                              children: [
                                if (!widget.post!.isStealth)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 2.0),
                                    child: StreamBuilder<UsersRecord>(
                                      stream: UsersRecord.getDocument(
                                          widget.post!.author!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }

                                        final rowUsersRecord = snapshot.data!;

                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 25.0,
                                              height: 25.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                rowUsersRecord.photoUrl,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                rowUsersRecord.displayName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: Icon(
                                                Icons.circle,
                                                color: () {
                                                  if (functions
                                                          .calculateNetVotes(
                                                              widget
                                                                  .post!.voters
                                                                  .toList()) >
                                                      0) {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .success;
                                                  } else if (functions
                                                          .calculateNetVotes(
                                                              widget
                                                                  .post!.voters
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 5.0, 0.0),
                                              child: Text(
                                                functions
                                                    .calculateNetVotes(widget
                                                        .post!.voters
                                                        .toList())
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                if (widget.post?.isStealth ?? true)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 25.0,
                                          height: 25.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            random_data.randomImageUrl(
                                              25,
                                              25,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Anonymous',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: Colors.white,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: Icon(
                                            Icons.circle,
                                            color: () {
                                              if (functions.calculateNetVotes(
                                                      widget.post!.voters
                                                          .toList()) >
                                                  0) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .success;
                                              } else if (functions
                                                      .calculateNetVotes(widget
                                                          .post!.voters
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
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: Text(
                                            functions
                                                .calculateNetVotes(widget
                                                    .post!.voters
                                                    .toList())
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: Colors.white,
                                                  letterSpacing: 0.0,
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
                        Container(
                          width: 260.0,
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.post?.caption,
                                'None',
                              ),
                              maxLines: 3,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          children: [
                            if (functions
                                    .voterInList(widget.post!.voters.toList(),
                                        currentUserReference!)
                                    .toString() ==
                                '1')
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
                                      FirebaseFirestore.instance.batch();
                                  try {
                                    if (functions
                                            .voterInList(
                                                widget.post!.voters.toList(),
                                                currentUserReference!)
                                            .toString() ==
                                        '1') {
                                      firestoreBatch
                                          .update(widget.post!.reference, {
                                        ...mapToFirestore(
                                          {
                                            'Voters': FieldValue.arrayRemove([
                                              getVotersFirestoreData(
                                                createVotersStruct(
                                                  userReference:
                                                      currentUserReference,
                                                  voteValue: 1,
                                                  clearUnsetFields: false,
                                                ),
                                                true,
                                              )
                                            ]),
                                          },
                                        ),
                                      });
                                    } else {
                                      if (functions
                                              .voterInList(
                                                  widget.post!.voters.toList(),
                                                  currentUserReference!)
                                              .toString() ==
                                          '-1') {
                                        firestoreBatch
                                            .update(widget.post!.reference, {
                                          ...mapToFirestore(
                                            {
                                              'Voters': FieldValue.arrayUnion([
                                                getVotersFirestoreData(
                                                  createVotersStruct(
                                                    userReference:
                                                        currentUserReference,
                                                    voteValue: 1,
                                                    clearUnsetFields: false,
                                                  ),
                                                  true,
                                                )
                                              ]),
                                            },
                                          ),
                                        });

                                        firestoreBatch
                                            .update(widget.post!.reference, {
                                          ...mapToFirestore(
                                            {
                                              'Voters': FieldValue.arrayRemove([
                                                getVotersFirestoreData(
                                                  createVotersStruct(
                                                    userReference:
                                                        currentUserReference,
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
                                        firestoreBatch
                                            .update(widget.post!.reference, {
                                          ...mapToFirestore(
                                            {
                                              'Voters': FieldValue.arrayUnion([
                                                getVotersFirestoreData(
                                                  createVotersStruct(
                                                    userReference:
                                                        currentUserReference,
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
                                    }
                                  } finally {
                                    await firestoreBatch.commit();
                                  }
                                },
                              ),
                            if (functions
                                    .voterInList(widget.post!.voters.toList(),
                                        currentUserReference!)
                                    .toString() !=
                                '1')
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
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
                                      FirebaseFirestore.instance.batch();
                                  try {
                                    if (functions
                                            .voterInList(
                                                widget.post!.voters.toList(),
                                                currentUserReference!)
                                            .toString() ==
                                        '1') {
                                      firestoreBatch
                                          .update(widget.post!.reference, {
                                        ...mapToFirestore(
                                          {
                                            'Voters': FieldValue.arrayRemove([
                                              getVotersFirestoreData(
                                                createVotersStruct(
                                                  userReference:
                                                      currentUserReference,
                                                  voteValue: 1,
                                                  clearUnsetFields: false,
                                                ),
                                                true,
                                              )
                                            ]),
                                          },
                                        ),
                                      });
                                    } else {
                                      if (functions
                                              .voterInList(
                                                  widget.post!.voters.toList(),
                                                  currentUserReference!)
                                              .toString() ==
                                          '-1') {
                                        firestoreBatch
                                            .update(widget.post!.reference, {
                                          ...mapToFirestore(
                                            {
                                              'Voters': FieldValue.arrayUnion([
                                                getVotersFirestoreData(
                                                  createVotersStruct(
                                                    userReference:
                                                        currentUserReference,
                                                    voteValue: 1,
                                                    clearUnsetFields: false,
                                                  ),
                                                  true,
                                                )
                                              ]),
                                            },
                                          ),
                                        });

                                        firestoreBatch
                                            .update(widget.post!.reference, {
                                          ...mapToFirestore(
                                            {
                                              'Voters': FieldValue.arrayRemove([
                                                getVotersFirestoreData(
                                                  createVotersStruct(
                                                    userReference:
                                                        currentUserReference,
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
                                        firestoreBatch
                                            .update(widget.post!.reference, {
                                          ...mapToFirestore(
                                            {
                                              'Voters': FieldValue.arrayUnion([
                                                getVotersFirestoreData(
                                                  createVotersStruct(
                                                    userReference:
                                                        currentUserReference,
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
                                    }
                                  } finally {
                                    await firestoreBatch.commit();
                                  }
                                },
                              ),
                          ],
                        ),
                        Stack(
                          children: [
                            if (functions
                                    .voterInList(widget.post!.voters.toList(),
                                        currentUserReference!)
                                    .toString() ==
                                '-1')
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
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
                                      FirebaseFirestore.instance.batch();
                                  try {
                                    if (functions
                                            .voterInList(
                                                widget.post!.voters.toList(),
                                                currentUserReference!)
                                            .toString() ==
                                        '-1') {
                                      firestoreBatch
                                          .update(widget.post!.reference, {
                                        ...mapToFirestore(
                                          {
                                            'Voters': FieldValue.arrayRemove([
                                              getVotersFirestoreData(
                                                createVotersStruct(
                                                  userReference:
                                                      currentUserReference,
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
                                      if (functions
                                              .voterInList(
                                                  widget.post!.voters.toList(),
                                                  currentUserReference!)
                                              .toString() ==
                                          '1') {
                                        firestoreBatch
                                            .update(widget.post!.reference, {
                                          ...mapToFirestore(
                                            {
                                              'Voters': FieldValue.arrayUnion([
                                                getVotersFirestoreData(
                                                  createVotersStruct(
                                                    userReference:
                                                        currentUserReference,
                                                    voteValue: -1,
                                                    clearUnsetFields: false,
                                                  ),
                                                  true,
                                                )
                                              ]),
                                            },
                                          ),
                                        });

                                        firestoreBatch
                                            .update(widget.post!.reference, {
                                          ...mapToFirestore(
                                            {
                                              'Voters': FieldValue.arrayRemove([
                                                getVotersFirestoreData(
                                                  createVotersStruct(
                                                    userReference:
                                                        currentUserReference,
                                                    voteValue: 1,
                                                    clearUnsetFields: false,
                                                  ),
                                                  true,
                                                )
                                              ]),
                                            },
                                          ),
                                        });
                                      } else {
                                        firestoreBatch
                                            .update(widget.post!.reference, {
                                          ...mapToFirestore(
                                            {
                                              'Voters': FieldValue.arrayUnion([
                                                getVotersFirestoreData(
                                                  createVotersStruct(
                                                    userReference:
                                                        currentUserReference,
                                                    voteValue: -1,
                                                    clearUnsetFields: false,
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
                                    await firestoreBatch.commit();
                                  }
                                },
                              ),
                            if (functions
                                    .voterInList(widget.post!.voters.toList(),
                                        currentUserReference!)
                                    .toString() !=
                                '-1')
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
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
                                      FirebaseFirestore.instance.batch();
                                  try {
                                    if (functions
                                            .voterInList(
                                                widget.post!.voters.toList(),
                                                currentUserReference!)
                                            .toString() ==
                                        '-1') {
                                      firestoreBatch
                                          .update(widget.post!.reference, {
                                        ...mapToFirestore(
                                          {
                                            'Voters': FieldValue.arrayRemove([
                                              getVotersFirestoreData(
                                                createVotersStruct(
                                                  userReference:
                                                      currentUserReference,
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
                                      if (functions
                                              .voterInList(
                                                  widget.post!.voters.toList(),
                                                  currentUserReference!)
                                              .toString() ==
                                          '1') {
                                        firestoreBatch
                                            .update(widget.post!.reference, {
                                          ...mapToFirestore(
                                            {
                                              'Voters': FieldValue.arrayUnion([
                                                getVotersFirestoreData(
                                                  createVotersStruct(
                                                    userReference:
                                                        currentUserReference,
                                                    voteValue: -1,
                                                    clearUnsetFields: false,
                                                  ),
                                                  true,
                                                )
                                              ]),
                                            },
                                          ),
                                        });

                                        firestoreBatch
                                            .update(widget.post!.reference, {
                                          ...mapToFirestore(
                                            {
                                              'Voters': FieldValue.arrayRemove([
                                                getVotersFirestoreData(
                                                  createVotersStruct(
                                                    userReference:
                                                        currentUserReference,
                                                    voteValue: 1,
                                                    clearUnsetFields: false,
                                                  ),
                                                  true,
                                                )
                                              ]),
                                            },
                                          ),
                                        });
                                      } else {
                                        firestoreBatch
                                            .update(widget.post!.reference, {
                                          ...mapToFirestore(
                                            {
                                              'Voters': FieldValue.arrayUnion([
                                                getVotersFirestoreData(
                                                  createVotersStruct(
                                                    userReference:
                                                        currentUserReference,
                                                    voteValue: -1,
                                                    clearUnsetFields: false,
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
                                    await firestoreBatch.commit();
                                  }
                                },
                              ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
