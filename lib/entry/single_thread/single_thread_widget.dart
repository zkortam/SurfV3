import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/info_widget.dart';
import '/components/threads_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_plus/share_plus.dart';
import 'single_thread_model.dart';
export 'single_thread_model.dart';

class SingleThreadWidget extends StatefulWidget {
  const SingleThreadWidget({
    super.key,
    this.thread,
    bool? isSharing,
    bool? isCopyingClipboard,
  })  : isSharing = isSharing ?? false,
        isCopyingClipboard = isCopyingClipboard ?? false;

  final ThreadsRecord? thread;
  final bool isSharing;
  final bool isCopyingClipboard;

  @override
  State<SingleThreadWidget> createState() => _SingleThreadWidgetState();
}

class _SingleThreadWidgetState extends State<SingleThreadWidget> {
  late SingleThreadModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SingleThreadModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.currentPageLink = await generateCurrentPageLink(
        context,
        title: 'Thread',
        description: widget.thread?.title,
        forceRedirect: true,
      );

      if (widget.isSharing) {
        unawaited(
          () async {
            await Share.share(
              _model.currentPageLink,
              sharePositionOrigin: getWidgetBoundingBox(context),
            );
          }(),
        );

        await currentUserReference!.update(createUsersRecordData(
          threadInteractions: createThreadInteractionsStruct(
            fieldValues: {
              'shared': FieldValue.arrayUnion([widget.thread?.reference]),
            },
            clearUnsetFields: false,
          ),
        ));
      } else {
        if (widget.isCopyingClipboard) {
          await Clipboard.setData(ClipboardData(text: _model.currentPageLink));
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: false,
            context: context,
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: InfoWidget(
                    text: FFLocalizations.of(context).getText(
                      'e2xz3l8b' /* Copied */,
                    ),
                  ),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        } else {
          return;
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 10.0),
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                3.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              buttonSize: 42.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              icon: Icon(
                                Icons.arrow_back,
                                color: FlutterFlowTheme.of(context).info,
                                size: 15.0,
                              ),
                              onPressed: () async {
                                context.safePop();
                              },
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 40.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'bydzp72n' /* Thread */,
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
                  if (widget.thread != null)
                    wrapWithModel(
                      model: _model.threadsComponentModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: ThreadsComponentWidget(
                        thread: widget.thread!,
                      ),
                    ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: StreamBuilder<List<ThreadsRecord>>(
                      stream: queryThreadsRecord(),
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
                        List<ThreadsRecord> listViewThreadsRecordList =
                            snapshot.data!;

                        return ListView.builder(
                          padding: const EdgeInsets.fromLTRB(
                            0,
                            0,
                            0,
                            120.0,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewThreadsRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewThreadsRecord =
                                listViewThreadsRecordList[listViewIndex];
                            return ThreadsComponentWidget(
                              key: Key(
                                  'Keyhl6_${listViewIndex}_of_${listViewThreadsRecordList.length}'),
                              thread: listViewThreadsRecord,
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
    );
  }
}
