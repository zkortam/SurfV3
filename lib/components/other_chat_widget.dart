import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/post_compressed_widget.dart';
import '/components/threads_compressed_widget.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'other_chat_model.dart';
export 'other_chat_model.dart';

class OtherChatWidget extends StatefulWidget {
  const OtherChatWidget({
    super.key,
    required this.message,
    required this.chat,
  });

  final ChatMessagesRecord? message;
  final ChatsRecord? chat;

  @override
  State<OtherChatWidget> createState() => _OtherChatWidgetState();
}

class _OtherChatWidgetState extends State<OtherChatWidget> {
  late OtherChatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtherChatModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (widget.message?.image != null && widget.message?.image != '')
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                width: 280.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 3.0,
                  ),
                ),
                child: Stack(
                  alignment: const AlignmentDirectional(1.0, 1.0),
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: FlutterFlowExpandedImageView(
                              image: CachedNetworkImage(
                                fadeInDuration: const Duration(milliseconds: 500),
                                fadeOutDuration: const Duration(milliseconds: 500),
                                imageUrl: widget.message!.image,
                                fit: BoxFit.contain,
                              ),
                              allowRotation: false,
                              tag: widget.message!.image,
                              useHeroAnimation: true,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: widget.message!.image,
                        transitionOnUserGestures: true,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(28.0),
                          child: CachedNetworkImage(
                            fadeInDuration: const Duration(milliseconds: 500),
                            fadeOutDuration: const Duration(milliseconds: 500),
                            imageUrl: widget.message!.image,
                            width: double.infinity,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    if ((widget.message?.image != null &&
                            widget.message?.image != '') &&
                        (widget.message?.text == null ||
                            widget.message?.text == ''))
                      Align(
                        alignment: const AlignmentDirectional(1.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 15.0, 10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (widget.chat!.users.length > 2)
                                Stack(
                                  children: [
                                    if (!functions.checkIfReadOther(
                                        widget.message!.timeStamp!,
                                        widget.chat!.userChatData.toList(),
                                        currentUserReference!))
                                      Icon(
                                        Icons.check_circle_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 16.0,
                                      ),
                                    if (functions.checkIfReadOther(
                                        widget.message!.timeStamp!,
                                        widget.chat!.userChatData.toList(),
                                        currentUserReference!))
                                      Icon(
                                        Icons.check_circle_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 16.0,
                                      ),
                                  ],
                                ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 2.0, 0.0, 0.0),
                                child: Text(
                                  dateTimeFormat(
                                    "relative",
                                    widget.message!.timeStamp!,
                                    locale: FFLocalizations.of(context)
                                            .languageShortCode ??
                                        FFLocalizations.of(context)
                                            .languageCode,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (widget.chat!.users.length > 2)
                      Align(
                        alignment: const AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 5.0, 15.0),
                          child: FutureBuilder<UsersRecord>(
                            future: UsersRecord.getDocumentOnce(
                                widget.message!.authorID!),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40.0,
                                    height: 40.0,
                                    child: SpinKitFadingFour(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 40.0,
                                    ),
                                  ),
                                );
                              }

                              final textUsersRecord = snapshot.data!;

                              return Text(
                                textUsersRecord.name,
                                maxLines: 6,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                              );
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        if (widget.message?.text != null && widget.message?.text != '')
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                width: 280.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (widget.chat!.users.length > 2)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 0.0),
                                  child: FutureBuilder<UsersRecord>(
                                    future: UsersRecord.getDocumentOnce(
                                        widget.message!.authorID!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 40.0,
                                            height: 40.0,
                                            child: SpinKitFadingFour(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 40.0,
                                            ),
                                          ),
                                        );
                                      }

                                      final textUsersRecord = snapshot.data!;

                                      return Text(
                                        textUsersRecord.name,
                                        maxLines: 6,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      );
                                    },
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 5.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.message?.text,
                                    'Text',
                                  ),
                                  maxLines: 6,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (widget.chat!.users.length > 2)
                              Stack(
                                children: [
                                  if (!functions.checkIfReadOther(
                                      widget.message!.timeStamp!,
                                      widget.chat!.userChatData.toList(),
                                      currentUserReference!))
                                    Icon(
                                      Icons.check_circle_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 16.0,
                                    ),
                                  if (functions.checkIfReadOther(
                                      widget.message!.timeStamp!,
                                      widget.chat!.userChatData.toList(),
                                      currentUserReference!))
                                    Icon(
                                      Icons.check_circle_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 16.0,
                                    ),
                                ],
                              ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 0.0, 0.0),
                              child: Text(
                                dateTimeFormat(
                                  "relative",
                                  widget.message!.timeStamp!,
                                  locale: FFLocalizations.of(context)
                                          .languageShortCode ??
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 11.0,
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
            ),
          ),
        if (widget.message?.audio != null && widget.message?.audio != '')
          Container(
            width: 280.0,
            height: 90.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).alternate,
                width: 3.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
              child: FlutterFlowAudioPlayer(
                audio: Audio.network(
                  widget.message!.audio,
                  metas: Metas(),
                ),
                titleTextStyle:
                    FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Montserrat',
                          fontSize: 0.0,
                          letterSpacing: 0.0,
                        ),
                playbackDurationTextStyle:
                    FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Outfit',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                        ),
                fillColor: const Color(0x00000000),
                playbackButtonColor: FlutterFlowTheme.of(context).primary,
                activeTrackColor: FlutterFlowTheme.of(context).primary,
                elevation: 0.0,
                playInBackground: PlayInBackground.disabledRestoreOnForeground,
              ),
            ),
          ),
        if (widget.message?.file != null && widget.message?.file != '')
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await launchURL(widget.message!.file);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  width: 280.0,
                  decoration: BoxDecoration(
                    color: const Color(0x15DD6A13),
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      color: const Color(0xFFEF8D39),
                      width: 3.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (widget.chat!.users.length > 2)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: FutureBuilder<UsersRecord>(
                                      future: UsersRecord.getDocumentOnce(
                                          widget.message!.authorID!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 40.0,
                                              height: 40.0,
                                              child: SpinKitFadingFour(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 40.0,
                                              ),
                                            ),
                                          );
                                        }

                                        final textUsersRecord = snapshot.data!;

                                        return Text(
                                          textUsersRecord.name,
                                          maxLines: 6,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                        );
                                      },
                                    ),
                                  ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'tgcy9gev' /* Open File */,
                                    ),
                                    maxLines: 6,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (widget.chat!.users.length > 2)
                                Stack(
                                  children: [
                                    if (!functions.checkIfReadOther(
                                        widget.message!.timeStamp!,
                                        widget.chat!.userChatData.toList(),
                                        currentUserReference!))
                                      Icon(
                                        Icons.check_circle_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 16.0,
                                      ),
                                    if (functions.checkIfReadOther(
                                        widget.message!.timeStamp!,
                                        widget.chat!.userChatData.toList(),
                                        currentUserReference!))
                                      Icon(
                                        Icons.check_circle_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 16.0,
                                      ),
                                  ],
                                ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 2.0, 0.0, 0.0),
                                child: Text(
                                  dateTimeFormat(
                                    "relative",
                                    widget.message!.timeStamp!,
                                    locale: FFLocalizations.of(context)
                                            .languageShortCode ??
                                        FFLocalizations.of(context)
                                            .languageCode,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 11.0,
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
              ),
            ),
          ),
        if (widget.message?.thread != null)
          FutureBuilder<ThreadsRecord>(
            future: ThreadsRecord.getDocumentOnce(widget.message!.thread!),
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

              final threadsCompressedThreadsRecord = snapshot.data!;

              return wrapWithModel(
                model: _model.threadsCompressedModel,
                updateCallback: () => safeSetState(() {}),
                child: ThreadsCompressedWidget(
                  thread: threadsCompressedThreadsRecord,
                ),
              );
            },
          ),
        if (widget.message?.post != null)
          StreamBuilder<PostsRecord>(
            stream: PostsRecord.getDocument(widget.message!.post!),
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

              final postCompressedPostsRecord = snapshot.data!;

              return wrapWithModel(
                model: _model.postCompressedModel,
                updateCallback: () => safeSetState(() {}),
                child: PostCompressedWidget(
                  post: postCompressedPostsRecord,
                ),
              );
            },
          ),
      ],
    );
  }
}
