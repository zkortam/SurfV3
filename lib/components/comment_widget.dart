import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/comments_comp_widget.dart';
import '/components/reply_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'comment_model.dart';
export 'comment_model.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget({
    super.key,
    required this.comment,
    required this.post,
    required this.thread,
  });

  final CommentsRecord? comment;
  final DocumentReference? post;
  final DocumentReference? thread;

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  late CommentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentModel());

    _model.replyTextTextController ??= TextEditingController();
    _model.replyTextFocusNode ??= FocusNode();

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
      onLongPress: () async {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: CommentsCompWidget(
                comment: widget.comment!.reference,
                post: widget.post,
                thread: widget.thread,
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      },
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(
          maxHeight: 400.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: StreamBuilder<UsersRecord>(
                    stream: UsersRecord.getDocument(widget.comment!.author!),
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

                      final rowUsersRecord = snapshot.data!;

                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 5.0, 0.0),
                            child: Container(
                              width: 35.0,
                              height: 35.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                rowUsersRecord.photoUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Flexible(
                            child: ClipRRect(
                              child: Container(
                                width: 300.0,
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      3.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            rowUsersRecord.displayName,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 0.0, 2.0, 0.0),
                                            child: Icon(
                                              Icons.circle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 10.0,
                                            ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              dateTimeFormat(
                                                "relative",
                                                widget.comment?.timeStamp,
                                                locale: FFLocalizations.of(
                                                            context)
                                                        .languageShortCode ??
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              'time',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            widget.comment?.text,
                                            'text',
                                          ),
                                          maxLines: 3,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      if (valueOrDefault<String>(
                                                widget.comment?.image,
                                                'text',
                                              ) !=
                                              '')
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 5.0),
                                          child: Container(
                                            width: 200.0,
                                            height: 125.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  valueOrDefault<String>(
                                                    widget.comment?.image,
                                                    'text',
                                                  ),
                                                ).image,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        ),
                                      Container(
                                        width: 125.0,
                                        decoration: const BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (_model.isReplying) {
                                                  _model.isReplying = false;
                                                  _model.replyOn = false;
                                                  safeSetState(() {});
                                                } else {
                                                  _model.isReplying = true;
                                                  _model.replyOn = true;
                                                  safeSetState(() {});
                                                }
                                              },
                                              child: Text(
                                                valueOrDefault<String>(
                                                  _model.isReplying
                                                      ? 'cancel reply'
                                                      : 'reply',
                                                  'reply',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: _model.isReplying
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .error
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                            if (widget
                                                    .comment!.replies.isNotEmpty)
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (_model.replyOn) {
                                                    _model.replyOn = false;
                                                    safeSetState(() {});
                                                  } else {
                                                    _model.replyOn = true;
                                                    safeSetState(() {});
                                                  }
                                                },
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    _model.replyOn
                                                        ? 'hide replies'
                                                        : 'all replies',
                                                    'all replies',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      if (_model.replyOn)
                                        Container(
                                          width: 300.0,
                                          decoration: const BoxDecoration(),
                                          child: Builder(
                                            builder: (context) {
                                              final replies = widget
                                                      .comment?.replies
                                                      .toList() ??
                                                  [];

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: replies.length,
                                                itemBuilder:
                                                    (context, repliesIndex) {
                                                  final repliesItem =
                                                      replies[repliesIndex];
                                                  return StreamBuilder<
                                                      CommentsRecord>(
                                                    stream: CommentsRecord
                                                        .getDocument(
                                                            repliesItem),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 40.0,
                                                            height: 40.0,
                                                            child:
                                                                SpinKitFadingFour(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 40.0,
                                                            ),
                                                          ),
                                                        );
                                                      }

                                                      final replyCommentsRecord =
                                                          snapshot.data!;

                                                      return ReplyWidget(
                                                        key: Key(
                                                            'Keylja_${repliesIndex}_of_${replies.length}'),
                                                        comment:
                                                            replyCommentsRecord,
                                                      );
                                                    },
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
                        ],
                      );
                    },
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        if (functions
                                .voterInList(widget.comment!.votes.toList(),
                                    currentUserReference!)
                                .toString() ==
                            '1')
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 8.0,
                            buttonSize: 35.0,
                            icon: Icon(
                              Icons.favorite,
                              color: FlutterFlowTheme.of(context).error,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              await widget.comment!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'Votes': FieldValue.arrayRemove([
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
                            },
                          ),
                        if (functions
                                .voterInList(widget.comment!.votes.toList(),
                                    currentUserReference!)
                                .toString() !=
                            '1')
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 8.0,
                            buttonSize: 35.0,
                            icon: Icon(
                              Icons.favorite_border_rounded,
                              color: FlutterFlowTheme.of(context).info,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              await widget.comment!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'Votes': FieldValue.arrayUnion([
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
                            },
                          ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.comment?.votes.length.toString(),
                          '0',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (_model.isReplying)
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(40.0, 5.0, 10.0, 5.0),
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(
                    minHeight: 55.0,
                    maxHeight: 80.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
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
                          Flexible(
                            child: SizedBox(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.replyTextTextController,
                                focusNode: _model.replyTextFocusNode,
                                onFieldSubmitted: (_) async {
                                  var commentsRecordReference =
                                      CommentsRecord.collection.doc();
                                  await commentsRecordReference
                                      .set(createCommentsRecordData(
                                    timeStamp: getCurrentTimestamp,
                                    postReference: widget.post,
                                    threadReference: widget.thread,
                                    author: currentUserReference,
                                    text: _model.replyTextTextController.text,
                                    isStealth: valueOrDefault<bool>(
                                        currentUserDocument?.isStealth, false),
                                    replyCommentReference:
                                        widget.comment?.reference,
                                    isReply: true,
                                  ));
                                  _model.commentOutput =
                                      CommentsRecord.getDocumentFromData(
                                          createCommentsRecordData(
                                            timeStamp: getCurrentTimestamp,
                                            postReference: widget.post,
                                            threadReference: widget.thread,
                                            author: currentUserReference,
                                            text: _model
                                                .replyTextTextController.text,
                                            isStealth: valueOrDefault<bool>(
                                                currentUserDocument?.isStealth,
                                                false),
                                            replyCommentReference:
                                                widget.comment?.reference,
                                            isReply: true,
                                          ),
                                          commentsRecordReference);

                                  await widget.comment!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'replies': FieldValue.arrayUnion(
                                            [_model.commentOutput?.reference]),
                                      },
                                    ),
                                  });
                                  safeSetState(() {
                                    _model.replyTextTextController?.clear();
                                  });
                                  _model.isReplying = false;
                                  safeSetState(() {});

                                  safeSetState(() {});
                                },
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'a6tznfvh' /* Reply */,
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
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding: const EdgeInsets.all(8.0),
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
                                    .replyTextTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 3.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).primary,
                              borderRadius: 30.0,
                              borderWidth: 3.0,
                              buttonSize: 45.0,
                              icon: Icon(
                                Icons.send_rounded,
                                color: FlutterFlowTheme.of(context).info,
                                size: 20.0,
                              ),
                              onPressed: () async {
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
                                            _model.replyTextTextController.text,
                                        isStealth: valueOrDefault<bool>(
                                            currentUserDocument?.isStealth,
                                            false),
                                        replyCommentReference:
                                            widget.comment?.reference,
                                        isReply: true,
                                      ));
                                  _model.commentOutputCopyTwo =
                                      CommentsRecord.getDocumentFromData(
                                          createCommentsRecordData(
                                            timeStamp: getCurrentTimestamp,
                                            postReference: widget.post,
                                            threadReference: widget.thread,
                                            author: currentUserReference,
                                            text: _model
                                                .replyTextTextController.text,
                                            isStealth: valueOrDefault<bool>(
                                                currentUserDocument?.isStealth,
                                                false),
                                            replyCommentReference:
                                                widget.comment?.reference,
                                            isReply: true,
                                          ),
                                          commentsRecordReference);

                                  firestoreBatch
                                      .update(widget.comment!.reference, {
                                    ...mapToFirestore(
                                      {
                                        'replies': FieldValue.arrayUnion([
                                          _model.commentOutputCopyTwo?.reference
                                        ]),
                                      },
                                    ),
                                  });
                                  safeSetState(() {
                                    _model.replyTextTextController?.clear();
                                  });
                                  _model.isReplying = false;
                                  safeSetState(() {});
                                } finally {
                                  await firestoreBatch.commit();
                                }

                                safeSetState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
