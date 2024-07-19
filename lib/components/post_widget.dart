import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
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
                          widget.post!.videos.isNotEmpty
                              ? (widget.post?.videos[0])
                              : (widget.post?.images[0]),
                          '0',
                        ),
                        imageBuilder: (path) => ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
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
            ],
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
                            child: Padding(
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
                                              AlwaysStoppedAnimation<Color>(
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
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          rowUsersRecord.displayName,
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
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        child: Icon(
                                          Icons.circle,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 10.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: Text(
                                          functions
                                              .calculateNetVotes(
                                                  widget.post!.voters.toList())
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
                                  );
                                },
                              ),
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
