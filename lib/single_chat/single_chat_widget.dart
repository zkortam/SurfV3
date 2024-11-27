import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
        duration: const Duration(milliseconds: 0),
        curve: Curves.ease,
      );

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
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
          onTap: () => FocusScope.of(context).unfocus(),
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
                                      child: Image.network(
                                        widget.chat!.users.length > 2
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

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: chatMessages.length,
                                      itemBuilder:
                                          (context, chatMessagesIndex) {
                                        final chatMessagesItem =
                                            chatMessages[chatMessagesIndex];
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child:
                                              StreamBuilder<ChatMessagesRecord>(
                                            stream:
                                                ChatMessagesRecord.getDocument(
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
                                                  if ((stackChatMessagesRecord
                                                              .authorID !=
                                                          currentUserReference) &&
                                                      (stackChatMessagesRecord
                                                                  .image ==
                                                              ''))
                                                    Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30.0),
                                                              child: Container(
                                                                width: 280.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    width: 2.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              10.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              if (widget.chat!.users.length > 2)
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                  child: FutureBuilder<UsersRecord>(
                                                                                    future: UsersRecord.getDocumentOnce(stackChatMessagesRecord.authorID!),
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

                                                                                      final textUsersRecord = snapshot.data!;

                                                                                      return Text(
                                                                                        textUsersRecord.name,
                                                                                        maxLines: 6,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                child: Text(
                                                                                  stackChatMessagesRecord.text,
                                                                                  maxLines: 6,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Stack(
                                                                              children: [
                                                                                if (!functions.checkIfRead(stackChatMessagesRecord.timeStamp!, singleChatChatsRecord.userChatData.toList()))
                                                                                  Icon(
                                                                                    Icons.circle_outlined,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 16.0,
                                                                                  ),
                                                                                if (functions.checkIfRead(stackChatMessagesRecord.timeStamp!, singleChatChatsRecord.userChatData.toList()))
                                                                                  Icon(
                                                                                    Icons.check_circle_sharp,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 16.0,
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                dateTimeFormat(
                                                                                  "relative",
                                                                                  stackChatMessagesRecord.timeStamp!,
                                                                                  locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
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
                                                        ],
                                                      ),
                                                    ),
                                                  if ((stackChatMessagesRecord
                                                              .authorID !=
                                                          currentUserReference) &&
                                                      (stackChatMessagesRecord
                                                                  .image !=
                                                              ''))
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        280.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            3.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              1.0,
                                                                              1.0),
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(28.0),
                                                                          child:
                                                                              Image.network(
                                                                            stackChatMessagesRecord.image,
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                200.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        if (stackChatMessagesRecord.text !=
                                                                                '')
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(1.0, 1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 10.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Stack(
                                                                                    children: [
                                                                                      if (!functions.checkIfRead(stackChatMessagesRecord.timeStamp!, singleChatChatsRecord.userChatData.toList()))
                                                                                        Icon(
                                                                                          Icons.circle_outlined,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 16.0,
                                                                                        ),
                                                                                      if (functions.checkIfRead(stackChatMessagesRecord.timeStamp!, singleChatChatsRecord.userChatData.toList()))
                                                                                        Icon(
                                                                                          Icons.check_circle_sharp,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 16.0,
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      dateTimeFormat(
                                                                                        "relative",
                                                                                        stackChatMessagesRecord.timeStamp!,
                                                                                        locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 11.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if (widget.chat!.users.length >
                                                                            2)
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(-1.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 5.0, 15.0),
                                                                              child: FutureBuilder<UsersRecord>(
                                                                                future: UsersRecord.getDocumentOnce(stackChatMessagesRecord.authorID!),
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

                                                                                  final textUsersRecord = snapshot.data!;

                                                                                  return Text(
                                                                                    textUsersRecord.name,
                                                                                    maxLines: 6,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: FlutterFlowTheme.of(context).secondary,
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
                                                              if (stackChatMessagesRecord
                                                                          .text !=
                                                                      '')
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          280.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(30.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(10.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Flexible(
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    if (widget.chat!.users.length > 2)
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                        child: FutureBuilder<UsersRecord>(
                                                                                          future: UsersRecord.getDocumentOnce(stackChatMessagesRecord.authorID!),
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

                                                                                            final textUsersRecord = snapshot.data!;

                                                                                            return Text(
                                                                                              textUsersRecord.name,
                                                                                              maxLines: 6,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Montserrat',
                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                      child: Text(
                                                                                        stackChatMessagesRecord.text,
                                                                                        maxLines: 6,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Stack(
                                                                                    children: [
                                                                                      if (!functions.checkIfRead(stackChatMessagesRecord.timeStamp!, singleChatChatsRecord.userChatData.toList()))
                                                                                        Icon(
                                                                                          Icons.circle_outlined,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 16.0,
                                                                                        ),
                                                                                      if (functions.checkIfRead(stackChatMessagesRecord.timeStamp!, singleChatChatsRecord.userChatData.toList()))
                                                                                        Icon(
                                                                                          Icons.check_circle_sharp,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 16.0,
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      dateTimeFormat(
                                                                                        "relative",
                                                                                        stackChatMessagesRecord.timeStamp!,
                                                                                        locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
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
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if ((stackChatMessagesRecord
                                                              .authorID ==
                                                          currentUserReference) &&
                                                      (stackChatMessagesRecord
                                                                  .image ==
                                                              ''))
                                                    Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30.0),
                                                              child: Container(
                                                                width: 280.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 3.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              10.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            stackChatMessagesRecord.text,
                                                                            maxLines:
                                                                                6,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Stack(
                                                                              children: [
                                                                                if (!functions.checkIfRead(stackChatMessagesRecord.timeStamp!, singleChatChatsRecord.userChatData.toList()))
                                                                                  Icon(
                                                                                    Icons.circle_outlined,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 16.0,
                                                                                  ),
                                                                                if (functions.checkIfRead(stackChatMessagesRecord.timeStamp!, singleChatChatsRecord.userChatData.toList()))
                                                                                  Icon(
                                                                                    Icons.check_circle_sharp,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 16.0,
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                dateTimeFormat(
                                                                                  "relative",
                                                                                  stackChatMessagesRecord.timeStamp!,
                                                                                  locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
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
                                                        ],
                                                      ),
                                                    ),
                                                  if ((stackChatMessagesRecord
                                                              .authorID ==
                                                          currentUserReference) &&
                                                      (stackChatMessagesRecord
                                                                  .image !=
                                                              ''))
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Flexible(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        280.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            4.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              1.0,
                                                                              1.0),
                                                                      child:
                                                                          Stack(
                                                                        alignment: const AlignmentDirectional(
                                                                            1.0,
                                                                            1.0),
                                                                        children: [
                                                                          InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              await Navigator.push(
                                                                                context,
                                                                                PageTransition(
                                                                                  type: PageTransitionType.fade,
                                                                                  child: FlutterFlowExpandedImageView(
                                                                                    image: Image.network(
                                                                                      stackChatMessagesRecord.image,
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                    allowRotation: false,
                                                                                    tag: stackChatMessagesRecord.image,
                                                                                    useHeroAnimation: true,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Hero(
                                                                              tag: stackChatMessagesRecord.image,
                                                                              transitionOnUserGestures: true,
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(28.0),
                                                                                child: Image.network(
                                                                                  stackChatMessagesRecord.image,
                                                                                  width: double.infinity,
                                                                                  height: 200.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          if (stackChatMessagesRecord.text != '')
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 10.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Stack(
                                                                                    children: [
                                                                                      if (!functions.checkIfRead(stackChatMessagesRecord.timeStamp!, singleChatChatsRecord.userChatData.toList()))
                                                                                        Icon(
                                                                                          Icons.circle_outlined,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 16.0,
                                                                                        ),
                                                                                      if (functions.checkIfRead(stackChatMessagesRecord.timeStamp!, singleChatChatsRecord.userChatData.toList()))
                                                                                        Icon(
                                                                                          Icons.check_circle_sharp,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 16.0,
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      dateTimeFormat(
                                                                                        "relative",
                                                                                        stackChatMessagesRecord.timeStamp!,
                                                                                        locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
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
                                                              if (stackChatMessagesRecord
                                                                          .text !=
                                                                      '')
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          280.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(30.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              3.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(10.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Flexible(
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                child: Text(
                                                                                  stackChatMessagesRecord.text,
                                                                                  maxLines: 6,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Stack(
                                                                                    children: [
                                                                                      if (!functions.checkIfRead(stackChatMessagesRecord.timeStamp!, singleChatChatsRecord.userChatData.toList()))
                                                                                        Icon(
                                                                                          Icons.circle_outlined,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 16.0,
                                                                                        ),
                                                                                      if (functions.checkIfRead(stackChatMessagesRecord.timeStamp!, singleChatChatsRecord.userChatData.toList()))
                                                                                        Icon(
                                                                                          Icons.check_circle_sharp,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 16.0,
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      dateTimeFormat(
                                                                                        "relative",
                                                                                        stackChatMessagesRecord.timeStamp!,
                                                                                        locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
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
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                ],
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      controller: _model.listViewController,
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
                                maxHeight: 150.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
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
                                                      controller:
                                                          _model.textController,
                                                      focusNode: _model
                                                          .textFieldFocusNode,
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                            letterSpacing: 0.0,
                                                          ),
                                                      maxLines: 4,
                                                      minLines: 1,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .textControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
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
                                                      final selectedMedia =
                                                          await selectMediaWithSourceBottomSheet(
                                                        context: context,
                                                        allowPhoto: true,
                                                      );
                                                      if (selectedMedia !=
                                                              null &&
                                                          selectedMedia.every((m) =>
                                                              validateFileFormat(
                                                                  m.storagePath,
                                                                  context))) {
                                                        safeSetState(() => _model
                                                                .isDataUploading =
                                                            true);
                                                        var selectedUploadedFiles =
                                                            <FFUploadedFile>[];

                                                        var downloadUrls =
                                                            <String>[];
                                                        try {
                                                          showUploadMessage(
                                                            context,
                                                            'Uploading file...',
                                                            showLoading: true,
                                                          );
                                                          selectedUploadedFiles =
                                                              selectedMedia
                                                                  .map((m) =>
                                                                      FFUploadedFile(
                                                                        name: m
                                                                            .storagePath
                                                                            .split('/')
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
                                                              (await Future
                                                                      .wait(
                                                            selectedMedia.map(
                                                              (m) async =>
                                                                  await uploadData(
                                                                      m.storagePath,
                                                                      m.bytes),
                                                            ),
                                                          ))
                                                                  .where((u) =>
                                                                      u != null)
                                                                  .map(
                                                                      (u) => u!)
                                                                  .toList();
                                                        } finally {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .hideCurrentSnackBar();
                                                          _model.isDataUploading =
                                                              false;
                                                        }
                                                        if (selectedUploadedFiles
                                                                    .length ==
                                                                selectedMedia
                                                                    .length &&
                                                            downloadUrls
                                                                    .length ==
                                                                selectedMedia
                                                                    .length) {
                                                          safeSetState(() {
                                                            _model.uploadedLocalFile =
                                                                selectedUploadedFiles
                                                                    .first;
                                                            _model.uploadedFileUrl =
                                                                downloadUrls
                                                                    .first;
                                                          });
                                                          showUploadMessage(
                                                              context,
                                                              'Success!');
                                                        } else {
                                                          safeSetState(() {});
                                                          showUploadMessage(
                                                              context,
                                                              'Failed to upload data');
                                                          return;
                                                        }
                                                      }
                                                    },
                                                    child: Icon(
                                                      Icons.add_rounded,
                                                      color: _model.uploadedFileUrl !=
                                                                  ''
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
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
                                    FlutterFlowIconButton(
                                      borderRadius: 40.0,
                                      buttonSize: 50.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).primary,
                                      icon: Icon(
                                        Icons.arrow_forward_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        var shouldSetState = false;
                                        final firestoreBatch =
                                            FirebaseFirestore.instance.batch();
                                        try {
                                          if (functions.isMessageValid(
                                              _model.textController.text)) {
                                            HapticFeedback.mediumImpact();

                                            var chatMessagesRecordReference =
                                                ChatMessagesRecord.createDoc(
                                                    widget.chat!.reference);
                                            firestoreBatch.set(
                                                chatMessagesRecordReference,
                                                createChatMessagesRecordData(
                                                  text: _model
                                                      .textController.text,
                                                  timeStamp:
                                                      getCurrentTimestamp,
                                                  authorID:
                                                      currentUserReference,
                                                  image: _model.uploadedFileUrl,
                                                ));
                                            _model.output = ChatMessagesRecord
                                                .getDocumentFromData(
                                                    createChatMessagesRecordData(
                                                      text: _model
                                                          .textController.text,
                                                      timeStamp:
                                                          getCurrentTimestamp,
                                                      authorID:
                                                          currentUserReference,
                                                      image: _model
                                                          .uploadedFileUrl,
                                                    ),
                                                    chatMessagesRecordReference);
                                            shouldSetState = true;

                                            firestoreBatch.update(
                                                widget.chat!.reference, {
                                              ...createChatsRecordData(
                                                lastTime: getCurrentTimestamp,
                                                lastMessage: _model.uploadedFileUrl !=
                                                            ''
                                                    ? 'Sent an Image'
                                                    : _model
                                                        .textController.text,
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'chats':
                                                      FieldValue.arrayUnion([
                                                    _model.output?.reference
                                                  ]),
                                                },
                                              ),
                                            });
                                            safeSetState(() {
                                              _model.textController?.clear();
                                            });
                                            safeSetState(() {
                                              _model.isDataUploading = false;
                                              _model.uploadedLocalFile =
                                                  FFUploadedFile(
                                                      bytes: Uint8List.fromList(
                                                          []));
                                              _model.uploadedFileUrl = '';
                                            });

                                            _model.refresh = 1;
                                            safeSetState(() {});
                                            await _model.listViewController
                                                ?.animateTo(
                                              _model.listViewController!
                                                  .position.maxScrollExtent,
                                              duration:
                                                  const Duration(milliseconds: 100),
                                              curve: Curves.ease,
                                            );
                                          } else {
                                            if (shouldSetState) {
                                              safeSetState(() {});
                                            }
                                            return;
                                          }
                                        } finally {
                                          await firestoreBatch.commit();
                                        }

                                        if (shouldSetState) {
                                          safeSetState(() {});
                                        }
                                      },
                                    ),
                                  ],
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
      },
    );
  }
}
