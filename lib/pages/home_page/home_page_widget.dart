import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/custom_algorithm_widget.dart';
import '/components/navigation_bar_widget.dart';
import '/components/post_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (RootPageContext.isInactiveRootPage(context)) {
        return;
      }
      _model.aPIresult = await GetrecommendationsCall.call(
        userId: currentUserUid,
        collection: 'posts',
      );

      if ((_model.aPIresult?.succeeded ?? true)) {
        _model.postindex = 3;
        _model.postrefs = functions
            .postrefslist(GetrecommendationsCall.postsrefs(
              (_model.aPIresult?.jsonBody ?? ''),
            )!
                .toList())
            .toList()
            .cast<DocumentReference>();
        safeSetState(() {});
      } else {
        _model.postindex = 5;
        safeSetState(() {});
      }
    });

    animationsMap.addAll({
      'listViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 500.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 500.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: const Offset(-100.0, 0.0),
            end: const Offset(-50.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: const Offset(100.0, 0.0),
            end: const Offset(50.0, 0.0),
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
          child: Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 55.0,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0x7F2120BC),
                                    Color(0x7B7D16C1)
                                  ],
                                  stops: [0.0, 1.0],
                                  begin: AlignmentDirectional(1.0, -1.0),
                                  end: AlignmentDirectional(-1.0, 1.0),
                                ),
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 90.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark)
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
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/M78_(28)-Photoroom.png',
                                                          width: 37.0,
                                                          height: 37.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  if (Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light)
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
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/M78_(31).png',
                                                          width: 37.0,
                                                          height: 37.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                5.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        Icons.search_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                          'Search',
                                                          queryParameters: {
                                                            'tabIndex':
                                                                serializeParam(
                                                              0,
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                5.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        Icons.hexagon_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    const CustomAlgorithmWidget(),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                    ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                          'NotificationsPage');
                                                    },
                                                    child: SizedBox(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      child: Stack(
                                                        children: [
                                                          if ((currentUserDocument
                                                                          ?.notifications
                                                                          .toList() ??
                                                                      []).isNotEmpty)
                                                            AuthUserStreamWidget(
                                                              builder:
                                                                  (context) =>
                                                                      Stack(
                                                                children: [
                                                                  FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        20.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        40.0,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .notifications_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'NotifFull pressed ...');
                                                                    },
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              17.0,
                                                                          height:
                                                                              17.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            borderRadius:
                                                                                BorderRadius.circular(20.0),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                (currentUserDocument?.notifications.toList() ?? []).length.toString(),
                                                                                '0',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          if ((currentUserDocument
                                                                          ?.notifications
                                                                          .toList() ??
                                                                      []).isEmpty)
                                                            AuthUserStreamWidget(
                                                              builder: (context) =>
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .notifications_none_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed: () {
                                                                  print(
                                                                      'EmptyNotif pressed ...');
                                                                },
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 45.0,
                                                    icon: Icon(
                                                      Icons.play_arrow,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 26.0,
                                                    ),
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                          'chatMain');
                                                    },
                                                  ),
                                                ],
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 10.0, 5.0, 0.0),
                          child: FutureBuilder<List<UsersRecord>>(
                            future: queryUsersRecordOnce(
                              queryBuilder: (usersRecord) => usersRecord
                                  .where(
                                    'latestSnippetTime',
                                    isGreaterThan: getCurrentTimestamp,
                                  )
                                  .where(
                                    'followers',
                                    arrayContains: currentUserReference,
                                  )
                                  .orderBy('latestSnippetTime',
                                      descending: true),
                            ),
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
                              List<UsersRecord> snippetsBarUsersRecordList =
                                  snapshot.data!;

                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    snippetsBarUsersRecordList.length,
                                    (snippetsBarIndex) {
                                  final snippetsBarUsersRecord =
                                      snippetsBarUsersRecordList[
                                          snippetsBarIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'Snippets',
                                        queryParameters: {
                                          'author': serializeParam(
                                            snippetsBarUsersRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: 70.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Container(
                                          width: 70.0,
                                          height: 70.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            snippetsBarUsersRecord.photoUrl,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).divide(const SizedBox(width: 5.0)),
                              );
                            },
                          ),
                        ),
                        Stack(
                          children: [
                            if (currentUserDocument
                                    ?.userSettings.isSwipeFeed ??
                                true)
                              AuthUserStreamWidget(
                                builder: (context) => Container(
                                  width: 500.0,
                                  height: 550.0,
                                  decoration: const BoxDecoration(),
                                  child: FutureBuilder<List<PostsRecord>>(
                                    future: queryPostsRecordOnce(
                                      queryBuilder: (postsRecord) => postsRecord
                                          .where(
                                            'isShort',
                                            isEqualTo: false,
                                          )
                                          .orderBy('TimePosted',
                                              descending: true),
                                    ),
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
                                      List<PostsRecord>
                                          swipeableStackPostsRecordList =
                                          snapshot.data!;

                                      return FlutterFlowSwipeableStack(
                                        onSwipeFn: (index) {},
                                        onLeftSwipe: (index) async {
                                          final swipeableStackPostsRecord =
                                              swipeableStackPostsRecordList[
                                                  index];
                                          final firestoreBatch =
                                              FirebaseFirestore.instance
                                                  .batch();
                                          try {
                                            if (functions
                                                    .voterInList(
                                                        swipeableStackPostsRecord
                                                            .voters
                                                            .toList(),
                                                        currentUserReference!)
                                                    .toString() ==
                                                '-1') {
                                              firestoreBatch.update(
                                                  swipeableStackPostsRecord
                                                      .reference,
                                                  {
                                                    ...mapToFirestore(
                                                      {
                                                        'Voters': FieldValue
                                                            .arrayRemove([
                                                          getVotersFirestoreData(
                                                            createVotersStruct(
                                                              userReference:
                                                                  currentUserReference,
                                                              voteValue: -1,
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
                                                  currentUserReference!,
                                                  createUsersRecordData(
                                                    postInteractions:
                                                        createPostInteractionsStruct(
                                                      fieldValues: {
                                                        'disliked': FieldValue
                                                            .arrayRemove([
                                                          swipeableStackPostsRecord
                                                              .reference
                                                        ]),
                                                      },
                                                      clearUnsetFields: false,
                                                    ),
                                                  ));
                                            } else {
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation1'] !=
                                                  null) {
                                                await animationsMap[
                                                        'containerOnActionTriggerAnimation1']!
                                                    .controller
                                                    .forward(from: 0.0)
                                                    .whenComplete(animationsMap[
                                                            'containerOnActionTriggerAnimation1']!
                                                        .controller
                                                        .reverse);
                                              }
                                              if (functions
                                                      .voterInList(
                                                          swipeableStackPostsRecord
                                                              .voters
                                                              .toList(),
                                                          currentUserReference!)
                                                      .toString() ==
                                                  '1') {
                                                firestoreBatch.update(
                                                    swipeableStackPostsRecord
                                                        .reference,
                                                    {
                                                      ...mapToFirestore(
                                                        {
                                                          'Voters': FieldValue
                                                              .arrayUnion([
                                                            getVotersFirestoreData(
                                                              createVotersStruct(
                                                                userReference:
                                                                    currentUserReference,
                                                                voteValue: -1,
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
                                                    swipeableStackPostsRecord
                                                        .reference,
                                                    {
                                                      ...mapToFirestore(
                                                        {
                                                          'Voters': FieldValue
                                                              .arrayRemove([
                                                            getVotersFirestoreData(
                                                              createVotersStruct(
                                                                userReference:
                                                                    currentUserReference,
                                                                voteValue: 1,
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
                                                    currentUserReference!,
                                                    createUsersRecordData(
                                                      postInteractions:
                                                          createPostInteractionsStruct(
                                                        fieldValues: {
                                                          'liked': FieldValue
                                                              .arrayRemove([
                                                            swipeableStackPostsRecord
                                                                .reference
                                                          ]),
                                                          'disliked': FieldValue
                                                              .arrayUnion([
                                                            swipeableStackPostsRecord
                                                                .reference
                                                          ]),
                                                        },
                                                        clearUnsetFields: false,
                                                      ),
                                                    ));
                                              } else {
                                                firestoreBatch.update(
                                                    swipeableStackPostsRecord
                                                        .reference,
                                                    {
                                                      ...mapToFirestore(
                                                        {
                                                          'Voters': FieldValue
                                                              .arrayUnion([
                                                            getVotersFirestoreData(
                                                              createVotersStruct(
                                                                userReference:
                                                                    currentUserReference,
                                                                voteValue: -1,
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
                                                    currentUserReference!,
                                                    createUsersRecordData(
                                                      postInteractions:
                                                          createPostInteractionsStruct(
                                                        fieldValues: {
                                                          'disliked': FieldValue
                                                              .arrayUnion([
                                                            swipeableStackPostsRecord
                                                                .reference
                                                          ]),
                                                        },
                                                        clearUnsetFields: false,
                                                      ),
                                                    ));
                                              }
                                            }
                                          } finally {
                                            await firestoreBatch.commit();
                                          }
                                        },
                                        onRightSwipe: (index) async {
                                          final swipeableStackPostsRecord =
                                              swipeableStackPostsRecordList[
                                                  index];
                                          final firestoreBatch =
                                              FirebaseFirestore.instance
                                                  .batch();
                                          try {
                                            if (functions
                                                    .voterInList(
                                                        swipeableStackPostsRecord
                                                            .voters
                                                            .toList(),
                                                        currentUserReference!)
                                                    .toString() ==
                                                '1') {
                                              firestoreBatch.update(
                                                  swipeableStackPostsRecord
                                                      .reference,
                                                  {
                                                    ...mapToFirestore(
                                                      {
                                                        'Voters': FieldValue
                                                            .arrayRemove([
                                                          getVotersFirestoreData(
                                                            createVotersStruct(
                                                              userReference:
                                                                  currentUserReference,
                                                              voteValue: 1,
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
                                                  currentUserReference!,
                                                  createUsersRecordData(
                                                    postInteractions:
                                                        createPostInteractionsStruct(
                                                      fieldValues: {
                                                        'liked': FieldValue
                                                            .arrayRemove([
                                                          swipeableStackPostsRecord
                                                              .reference
                                                        ]),
                                                      },
                                                      clearUnsetFields: false,
                                                    ),
                                                  ));
                                            } else {
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation2'] !=
                                                  null) {
                                                await animationsMap[
                                                        'containerOnActionTriggerAnimation2']!
                                                    .controller
                                                    .forward(from: 0.0)
                                                    .whenComplete(animationsMap[
                                                            'containerOnActionTriggerAnimation2']!
                                                        .controller
                                                        .reverse);
                                              }
                                              if (functions
                                                      .voterInList(
                                                          swipeableStackPostsRecord
                                                              .voters
                                                              .toList(),
                                                          currentUserReference!)
                                                      .toString() ==
                                                  '-1') {
                                                firestoreBatch.update(
                                                    swipeableStackPostsRecord
                                                        .reference,
                                                    {
                                                      ...mapToFirestore(
                                                        {
                                                          'Voters': FieldValue
                                                              .arrayUnion([
                                                            getVotersFirestoreData(
                                                              createVotersStruct(
                                                                userReference:
                                                                    currentUserReference,
                                                                voteValue: 1,
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
                                                    swipeableStackPostsRecord
                                                        .reference,
                                                    {
                                                      ...mapToFirestore(
                                                        {
                                                          'Voters': FieldValue
                                                              .arrayRemove([
                                                            getVotersFirestoreData(
                                                              createVotersStruct(
                                                                userReference:
                                                                    currentUserReference,
                                                                voteValue: -1,
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
                                                    currentUserReference!,
                                                    createUsersRecordData(
                                                      postInteractions:
                                                          createPostInteractionsStruct(
                                                        fieldValues: {
                                                          'liked': FieldValue
                                                              .arrayUnion([
                                                            swipeableStackPostsRecord
                                                                .reference
                                                          ]),
                                                          'disliked': FieldValue
                                                              .arrayRemove([
                                                            swipeableStackPostsRecord
                                                                .reference
                                                          ]),
                                                        },
                                                        clearUnsetFields: false,
                                                      ),
                                                    ));
                                              } else {
                                                firestoreBatch.update(
                                                    swipeableStackPostsRecord
                                                        .reference,
                                                    {
                                                      ...mapToFirestore(
                                                        {
                                                          'Voters': FieldValue
                                                              .arrayUnion([
                                                            getVotersFirestoreData(
                                                              createVotersStruct(
                                                                userReference:
                                                                    currentUserReference,
                                                                voteValue: 1,
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
                                                    currentUserReference!,
                                                    createUsersRecordData(
                                                      postInteractions:
                                                          createPostInteractionsStruct(
                                                        fieldValues: {
                                                          'liked': FieldValue
                                                              .arrayUnion([
                                                            swipeableStackPostsRecord
                                                                .reference
                                                          ]),
                                                        },
                                                        clearUnsetFields: false,
                                                      ),
                                                    ));
                                              }
                                            }
                                          } finally {
                                            await firestoreBatch.commit();
                                          }
                                        },
                                        onUpSwipe: (index) {},
                                        onDownSwipe: (index) {},
                                        itemBuilder:
                                            (context, swipeableStackIndex) {
                                          final swipeableStackPostsRecord =
                                              swipeableStackPostsRecordList[
                                                  swipeableStackIndex];
                                          return PostWidget(
                                            key: Key(
                                                'Keyg9y_${swipeableStackIndex}_of_${swipeableStackPostsRecordList.length}'),
                                            post: swipeableStackPostsRecord,
                                            isLike: false,
                                          );
                                        },
                                        itemCount: swipeableStackPostsRecordList
                                            .length,
                                        controller:
                                            _model.swipeableStackController,
                                        loop: false,
                                        cardDisplayCount: 3,
                                        scale: 0.934,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            if (!valueOrDefault<bool>(
                                  currentUserDocument
                                      ?.userSettings.isSwipeFeed,
                                  false,
                                ) &&
                                (_model.postindex != 3))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) =>
                                      StreamBuilder<List<PostsRecord>>(
                                    stream: queryPostsRecord(
                                      queryBuilder: (postsRecord) => postsRecord
                                          .where(
                                            'isShort',
                                            isEqualTo: false,
                                          )
                                          .orderBy('TimePosted',
                                              descending: true),
                                    ),
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
                                      List<PostsRecord>
                                          noAlgorithmPostsRecordList =
                                          snapshot.data!;

                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            noAlgorithmPostsRecordList.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 10.0),
                                        itemBuilder:
                                            (context, noAlgorithmIndex) {
                                          final noAlgorithmPostsRecord =
                                              noAlgorithmPostsRecordList[
                                                  noAlgorithmIndex];
                                          return PostWidget(
                                            key: Key(
                                                'Keybph_${noAlgorithmIndex}_of_${noAlgorithmPostsRecordList.length}'),
                                            post: noAlgorithmPostsRecord,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            if (!valueOrDefault<bool>(
                                  currentUserDocument
                                      ?.userSettings.isSwipeFeed,
                                  false,
                                ) &&
                                (_model.postindex == 3))
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 10.0, 5.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Builder(
                                      builder: (context) {
                                        final posts = _model.postrefs.toList();

                                        return ListView.separated(
                                          padding: const EdgeInsets.fromLTRB(
                                            0,
                                            0,
                                            0,
                                            110.0,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: posts.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(height: 10.0),
                                          itemBuilder: (context, postsIndex) {
                                            final postsItem = posts[postsIndex];
                                            return StreamBuilder<PostsRecord>(
                                              stream: PostsRecord.getDocument(
                                                  postsItem),
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

                                                final postPostsRecord =
                                                    snapshot.data!;

                                                return PostWidget(
                                                  key: Key(
                                                      'Key81y_${postsIndex}_of_${posts.length}'),
                                                  post: postPostsRecord,
                                                );
                                              },
                                            );
                                          },
                                        ).animateOnPageLoad(animationsMap[
                                            'listViewOnPageLoadAnimation']!);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.navigationBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const Hero(
                      tag: 'navBar',
                      transitionOnUserGestures: true,
                      child: Material(
                        color: Colors.transparent,
                        child: NavigationBarWidget(
                          page: 1,
                          tabIndex: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Container(
                    width: 100.0,
                    height: 700.0,
                    decoration: BoxDecoration(
                      color: const Color(0x49D01C27),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 7.0,
                          color: Color(0x2DD01C27),
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                          spreadRadius: 20.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(70.0),
                    ),
                  ).animateOnActionTrigger(
                    animationsMap['containerOnActionTriggerAnimation1']!,
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(1.0, 0.0),
                  child: Container(
                    width: 100.0,
                    height: 700.0,
                    decoration: BoxDecoration(
                      color: const Color(0x4A1B9E62),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 7.0,
                          color: Color(0x4A1B9E62),
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                          spreadRadius: 20.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(70.0),
                    ),
                  ).animateOnActionTrigger(
                    animationsMap['containerOnActionTriggerAnimation2']!,
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
