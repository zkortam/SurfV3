import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/comments_widget.dart';
import '/components/hashtags_widget.dart';
import '/components/link_menu_widget.dart';
import '/components/threads_comp_widget.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'threads_component_model.dart';
export 'threads_component_model.dart';

class ThreadsComponentWidget extends StatefulWidget {
  const ThreadsComponentWidget({
    super.key,
    required this.thread,
  });

  final ThreadsRecord? thread;

  @override
  State<ThreadsComponentWidget> createState() => _ThreadsComponentWidgetState();
}

class _ThreadsComponentWidgetState extends State<ThreadsComponentWidget> {
  late ThreadsComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThreadsComponentModel());

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
      visible: true /* Warning: Trying to access variable not yet defined. */,
      child: FutureBuilder<UsersRecord>(
        future: UsersRecord.getDocumentOnce(widget.thread!.author!),
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
                    child: ThreadsCompWidget(
                      thread: widget.thread!.reference,
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            },
            child: Container(
              width: 450.0,
              constraints: const BoxConstraints(
                maxWidth: 450.0,
                maxHeight: 500.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 450.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 50.0,
                                    height: 50.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      containerUsersRecord.photoUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          containerUsersRecord.name,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Text(
                                          containerUsersRecord.displayName,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 20.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  functions
                                      .calculateNetVotes(
                                          widget.thread!.votes.toList())
                                      .toString(),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.thread?.title,
                        'Title',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            fontSize: 17.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 5.0),
                    child: Text(
                      valueOrDefault<String>(
                        dateTimeFormat(
                          "relative",
                          widget.thread?.timeStamp,
                          locale:
                              FFLocalizations.of(context).languageShortCode ??
                                  FFLocalizations.of(context).languageCode,
                        ),
                        'Time',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  if (!widget.thread!.poll.isPoll)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 5.0, 10.0, 5.0),
                          child: ClipRRect(
                            child: Container(
                              width: 450.0,
                              constraints: const BoxConstraints(
                                minHeight: 30.0,
                                maxHeight: 300.0,
                              ),
                              decoration: const BoxDecoration(),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: SelectionArea(
                                          child: Text(
                                        valueOrDefault<String>(
                                          widget.thread?.text,
                                          'Text',
                                        ),
                                        maxLines: 6,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              letterSpacing: 0.0,
                                            ),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (widget.thread?.summary != null &&
                            widget.thread?.summary != '')
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5.0, 5.0, 5.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                constraints: const BoxConstraints(
                                  maxHeight: 80.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(22.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 3.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 7.0, 10.0, 7.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Summary',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            valueOrDefault<String>(
                                              widget.thread?.summary,
                                              'text',
                                            ),
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
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
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  if (widget.thread?.poll.isPoll ?? true)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (functions.voterInList(
                                widget.thread!.poll.voters.toList(),
                                currentUserReference!) ==
                            0)
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await widget.thread!.reference
                                        .update(createThreadsRecordData(
                                      poll: createPollStruct(
                                        fieldValues: {
                                          'voters': FieldValue.arrayUnion([
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
                                        clearUnsetFields: false,
                                      ),
                                    ));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(30.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 3.0,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            widget.thread?.poll.options[0],
                                            'Option',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await widget.thread!.reference
                                        .update(createThreadsRecordData(
                                      poll: createPollStruct(
                                        fieldValues: {
                                          'voters': FieldValue.arrayUnion([
                                            getVotersFirestoreData(
                                              createVotersStruct(
                                                userReference:
                                                    currentUserReference,
                                                voteValue: 2,
                                                clearUnsetFields: false,
                                              ),
                                              true,
                                            )
                                          ]),
                                        },
                                        clearUnsetFields: false,
                                      ),
                                    ));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(30.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 3.0,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            widget.thread?.poll.options[1],
                                            'Option',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (valueOrDefault<String>(
                                          widget.thread?.poll.options[2],
                                          'Option',
                                        ) !=
                                        '')
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await widget.thread!.reference
                                          .update(createThreadsRecordData(
                                        poll: createPollStruct(
                                          fieldValues: {
                                            'voters': FieldValue.arrayUnion([
                                              getVotersFirestoreData(
                                                createVotersStruct(
                                                  userReference:
                                                      currentUserReference,
                                                  voteValue: 3,
                                                  clearUnsetFields: false,
                                                ),
                                                true,
                                              )
                                            ]),
                                          },
                                          clearUnsetFields: false,
                                        ),
                                      ));
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 55.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 3.0,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              widget.thread?.poll.options[2],
                                              'Option',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                if (valueOrDefault<String>(
                                          widget.thread?.poll.options[3],
                                          'Option',
                                        ) !=
                                        '')
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await widget.thread!.reference
                                          .update(createThreadsRecordData(
                                        poll: createPollStruct(
                                          fieldValues: {
                                            'voters': FieldValue.arrayUnion([
                                              getVotersFirestoreData(
                                                createVotersStruct(
                                                  userReference:
                                                      currentUserReference,
                                                  voteValue: 4,
                                                  clearUnsetFields: false,
                                                ),
                                                true,
                                              )
                                            ]),
                                          },
                                          clearUnsetFields: false,
                                        ),
                                      ));
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 55.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 3.0,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              widget.thread?.poll.options[3],
                                              'Option',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ].divide(const SizedBox(height: 5.0)),
                            ),
                          ),
                        if (functions.voterInList(
                                widget.thread!.poll.voters.toList(),
                                currentUserReference!) !=
                            0)
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(30.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 3.0,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        LinearPercentIndicator(
                                          percent: functions.votePercent(
                                              widget.thread!.votes.toList(),
                                              1),
                                          lineHeight: 100.0,
                                          animation: true,
                                          animateFromLastPercent: true,
                                          progressColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          barRadius: const Radius.circular(30.0),
                                          padding: EdgeInsets.zero,
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        widget.thread?.poll
                                                            .options[0],
                                                        'Option',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    if (functions.voterInList(
                                                            widget.thread!.poll
                                                                .voters
                                                                .toList(),
                                                            currentUserReference!) ==
                                                        1)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons
                                                              .check_circle_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Text(
                                                  functions
                                                      .roundAndMultiply(
                                                          functions.votePercent(
                                                              widget
                                                                  .thread!.votes
                                                                  .toList(),
                                                              1))
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                      ],
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(30.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 3.0,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        LinearPercentIndicator(
                                          percent: functions.votePercent(
                                              widget.thread!.votes.toList(),
                                              2),
                                          lineHeight: 100.0,
                                          animation: true,
                                          animateFromLastPercent: true,
                                          progressColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          barRadius: const Radius.circular(30.0),
                                          padding: EdgeInsets.zero,
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        widget.thread?.poll
                                                            .options[1],
                                                        'Option',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    if (functions.voterInList(
                                                            widget.thread!.poll
                                                                .voters
                                                                .toList(),
                                                            currentUserReference!) ==
                                                        2)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons
                                                              .check_circle_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Text(
                                                  functions
                                                      .roundAndMultiply(
                                                          functions.votePercent(
                                                              widget
                                                                  .thread!.votes
                                                                  .toList(),
                                                              2))
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                      ],
                                    ),
                                  ),
                                ),
                                if (valueOrDefault<String>(
                                          widget.thread?.poll.options[2],
                                          'Option',
                                        ) !=
                                        '')
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(30.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 55.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 3.0,
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          LinearPercentIndicator(
                                            percent: functions.votePercent(
                                                widget.thread!.votes.toList(),
                                                3),
                                            lineHeight: 100.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            barRadius: const Radius.circular(30.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          widget.thread?.poll
                                                              .options[2],
                                                          'Option',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      if (functions.voterInList(
                                                              widget.thread!
                                                                  .poll.voters
                                                                  .toList(),
                                                              currentUserReference!) ==
                                                          3)
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .check_circle_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                  Text(
                                                    functions
                                                        .roundAndMultiply(
                                                            functions.votePercent(
                                                                widget.thread!
                                                                    .votes
                                                                    .toList(),
                                                                3))
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                        ],
                                      ),
                                    ),
                                  ),
                                if (valueOrDefault<String>(
                                          widget.thread?.poll.options[3],
                                          'Option',
                                        ) !=
                                        '')
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(30.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 55.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 3.0,
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          LinearPercentIndicator(
                                            percent: functions.votePercent(
                                                widget.thread!.votes.toList(),
                                                4),
                                            lineHeight: 100.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            barRadius: const Radius.circular(30.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          widget.thread?.poll
                                                              .options[3],
                                                          'Option',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      if (functions.voterInList(
                                                              widget.thread!
                                                                  .poll.voters
                                                                  .toList(),
                                                              currentUserReference!) ==
                                                          4)
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .check_circle_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                  Text(
                                                    functions
                                                        .roundAndMultiply(
                                                            functions.votePercent(
                                                                widget.thread!
                                                                    .votes
                                                                    .toList(),
                                                                4))
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                        ],
                                      ),
                                    ),
                                  ),
                              ].divide(const SizedBox(height: 5.0)),
                            ),
                          ),
                      ],
                    ),
                  if (widget.thread?.audio != null &&
                      widget.thread?.audio != '')
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
                      child: Container(
                        width: 450.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(22.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 3.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FlutterFlowAudioPlayer(
                            audio: Audio.network(
                              widget.thread!.audio,
                              metas: Metas(
                                title: 'Audio File',
                              ),
                            ),
                            titleTextStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                            playbackDurationTextStyle:
                                FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      letterSpacing: 0.0,
                                    ),
                            fillColor: const Color(0x00000000),
                            playbackButtonColor:
                                FlutterFlowTheme.of(context).primary,
                            activeTrackColor:
                                FlutterFlowTheme.of(context).primary,
                            elevation: 0.0,
                            playInBackground:
                                PlayInBackground.disabledRestoreOnForeground,
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if ((widget.thread?.link != null &&
                                    widget.thread?.link != '') &&
                                (functions
                                        .identifySocialMediaPlatform(
                                            widget.thread!.link)
                                        .toString() ==
                                    '-1'))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 5.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: const Color(0xFFDD6013),
                                  borderRadius: 20.0,
                                  borderWidth: 2.0,
                                  buttonSize: 40.0,
                                  icon: const Icon(
                                    Icons.link,
                                    color: Color(0xFFDD6013),
                                    size: 22.0,
                                  ),
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: LinkMenuWidget(
                                            link: widget.thread!.link,
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                ),
                              ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await launchURL(widget.thread!.link);
                              },
                              child: Stack(
                                children: [
                                  if (functions
                                          .identifySocialMediaPlatform(
                                              widget.thread!.link)
                                          .toString() ==
                                      '10')
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        borderRadius: 20.0,
                                        borderWidth: 2.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          FFIcons.kx,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 22.0,
                                        ),
                                        onPressed: () async {
                                          await launchURL(widget.thread!.link);
                                        },
                                      ),
                                    ),
                                  if (functions
                                          .identifySocialMediaPlatform(
                                              widget.thread!.link)
                                          .toString() ==
                                      '1')
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        borderRadius: 20.0,
                                        borderWidth: 2.0,
                                        buttonSize: 40.0,
                                        icon: FaIcon(
                                          FontAwesomeIcons.instagram,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 22.0,
                                        ),
                                        onPressed: () async {
                                          await launchURL(widget.thread!.link);
                                        },
                                      ),
                                    ),
                                  if (functions
                                          .identifySocialMediaPlatform(
                                              widget.thread!.link)
                                          .toString() ==
                                      '2')
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        borderRadius: 20.0,
                                        borderWidth: 2.0,
                                        buttonSize: 40.0,
                                        icon: FaIcon(
                                          FontAwesomeIcons.facebookF,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                        onPressed: () async {
                                          await launchURL(widget.thread!.link);
                                        },
                                      ),
                                    ),
                                  if (functions
                                          .identifySocialMediaPlatform(
                                              widget.thread!.link)
                                          .toString() ==
                                      '3')
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        borderRadius: 20.0,
                                        borderWidth: 2.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.play_arrow,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 22.0,
                                        ),
                                        onPressed: () async {
                                          await launchURL(widget.thread!.link);
                                        },
                                      ),
                                    ),
                                  if (functions
                                          .identifySocialMediaPlatform(
                                              widget.thread!.link)
                                          .toString() ==
                                      '4')
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        borderRadius: 20.0,
                                        borderWidth: 2.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.tiktok,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 22.0,
                                        ),
                                        onPressed: () async {
                                          await launchURL(widget.thread!.link);
                                        },
                                      ),
                                    ),
                                  if (functions
                                          .identifySocialMediaPlatform(
                                              widget.thread!.link)
                                          .toString() ==
                                      '5')
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        borderRadius: 20.0,
                                        borderWidth: 2.0,
                                        buttonSize: 40.0,
                                        icon: FaIcon(
                                          FontAwesomeIcons.fire,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 22.0,
                                        ),
                                        onPressed: () async {
                                          await launchURL(widget.thread!.link);
                                        },
                                      ),
                                    ),
                                  if (functions
                                          .identifySocialMediaPlatform(
                                              widget.thread!.link)
                                          .toString() ==
                                      '7')
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        borderRadius: 20.0,
                                        borderWidth: 2.0,
                                        buttonSize: 40.0,
                                        icon: FaIcon(
                                          FontAwesomeIcons.linkedinIn,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                        onPressed: () async {
                                          await launchURL(widget.thread!.link);
                                        },
                                      ),
                                    ),
                                  if (functions
                                          .identifySocialMediaPlatform(
                                              widget.thread!.link)
                                          .toString() ==
                                      '8')
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        borderRadius: 20.0,
                                        borderWidth: 2.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.radar,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 22.0,
                                        ),
                                        onPressed: () async {
                                          await launchURL(widget.thread!.link);
                                        },
                                      ),
                                    ),
                                  if (functions
                                          .identifySocialMediaPlatform(
                                              widget.thread!.link)
                                          .toString() ==
                                      '9')
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        borderRadius: 20.0,
                                        borderWidth: 2.0,
                                        buttonSize: 40.0,
                                        icon: FaIcon(
                                          FontAwesomeIcons.github,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 22.0,
                                        ),
                                        onPressed: () async {
                                          await launchURL(widget.thread!.link);
                                        },
                                      ),
                                    ),
                                  if (functions
                                          .identifySocialMediaPlatform(
                                              widget.thread!.link)
                                          .toString() ==
                                      '11')
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        borderRadius: 20.0,
                                        borderWidth: 2.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.snapchat,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 22.0,
                                        ),
                                        onPressed: () async {
                                          await launchURL(widget.thread!.link);
                                        },
                                      ),
                                    ),
                                  if (functions
                                          .identifySocialMediaPlatform(
                                              widget.thread!.link)
                                          .toString() ==
                                      '12')
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        borderRadius: 20.0,
                                        borderWidth: 2.0,
                                        buttonSize: 40.0,
                                        icon: FaIcon(
                                          FontAwesomeIcons.redditAlien,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 22.0,
                                        ),
                                        onPressed: () async {
                                          await launchURL(widget.thread!.link);
                                        },
                                      ),
                                    ),
                                  if (functions
                                          .identifySocialMediaPlatform(
                                              widget.thread!.link)
                                          .toString() ==
                                      '13')
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        borderRadius: 20.0,
                                        borderWidth: 2.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.discord,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 22.0,
                                        ),
                                        onPressed: () async {
                                          await launchURL(widget.thread!.link);
                                        },
                                      ),
                                    ),
                                  if (functions
                                          .identifySocialMediaPlatform(
                                              widget.thread!.link)
                                          .toString() ==
                                      '14')
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        borderRadius: 20.0,
                                        borderWidth: 2.0,
                                        buttonSize: 40.0,
                                        icon: FaIcon(
                                          FontAwesomeIcons.spotify,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 22.0,
                                        ),
                                        onPressed: () async {
                                          await launchURL(widget.thread!.link);
                                        },
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            if ((widget.thread?.hashtags != null &&
                                    (widget.thread?.hashtags)!.isNotEmpty) ==
                                true)
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).secondary,
                                borderRadius: 20.0,
                                borderWidth: 2.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.tag,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 20.0,
                                ),
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: HashtagsWidget(
                                          hashtags: widget.thread!.hashtags,
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                              ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                if (functions
                                        .voterInList(
                                            widget.thread!.votes.toList(),
                                            currentUserReference!)
                                        .toString() !=
                                    '1')
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 45.0,
                                      icon: Icon(
                                        Icons.thumb_up_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 30.0,
                                      ),
                                      onPressed: () async {
                                        if (functions
                                                .voterInList(
                                                    widget.thread!.votes
                                                        .toList(),
                                                    currentUserReference!)
                                                .toString() ==
                                            '1') {
                                          await widget.thread!.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'Votes':
                                                    FieldValue.arrayRemove([
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
                                                      widget.thread!.votes
                                                          .toList(),
                                                      currentUserReference!)
                                                  .toString() ==
                                              '-1') {
                                            await widget.thread!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'Votes':
                                                      FieldValue.arrayUnion([
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

                                            await widget.thread!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'Votes':
                                                      FieldValue.arrayRemove([
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
                                            await widget.thread!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'Votes':
                                                      FieldValue.arrayUnion([
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
                                      },
                                    ),
                                  ),
                                if (functions
                                        .voterInList(
                                            widget.thread!.votes.toList(),
                                            currentUserReference!)
                                        .toString() ==
                                    '1')
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 45.0,
                                      icon: Icon(
                                        Icons.thumb_up,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 30.0,
                                      ),
                                      onPressed: () async {
                                        if (functions
                                                .voterInList(
                                                    widget.thread!.votes
                                                        .toList(),
                                                    currentUserReference!)
                                                .toString() ==
                                            '1') {
                                          await widget.thread!.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'Votes':
                                                    FieldValue.arrayRemove([
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
                                                      widget.thread!.votes
                                                          .toList(),
                                                      currentUserReference!)
                                                  .toString() ==
                                              '-1') {
                                            await widget.thread!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'Votes':
                                                      FieldValue.arrayUnion([
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

                                            await widget.thread!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'Votes':
                                                      FieldValue.arrayRemove([
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
                                            await widget.thread!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'Votes':
                                                      FieldValue.arrayUnion([
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
                                      },
                                    ),
                                  ),
                              ],
                            ),
                            Stack(
                              children: [
                                if (functions
                                        .voterInList(
                                            widget.thread!.votes.toList(),
                                            currentUserReference!)
                                        .toString() ==
                                    '-1')
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 45.0,
                                      icon: Icon(
                                        Icons.thumb_down,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 30.0,
                                      ),
                                      onPressed: () async {
                                        if (functions
                                                .voterInList(
                                                    widget.thread!.votes
                                                        .toList(),
                                                    currentUserReference!)
                                                .toString() ==
                                            '-1') {
                                          await widget.thread!.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'Votes':
                                                    FieldValue.arrayRemove([
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
                                                      widget.thread!.votes
                                                          .toList(),
                                                      currentUserReference!)
                                                  .toString() ==
                                              '1') {
                                            await widget.thread!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'Votes':
                                                      FieldValue.arrayUnion([
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

                                            await widget.thread!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'Votes':
                                                      FieldValue.arrayRemove([
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
                                            await widget.thread!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'Votes':
                                                      FieldValue.arrayUnion([
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
                                      },
                                    ),
                                  ),
                                if (functions
                                        .voterInList(
                                            widget.thread!.votes.toList(),
                                            currentUserReference!)
                                        .toString() !=
                                    '-1')
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 45.0,
                                      icon: Icon(
                                        Icons.thumb_down_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 30.0,
                                      ),
                                      onPressed: () async {
                                        if (functions
                                                .voterInList(
                                                    widget.thread!.votes
                                                        .toList(),
                                                    currentUserReference!)
                                                .toString() ==
                                            '-1') {
                                          await widget.thread!.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'Votes':
                                                    FieldValue.arrayRemove([
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
                                                      widget.thread!.votes
                                                          .toList(),
                                                      currentUserReference!)
                                                  .toString() ==
                                              '1') {
                                            await widget.thread!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'Votes':
                                                      FieldValue.arrayUnion([
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

                                            await widget.thread!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'Votes':
                                                      FieldValue.arrayRemove([
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
                                            await widget.thread!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'Votes':
                                                      FieldValue.arrayUnion([
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
                                      },
                                    ),
                                  ),
                              ],
                            ),
                            if (widget.thread?.isCommentsAllowed ?? true)
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 45.0,
                                  icon: Icon(
                                    Icons.comment_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: CommentsWidget(
                                            thread: widget.thread?.reference,
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
