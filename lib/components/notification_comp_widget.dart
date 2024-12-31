import '/backend/backend.dart';
import '/components/comments_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'notification_comp_model.dart';
export 'notification_comp_model.dart';

class NotificationCompWidget extends StatefulWidget {
  const NotificationCompWidget({
    super.key,
    required this.notification,
  });

  final NotificationsRecord? notification;

  @override
  State<NotificationCompWidget> createState() => _NotificationCompWidgetState();
}

class _NotificationCompWidgetState extends State<NotificationCompWidget> {
  late NotificationCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationCompModel());

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
      visible: widget.notification?.type != 'Like',
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
        child: Container(
          width: double.infinity,
          height: 70.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(
              color: () {
                if (widget.notification?.type == 'Comment') {
                  return FlutterFlowTheme.of(context).alternate;
                } else if (widget.notification?.type == 'Follow') {
                  return const Color(0x764B39EF);
                } else {
                  return FlutterFlowTheme.of(context).alternate;
                }
              }(),
              width: 3.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
            child: FutureBuilder<UsersRecord>(
              future: UsersRecord.getDocumentOnce(
                  widget.notification!.sourceUser!),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 50.0,
                          height: 50.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: CachedNetworkImage(
                            fadeInDuration: const Duration(milliseconds: 500),
                            fadeOutDuration: const Duration(milliseconds: 500),
                            imageUrl: rowUsersRecord.photoUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                rowUsersRecord.displayName,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                () {
                                  if (widget.notification?.type == 'Comment') {
                                    return 'Commented on your ${widget.notification?.contentType}';
                                  } else if (widget.notification?.type ==
                                      'Follow') {
                                    return 'Followed you';
                                  } else {
                                    return '';
                                  }
                                }(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Text(
                                dateTimeFormat(
                                  "relative",
                                  widget.notification!.time!,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 50.0,
                      buttonSize: 50.0,
                      fillColor: FlutterFlowTheme.of(context).primary,
                      icon: Icon(
                        Icons.arrow_forward_rounded,
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        if (widget.notification?.type == 'Follow') {
                          context.pushNamed(
                            'Profile',
                            queryParameters: {
                              'userReference': serializeParam(
                                widget.notification?.sourceUser,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );
                        } else {
                          if (widget.notification?.type == 'Comment') {
                            if (widget.notification?.contentType == 'Post') {
                              context.pushNamed(
                                'SinglePost',
                                queryParameters: {
                                  'postRef': serializeParam(
                                    widget.notification?.sourcePost,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );

                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: CommentsWidget(
                                      post: widget.notification?.sourcePost,
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            } else {
                              if (widget.notification?.contentType ==
                                  'Thread') {
                                context.pushNamed(
                                  'SingleThread',
                                  queryParameters: {
                                    'threadRef': serializeParam(
                                      widget.notification?.sourceThread,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );

                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: CommentsWidget(
                                        thread:
                                            widget.notification?.sourceThread,
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              } else {
                                if (widget.notification?.contentType ==
                                    'Short') {
                                  context.pushNamed(
                                    'singleShort',
                                    queryParameters: {
                                      'shortsRef': serializeParam(
                                        widget.notification?.sourcePost,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );

                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: CommentsWidget(
                                          post:
                                              widget.notification?.sourcePost,
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                } else {
                                  return;
                                }
                              }
                            }
                          } else {
                            return;
                          }
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
