import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/create_group_chat_widget.dart';
import '/components/error_bar_widget.dart';
import '/components/info_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_selection_for_chat_model.dart';
export 'user_selection_for_chat_model.dart';

class UserSelectionForChatWidget extends StatefulWidget {
  const UserSelectionForChatWidget({
    super.key,
    bool? creatingGroup,
  }) : this.creatingGroup = creatingGroup ?? false;

  final bool creatingGroup;

  @override
  State<UserSelectionForChatWidget> createState() =>
      _UserSelectionForChatWidgetState();
}

class _UserSelectionForChatWidgetState
    extends State<UserSelectionForChatWidget> {
  late UserSelectionForChatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserSelectionForChatModel());

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
      height: 600.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        buttonSize: 42.0,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        icon: Icon(
                          Icons.arrow_back,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'tgk9vc1g' /* Select People */,
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        buttonSize: 42.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.check_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          if (widget!.creatingGroup) {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: CreateGroupChatWidget(
                                    users: _model.selectedUsers,
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          } else {
                            _model.out = await queryChatsRecordOnce(
                              queryBuilder: (chatsRecord) => chatsRecord.where(
                                'users',
                                arrayContains: currentUserReference,
                              ),
                            );
                            if (functions.isDMExistent(
                                _model.out!.toList(),
                                functions.returnOtherUser(
                                    _model.selectedUsers.toList(),
                                    currentUserReference!))) {
                              Navigator.pop(context);
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: ErrorBarWidget(
                                      text: FFLocalizations.of(context).getText(
                                        'r49t1i0r' /* Chat already exists */,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            } else {
                              _model.addToSelectedUsers(currentUserReference!);
                              safeSetState(() {});

                              var chatsRecordReference =
                                  ChatsRecord.collection.doc();
                              await chatsRecordReference.set({
                                ...createChatsRecordData(
                                  lastTime: getCurrentTimestamp,
                                  lastMessage: 'New Chat',
                                ),
                                ...mapToFirestore(
                                  {
                                    'users': _model.selectedUsers,
                                  },
                                ),
                              });
                              _model.output = ChatsRecord.getDocumentFromData({
                                ...createChatsRecordData(
                                  lastTime: getCurrentTimestamp,
                                  lastMessage: 'New Chat',
                                ),
                                ...mapToFirestore(
                                  {
                                    'users': _model.selectedUsers,
                                  },
                                ),
                              }, chatsRecordReference);
                              Navigator.pop(context);

                              context.pushNamed(
                                'singleChat',
                                queryParameters: {
                                  'chat': serializeParam(
                                    _model.output,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'chat': _model.output,
                                },
                              );

                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: InfoWidget(
                                      text: FFLocalizations.of(context).getText(
                                        '8h0m2ks1' /* Chat Created */,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            }
                          }

                          safeSetState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
              child: StreamBuilder<List<UsersRecord>>(
                stream: queryUsersRecord(
                  queryBuilder: (usersRecord) =>
                      usersRecord.orderBy('display_name', descending: true),
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
                  List<UsersRecord> listViewUsersRecordList = snapshot.data!;

                  return ListView.separated(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      0,
                      0,
                      120.0,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewUsersRecordList.length,
                    separatorBuilder: (_, __) => SizedBox(height: 10.0),
                    itemBuilder: (context, listViewIndex) {
                      final listViewUsersRecord =
                          listViewUsersRecordList[listViewIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (widget!.creatingGroup) {
                            if (functions.userInList(
                                _model.selectedUsers.toList(),
                                listViewUsersRecord.reference)) {
                              _model.removeFromSelectedUsers(
                                  listViewUsersRecord.reference);
                              safeSetState(() {});
                            } else {
                              _model.addToSelectedUsers(
                                  listViewUsersRecord.reference);
                              safeSetState(() {});
                            }
                          } else {
                            if (functions.userInList(
                                _model.selectedUsers.toList(),
                                listViewUsersRecord.reference)) {
                              _model.removeFromSelectedUsers(
                                  listViewUsersRecord.reference);
                              safeSetState(() {});
                            } else {
                              if (_model.selectedUsers.length == 1) {
                                _model.selectedUsers = [];
                                safeSetState(() {});
                                _model.addToSelectedUsers(
                                    listViewUsersRecord.reference);
                                safeSetState(() {});
                              } else {
                                _model.addToSelectedUsers(
                                    listViewUsersRecord.reference);
                                safeSetState(() {});
                              }
                            }
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: functions.userInList(
                                    _model.selectedUsers.toList(),
                                    listViewUsersRecord.reference)
                                ? Color(0x9B4B39EF)
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                              color: functions.userInList(
                                      _model.selectedUsers.toList(),
                                      listViewUsersRecord.reference)
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).alternate,
                              width: 3.0,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2.0, 5.0, 5.0, 5.0),
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        listViewUsersRecord.photoUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    listViewUsersRecord.displayName,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
