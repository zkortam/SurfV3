import '/backend/backend.dart';
import '/components/threads_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'single_thread_model.dart';
export 'single_thread_model.dart';

class SingleThreadWidget extends StatefulWidget {
  const SingleThreadWidget({
    super.key,
    this.thread,
    this.threadRef,
  });

  final ThreadsRecord? thread;
  final DocumentReference? threadRef;

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
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (widget.thread != null)
                  wrapWithModel(
                    model: _model.threadsComponentModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: ThreadsComponentWidget(
                      thread: widget.thread!,
                    ),
                  ),
                if (widget.threadRef != null)
                  StreamBuilder<ThreadsRecord>(
                    stream: ThreadsRecord.getDocument(widget.threadRef!),
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

                      final threadsComponentThreadsRecord = snapshot.data!;

                      return wrapWithModel(
                        model: _model.threadsComponentModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: ThreadsComponentWidget(
                          thread: threadsComponentThreadsRecord,
                        ),
                      );
                    },
                  ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
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
    );
  }
}
