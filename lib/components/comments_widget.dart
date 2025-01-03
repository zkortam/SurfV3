import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/comment_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'comments_model.dart';
export 'comments_model.dart';

class CommentsWidget extends StatefulWidget {
  const CommentsWidget({
    super.key,
    this.post,
    this.thread,
    this.authorID,
  });

  final DocumentReference? post;
  final DocumentReference? thread;
  final DocumentReference? authorID;

  @override
  State<CommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {
  late CommentsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentsModel());

    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 700.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 30.0,
                      buttonSize: 42.0,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      icon: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).info,
                        size: 15.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 37.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'vy3miz2z' /* Comments */,
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
          Stack(
            children: [
              if (widget.post != null)
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                  child: StreamBuilder<List<CommentsRecord>>(
                    stream: FFAppState().comments(
                      requestFn: () => queryCommentsRecord(
                        queryBuilder: (commentsRecord) => commentsRecord
                            .where(
                              'PostReference',
                              isEqualTo: widget.post,
                              isNull: (widget.post) == null,
                            )
                            .orderBy('TimeStamp', descending: true),
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
                      List<CommentsRecord> listViewPostCommentsRecordList =
                          snapshot.data!;

                      return ListView.separated(
                        padding: const EdgeInsets.fromLTRB(
                          0,
                          10.0,
                          0,
                          0,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewPostCommentsRecordList.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                        itemBuilder: (context, listViewPostIndex) {
                          final listViewPostCommentsRecord =
                              listViewPostCommentsRecordList[listViewPostIndex];
                          return Visibility(
                            visible: !listViewPostCommentsRecord.isReply,
                            child: CommentWidget(
                              key: Key(
                                  'Keyvpn_${listViewPostIndex}_of_${listViewPostCommentsRecordList.length}'),
                              comment: listViewPostCommentsRecord,
                              post: widget.post!,
                              thread: widget.thread!,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              if (widget.thread != null)
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                  child: StreamBuilder<List<CommentsRecord>>(
                    stream: queryCommentsRecord(
                      queryBuilder: (commentsRecord) => commentsRecord
                          .where(
                            'ThreadReference',
                            isEqualTo: widget.thread,
                            isNull: (widget.thread) == null,
                          )
                          .orderBy('TimeStamp', descending: true),
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
                      List<CommentsRecord> listViewThreadCommentsRecordList =
                          snapshot.data!;

                      return ListView.separated(
                        padding: const EdgeInsets.fromLTRB(
                          0,
                          10.0,
                          0,
                          0,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewThreadCommentsRecordList.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                        itemBuilder: (context, listViewThreadIndex) {
                          final listViewThreadCommentsRecord =
                              listViewThreadCommentsRecordList[
                                  listViewThreadIndex];
                          return Visibility(
                            visible: listViewThreadCommentsRecord.isReply,
                            child: CommentWidget(
                              key: Key(
                                  'Key49i_${listViewThreadIndex}_of_${listViewThreadCommentsRecordList.length}'),
                              comment: listViewThreadCommentsRecord,
                              post: widget.post!,
                              thread: widget.thread!,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(
                        minHeight: 55.0,
                        maxHeight: 300.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 3.0,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model.emailTextController,
                                    focusNode: _model.emailFocusNode,
                                    autofocus: false,
                                    textInputAction: TextInputAction.done,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'w4lw53yt' /* Comment */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      contentPadding: const EdgeInsets.all(10.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                    maxLines: 3,
                                    minLines: 1,
                                    validator: _model
                                        .emailTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 5.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      allowPhoto: true,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      safeSetState(
                                          () => _model.isDataUploading = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      var downloadUrls = <String>[];
                                      try {
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();

                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        _model.isDataUploading = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        safeSetState(() {
                                          _model.uploadedLocalFile =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl =
                                              downloadUrls.first;
                                        });
                                      } else {
                                        safeSetState(() {});
                                        return;
                                      }
                                    }
                                  },
                                  child: Icon(
                                    Icons.add_rounded,
                                    color: _model.isDataUploading ||
                                            (_model.uploadedFileUrl != '')
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .primaryText,
                                    size: 23.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 3.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  buttonSize: 45.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  icon: Icon(
                                    Icons.send_rounded,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 20.0,
                                  ),
                                  onPressed: () async {
                                    var shouldSetState = false;
                                    final firestoreBatch =
                                        FirebaseFirestore.instance.batch();
                                    try {
                                      var commentsRecordReference =
                                          CommentsRecord.collection.doc();
                                      firestoreBatch.set(
                                          commentsRecordReference,
                                          createCommentsRecordData(
                                            timeStamp: getCurrentTimestamp,
                                            postReference: widget.post,
                                            threadReference: widget.thread,
                                            author: currentUserReference,
                                            text:
                                                _model.emailTextController.text,
                                            isStealth: valueOrDefault<bool>(
                                                currentUserDocument?.isStealth,
                                                false),
                                            image: _model.uploadedFileUrl,
                                            isReply: false,
                                          ));
                                      _model.comment =
                                          CommentsRecord.getDocumentFromData(
                                              createCommentsRecordData(
                                                timeStamp: getCurrentTimestamp,
                                                postReference: widget.post,
                                                threadReference: widget.thread,
                                                author: currentUserReference,
                                                text: _model
                                                    .emailTextController.text,
                                                isStealth: valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.isStealth,
                                                    false),
                                                image: _model.uploadedFileUrl,
                                                isReply: false,
                                              ),
                                              commentsRecordReference);
                                      shouldSetState = true;
                                      safeSetState(() {
                                        _model.emailTextController?.clear();
                                      });
                                      safeSetState(() {
                                        _model.isDataUploading = false;
                                        _model.uploadedLocalFile =
                                            FFUploadedFile(
                                                bytes: Uint8List.fromList([]));
                                        _model.uploadedFileUrl = '';
                                      });

                                      if (widget.authorID !=
                                          currentUserReference) {
                                        var notificationsRecordReference =
                                            NotificationsRecord.collection
                                                .doc();
                                        firestoreBatch.set(
                                            notificationsRecordReference,
                                            createNotificationsRecordData(
                                              sourcePost: widget.post,
                                              sourceThread: widget.thread,
                                              sourceComment:
                                                  _model.comment?.reference,
                                              sourceUser: currentUserReference,
                                              targetUser: widget.authorID,
                                              time: getCurrentTimestamp,
                                              type: 'Comment',
                                              contentType: widget.post != null
                                                  ? 'Post'
                                                  : 'Thread',
                                            ));
                                        _model.notification = NotificationsRecord
                                            .getDocumentFromData(
                                                createNotificationsRecordData(
                                                  sourcePost: widget.post,
                                                  sourceThread: widget.thread,
                                                  sourceComment:
                                                      _model.comment?.reference,
                                                  sourceUser:
                                                      currentUserReference,
                                                  targetUser: widget.authorID,
                                                  time: getCurrentTimestamp,
                                                  type: 'Comment',
                                                  contentType:
                                                      widget.post != null
                                                          ? 'Post'
                                                          : 'Thread',
                                                ),
                                                notificationsRecordReference);
                                        shouldSetState = true;

                                        firestoreBatch
                                            .update(widget.authorID!, {
                                          ...mapToFirestore(
                                            {
                                              'notifications':
                                                  FieldValue.arrayUnion([
                                                getNotificationFirestoreData(
                                                  createNotificationStruct(
                                                    type: 'Comment',
                                                    time: getCurrentTimestamp,
                                                    clearUnsetFields: false,
                                                  ),
                                                  true,
                                                )
                                              ]),
                                              'notificationsReferences':
                                                  FieldValue.arrayUnion([
                                                _model.notification?.reference
                                              ]),
                                            },
                                          ),
                                        });
                                        if (widget.post != null) {
                                          firestoreBatch.update(widget.post!, {
                                            ...mapToFirestore(
                                              {
                                                'comments':
                                                    FieldValue.arrayUnion([
                                                  _model.comment?.reference
                                                ]),
                                              },
                                            ),
                                          });
                                        } else {
                                          firestoreBatch
                                              .update(widget.thread!, {
                                            ...mapToFirestore(
                                              {
                                                'comments':
                                                    FieldValue.arrayUnion([
                                                  _model.comment?.reference
                                                ]),
                                              },
                                            ),
                                          });
                                        }
                                      } else {
                                        if (shouldSetState) {
                                          safeSetState(() {});
                                        }
                                        return;
                                      }
                                    } finally {
                                      await firestoreBatch.commit();
                                    }

                                    if (shouldSetState) safeSetState(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                          if (_model.uploadedFileUrl != '')
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                width: double.infinity,
                                height: 200.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.network(
                                      _model.uploadedFileUrl,
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
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
    );
  }
}
