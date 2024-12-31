import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/other_chat_widget.dart';
import '/components/user_chat_widget.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:record/record.dart';
import 'single_chat_model.dart';
export 'single_chat_model.dart';

class SingleChatWidget extends StatefulWidget {
  const SingleChatWidget({
    super.key,
    required this.chat,
  });

  final ChatsRecord? chat;

  @override
  State<SingleChatWidget> createState() => _SingleChatWidgetState();
}

class _SingleChatWidgetState extends State<SingleChatWidget> {
  late SingleChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SingleChatModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.listViewController?.animateTo(
        _model.listViewController!.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.ease,
      );
      unawaited(
        () async {
          await widget.chat!.reference.update({
            ...mapToFirestore(
              {
                'userChatData': getUserMessageDataListFirestoreData(
                  functions.updateUserLatestTime(currentUserReference!,
                      widget.chat!.userChatData.toList(), getCurrentTimestamp),
                ),
              },
            ),
          });
        }(),
      );
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ChatsRecord>(
      stream: ChatsRecord.getDocument(widget.chat!.reference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitFadingFour(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }

        final singleChatChatsRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FutureBuilder<UsersRecord>(
                      future: UsersRecord.getDocumentOnce(
                          functions.returnOtherUser(
                              widget.chat!.users.toList(),
                              currentUserReference!)),
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

                        return Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 4.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.replay,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      context.safePop();
                                    },
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (widget.chat!.users.length < 2) {
                                          context.pushNamed(
                                            'Profile',
                                            queryParameters: {
                                              'userReference': serializeParam(
                                                functions.returnOtherUser(
                                                    widget.chat!.users
                                                        .toList(),
                                                    currentUserReference!),
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        }
                                      },
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget.chat!.users.length > 2
                                              ? widget.chat?.title
                                              : containerUsersRecord.name,
                                          'Name',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 2.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (widget.chat!.users.length < 2) {
                                        context.pushNamed(
                                          'Profile',
                                          queryParameters: {
                                            'userReference': serializeParam(
                                              functions.returnOtherUser(
                                                  widget.chat!.users.toList(),
                                                  currentUserReference!),
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }
                                    },
                                    child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            const Duration(milliseconds: 500),
                                        fadeOutDuration:
                                            const Duration(milliseconds: 500),
                                        imageUrl: widget.chat!.users.length > 2
                                            ? widget.chat!.image
                                            : containerUsersRecord.photoUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    1.0, 0.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final chatMessages =
                                        singleChatChatsRecord.chats.toList();

                                    return RefreshIndicator(
                                      onRefresh: () async {
                                        await _model.listViewController
                                            ?.animateTo(
                                          _model.listViewController!.position
                                              .maxScrollExtent,
                                          duration: const Duration(milliseconds: 100),
                                          curve: Curves.ease,
                                        );
                                      },
                                      child: ListView.separated(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: chatMessages.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 10.0),
                                        itemBuilder:
                                            (context, chatMessagesIndex) {
                                          final chatMessagesItem =
                                              chatMessages[chatMessagesIndex];
                                          return FutureBuilder<
                                              ChatMessagesRecord>(
                                            future: ChatMessagesRecord
                                                .getDocumentOnce(
                                                    chatMessagesItem),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    child: SpinKitFadingFour(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                );
                                              }

                                              final stackChatMessagesRecord =
                                                  snapshot.data!;

                                              return Stack(
                                                children: [
                                                  if (currentUserReference ==
                                                      stackChatMessagesRecord
                                                          .authorID)
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Flexible(
                                                          child: Container(
                                                            constraints:
                                                                const BoxConstraints(
                                                              maxWidth: 350.0,
                                                            ),
                                                            child:
                                                                UserChatWidget(
                                                              key: Key(
                                                                  'Keycca_${chatMessagesIndex}_of_${chatMessages.length}'),
                                                              message:
                                                                  stackChatMessagesRecord,
                                                              chat:
                                                                  singleChatChatsRecord,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  if (currentUserReference !=
                                                      stackChatMessagesRecord
                                                          .authorID)
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Flexible(
                                                          child: Container(
                                                            constraints:
                                                                const BoxConstraints(
                                                              maxWidth: 350.0,
                                                            ),
                                                            child:
                                                                OtherChatWidget(
                                                              key: Key(
                                                                  'Keykcb_${chatMessagesIndex}_of_${chatMessages.length}'),
                                                              message:
                                                                  stackChatMessagesRecord,
                                                              chat:
                                                                  singleChatChatsRecord,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        controller: _model.listViewController,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              constraints: const BoxConstraints(
                                minHeight: 70.0,
                                maxHeight: 300.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (_model.isRecording)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 5.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: const Color(0xA44B39EF),
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 3.0,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '294qjr53' /* Recording */,
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
                                    ),
                                  if (_model.isAddingMedia)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  1.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: const BoxDecoration(),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (_model.uploadedFileUrl1 !=
                                                            '') {
                                                      safeSetState(() {
                                                        _model.isDataUploading1 =
                                                            false;
                                                        _model.uploadedLocalFile1 =
                                                            FFUploadedFile(
                                                                bytes: Uint8List
                                                                    .fromList(
                                                                        []));
                                                        _model.uploadedFileUrl1 =
                                                            '';
                                                      });

                                                      return;
                                                    }
                                                    final selectedMedia =
                                                        await selectMedia(
                                                      mediaSource: MediaSource
                                                          .photoGallery,
                                                      multiImage: false,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      safeSetState(() => _model
                                                              .isDataUploading1 =
                                                          true);
                                                      var selectedUploadedFiles =
                                                          <FFUploadedFile>[];

                                                      var downloadUrls =
                                                          <String>[];
                                                      try {
                                                        selectedUploadedFiles =
                                                            selectedMedia
                                                                .map((m) =>
                                                                    FFUploadedFile(
                                                                      name: m
                                                                          .storagePath
                                                                          .split(
                                                                              '/')
                                                                          .last,
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                      blurHash:
                                                                          m.blurHash,
                                                                    ))
                                                                .toList();

                                                        downloadUrls =
                                                            (await Future.wait(
                                                          selectedMedia.map(
                                                            (m) async =>
                                                                await uploadData(
                                                                    m.storagePath,
                                                                    m.bytes),
                                                          ),
                                                        ))
                                                                .where((u) =>
                                                                    u != null)
                                                                .map((u) => u!)
                                                                .toList();
                                                      } finally {
                                                        _model.isDataUploading1 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                                  .length ==
                                                              selectedMedia
                                                                  .length &&
                                                          downloadUrls.length ==
                                                              selectedMedia
                                                                  .length) {
                                                        safeSetState(() {
                                                          _model.uploadedLocalFile1 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                          _model.uploadedFileUrl1 =
                                                              downloadUrls
                                                                  .first;
                                                        });
                                                      } else {
                                                        safeSetState(() {});
                                                        return;
                                                      }
                                                    }
                                                  },
                                                  child: Icon(
                                                    Icons.image_rounded,
                                                    color: _model.uploadedFileUrl1 !=
                                                                ''
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    size: 25.0,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: const BoxDecoration(),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (_model.uploadedFileUrl2 !=
                                                            '') {
                                                      safeSetState(() {
                                                        _model.isDataUploading2 =
                                                            false;
                                                        _model.uploadedLocalFile2 =
                                                            FFUploadedFile(
                                                                bytes: Uint8List
                                                                    .fromList(
                                                                        []));
                                                        _model.uploadedFileUrl2 =
                                                            '';
                                                      });

                                                      return;
                                                    }
                                                    final selectedMedia =
                                                        await selectMedia(
                                                      multiImage: false,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      safeSetState(() => _model
                                                              .isDataUploading2 =
                                                          true);
                                                      var selectedUploadedFiles =
                                                          <FFUploadedFile>[];

                                                      var downloadUrls =
                                                          <String>[];
                                                      try {
                                                        selectedUploadedFiles =
                                                            selectedMedia
                                                                .map((m) =>
                                                                    FFUploadedFile(
                                                                      name: m
                                                                          .storagePath
                                                                          .split(
                                                                              '/')
                                                                          .last,
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                      blurHash:
                                                                          m.blurHash,
                                                                    ))
                                                                .toList();

                                                        downloadUrls =
                                                            (await Future.wait(
                                                          selectedMedia.map(
                                                            (m) async =>
                                                                await uploadData(
                                                                    m.storagePath,
                                                                    m.bytes),
                                                          ),
                                                        ))
                                                                .where((u) =>
                                                                    u != null)
                                                                .map((u) => u!)
                                                                .toList();
                                                      } finally {
                                                        _model.isDataUploading2 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                                  .length ==
                                                              selectedMedia
                                                                  .length &&
                                                          downloadUrls.length ==
                                                              selectedMedia
                                                                  .length) {
                                                        safeSetState(() {
                                                          _model.uploadedLocalFile2 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                          _model.uploadedFileUrl2 =
                                                              downloadUrls
                                                                  .first;
                                                        });
                                                      } else {
                                                        safeSetState(() {});
                                                        return;
                                                      }
                                                    }
                                                  },
                                                  child: Icon(
                                                    Icons.camera_alt_rounded,
                                                    color: _model.uploadedFileUrl2 !=
                                                                ''
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    size: 27.0,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: const BoxDecoration(),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (_model.uploadedFileUrl3 !=
                                                            '') {
                                                      safeSetState(() {
                                                        _model.isDataUploading3 =
                                                            false;
                                                        _model.uploadedLocalFile3 =
                                                            FFUploadedFile(
                                                                bytes: Uint8List
                                                                    .fromList(
                                                                        []));
                                                        _model.uploadedFileUrl3 =
                                                            '';
                                                      });

                                                      return;
                                                    }
                                                    final selectedFiles =
                                                        await selectFiles(
                                                      multiFile: false,
                                                    );
                                                    if (selectedFiles != null) {
                                                      safeSetState(() => _model
                                                              .isDataUploading3 =
                                                          true);
                                                      var selectedUploadedFiles =
                                                          <FFUploadedFile>[];

                                                      var downloadUrls =
                                                          <String>[];
                                                      try {
                                                        selectedUploadedFiles =
                                                            selectedFiles
                                                                .map((m) =>
                                                                    FFUploadedFile(
                                                                      name: m
                                                                          .storagePath
                                                                          .split(
                                                                              '/')
                                                                          .last,
                                                                      bytes: m
                                                                          .bytes,
                                                                    ))
                                                                .toList();

                                                        downloadUrls =
                                                            (await Future.wait(
                                                          selectedFiles.map(
                                                            (f) async =>
                                                                await uploadData(
                                                                    f.storagePath,
                                                                    f.bytes),
                                                          ),
                                                        ))
                                                                .where((u) =>
                                                                    u != null)
                                                                .map((u) => u!)
                                                                .toList();
                                                      } finally {
                                                        _model.isDataUploading3 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                                  .length ==
                                                              selectedFiles
                                                                  .length &&
                                                          downloadUrls.length ==
                                                              selectedFiles
                                                                  .length) {
                                                        safeSetState(() {
                                                          _model.uploadedLocalFile3 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                          _model.uploadedFileUrl3 =
                                                              downloadUrls
                                                                  .first;
                                                        });
                                                      } else {
                                                        safeSetState(() {});
                                                        return;
                                                      }
                                                    }
                                                  },
                                                  child: Icon(
                                                    Icons
                                                        .insert_drive_file_rounded,
                                                    color: _model.uploadedFileUrl3 !=
                                                                ''
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    size: 26.0,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: const BoxDecoration(),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (_model.uploadedFileUrl4 !=
                                                            '') {
                                                      safeSetState(() {
                                                        _model.isDataUploading4 =
                                                            false;
                                                        _model.uploadedLocalFile4 =
                                                            FFUploadedFile(
                                                                bytes: Uint8List
                                                                    .fromList(
                                                                        []));
                                                        _model.uploadedFileUrl4 =
                                                            '';
                                                      });

                                                      return;
                                                    }
                                                    final selectedFiles =
                                                        await selectFiles(
                                                      allowedExtensions: [
                                                        'mp3'
                                                      ],
                                                      multiFile: false,
                                                    );
                                                    if (selectedFiles != null) {
                                                      safeSetState(() => _model
                                                              .isDataUploading4 =
                                                          true);
                                                      var selectedUploadedFiles =
                                                          <FFUploadedFile>[];

                                                      var downloadUrls =
                                                          <String>[];
                                                      try {
                                                        selectedUploadedFiles =
                                                            selectedFiles
                                                                .map((m) =>
                                                                    FFUploadedFile(
                                                                      name: m
                                                                          .storagePath
                                                                          .split(
                                                                              '/')
                                                                          .last,
                                                                      bytes: m
                                                                          .bytes,
                                                                    ))
                                                                .toList();

                                                        downloadUrls =
                                                            (await Future.wait(
                                                          selectedFiles.map(
                                                            (f) async =>
                                                                await uploadData(
                                                                    f.storagePath,
                                                                    f.bytes),
                                                          ),
                                                        ))
                                                                .where((u) =>
                                                                    u != null)
                                                                .map((u) => u!)
                                                                .toList();
                                                      } finally {
                                                        _model.isDataUploading4 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                                  .length ==
                                                              selectedFiles
                                                                  .length &&
                                                          downloadUrls.length ==
                                                              selectedFiles
                                                                  .length) {
                                                        safeSetState(() {
                                                          _model.uploadedLocalFile4 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                          _model.uploadedFileUrl4 =
                                                              downloadUrls
                                                                  .first;
                                                        });
                                                      } else {
                                                        safeSetState(() {});
                                                        return;
                                                      }
                                                    }
                                                  },
                                                  child: Icon(
                                                    Icons.headphones_rounded,
                                                    color: _model.uploadedFileUrl4 !=
                                                                ''
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    size: 26.0,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: const BoxDecoration(),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: Icon(
                                                    Icons.gif_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 49.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Flexible(
                                                      child: SizedBox(
                                                        width: double.infinity,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textController,
                                                          focusNode: _model
                                                              .textFieldFocusNode,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.textController',
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                            () => safeSetState(
                                                                () {}),
                                                          ),
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'jftbzayw' /* Surf Message */,
                                                            ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            contentPadding:
                                                                const EdgeInsets.all(
                                                                    18.0),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                          maxLines: 4,
                                                          minLines: 1,
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .textControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if (_model
                                                              .isAddingMedia) {
                                                            _model.isAddingMedia =
                                                                false;
                                                            safeSetState(() {});
                                                          } else {
                                                            _model.isAddingMedia =
                                                                true;
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        child: Icon(
                                                          Icons.add_rounded,
                                                          color: _model
                                                                  .isAddingMedia
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primary
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        if ((functions.stringLength(_model
                                                    .textController.text) ==
                                                0) &&
                                            (_model.audio == null ||
                                                _model.audio == ''))
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (_model.isRecording) {
                                                HapticFeedback.heavyImpact();
                                                await stopAudioRecording(
                                                  audioRecorder:
                                                      _model.audioRecorder,
                                                  audioName:
                                                      'recordedFileBytes',
                                                  onRecordingComplete:
                                                      (audioFilePath,
                                                          audioBytes) {
                                                    _model.recording =
                                                        audioFilePath;
                                                    _model.recordedFileBytes =
                                                        audioBytes;
                                                  },
                                                );

                                                _model.audio = _model.recording;
                                                _model.isRecording = false;
                                                safeSetState(() {});
                                              } else {
                                                HapticFeedback.heavyImpact();
                                                _model.isRecording = true;
                                                safeSetState(() {});
                                                await startAudioRecording(
                                                  context,
                                                  audioRecorder:
                                                      _model.audioRecorder ??=
                                                          AudioRecorder(),
                                                );
                                              }

                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.mic_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        if (_model.audio != null &&
                                            _model.audio != '')
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderRadius: 40.0,
                                              buttonSize: 50.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              icon: Icon(
                                                Icons.highlight_off,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                _model.audio = null;
                                                safeSetState(() {});
                                              },
                                            ),
                                          ),
                                        if ((functions.stringLength(_model
                                                    .textController.text) >
                                                0) ||
                                            (_model.output?.audio != null &&
                                                _model.output?.audio != '') ||
                                            (_model.uploadedFileUrl1 !=
                                                    '') ||
                                            (_model.uploadedFileUrl2 !=
                                                    '') ||
                                            (_model.uploadedFileUrl3 !=
                                                    '') ||
                                            (_model.uploadedFileUrl4 != ''))
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 40.0,
                                              buttonSize: 50.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              icon: Icon(
                                                Icons.arrow_forward_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                final firestoreBatch =
                                                    FirebaseFirestore.instance
                                                        .batch();
                                                try {
                                                  HapticFeedback.mediumImpact();

                                                  var chatMessagesRecordReference =
                                                      ChatMessagesRecord
                                                          .createDoc(widget
                                                              .chat!.reference);
                                                  firestoreBatch.set(
                                                      chatMessagesRecordReference,
                                                      createChatMessagesRecordData(
                                                        text: _model
                                                            .textController
                                                            .text,
                                                        timeStamp:
                                                            getCurrentTimestamp,
                                                        authorID:
                                                            currentUserReference,
                                                        image: () {
                                                          if (_model.uploadedFileUrl1 !=
                                                                  '') {
                                                            return _model
                                                                .uploadedFileUrl1;
                                                          } else if (_model.uploadedFileUrl2 !=
                                                                  '') {
                                                            return _model
                                                                .uploadedFileUrl2;
                                                          } else {
                                                            return '';
                                                          }
                                                        }(),
                                                        audio: () {
                                                          if (_model.recording !=
                                                                  null &&
                                                              _model.recording !=
                                                                  '') {
                                                            return _model
                                                                .recording;
                                                          } else if (_model.uploadedFileUrl4 !=
                                                                  '') {
                                                            return _model
                                                                .uploadedFileUrl4;
                                                          } else {
                                                            return '';
                                                          }
                                                        }(),
                                                        file: _model
                                                            .uploadedFileUrl3,
                                                      ));
                                                  _model.output = ChatMessagesRecord
                                                      .getDocumentFromData(
                                                          createChatMessagesRecordData(
                                                            text: _model
                                                                .textController
                                                                .text,
                                                            timeStamp:
                                                                getCurrentTimestamp,
                                                            authorID:
                                                                currentUserReference,
                                                            image: () {
                                                              if (_model.uploadedFileUrl1 !=
                                                                      '') {
                                                                return _model
                                                                    .uploadedFileUrl1;
                                                              } else if (_model.uploadedFileUrl2 !=
                                                                      '') {
                                                                return _model
                                                                    .uploadedFileUrl2;
                                                              } else {
                                                                return '';
                                                              }
                                                            }(),
                                                            audio: () {
                                                              if (_model.recording !=
                                                                      null &&
                                                                  _model.recording !=
                                                                      '') {
                                                                return _model
                                                                    .recording;
                                                              } else if (_model.uploadedFileUrl4 !=
                                                                      '') {
                                                                return _model
                                                                    .uploadedFileUrl4;
                                                              } else {
                                                                return '';
                                                              }
                                                            }(),
                                                            file: _model
                                                                .uploadedFileUrl3,
                                                          ),
                                                          chatMessagesRecordReference);

                                                  firestoreBatch.update(
                                                      widget.chat!.reference, {
                                                    ...createChatsRecordData(
                                                      lastTime:
                                                          getCurrentTimestamp,
                                                      lastMessage:
                                                          _model.uploadedFileUrl1 !=
                                                                      ''
                                                              ? 'Sent an Image'
                                                              : _model
                                                                  .textController
                                                                  .text,
                                                      lastUser:
                                                          currentUserReference,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'chats': FieldValue
                                                            .arrayUnion([
                                                          _model
                                                              .output?.reference
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                  safeSetState(() {
                                                    _model.textController
                                                        ?.clear();
                                                  });
                                                  safeSetState(() {
                                                    _model.isDataUploading1 =
                                                        false;
                                                    _model.uploadedLocalFile1 =
                                                        FFUploadedFile(
                                                            bytes: Uint8List
                                                                .fromList([]));
                                                    _model.uploadedFileUrl1 =
                                                        '';
                                                  });

                                                  _model.refresh = 1;
                                                  safeSetState(() {});
                                                  await _model
                                                      .listViewController
                                                      ?.animateTo(
                                                    _model
                                                        .listViewController!
                                                        .position
                                                        .maxScrollExtent,
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    curve: Curves.ease,
                                                  );
                                                } finally {
                                                  await firestoreBatch.commit();
                                                }

                                                safeSetState(() {});
                                              },
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  if (_model.audio != null &&
                                      _model.audio != '')
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 3.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 5.0),
                                          child: FlutterFlowAudioPlayer(
                                            audio: Audio.network(
                                              _model.audio!,
                                              metas: Metas(
                                                title: 'Recording',
                                              ),
                                            ),
                                            titleTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 0.0,
                                                      letterSpacing: 0.0,
                                                      lineHeight: 0.0,
                                                    ),
                                            playbackDurationTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Outfit',
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            fillColor: const Color(0x00000000),
                                            playbackButtonColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            activeTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            elevation: 0.0,
                                            playInBackground: PlayInBackground
                                                .disabledRestoreOnForeground,
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
