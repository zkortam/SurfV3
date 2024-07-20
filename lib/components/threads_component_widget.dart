import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      constraints: const BoxConstraints(
        maxHeight: 450.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: double.infinity,
              height: 60.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                    child: StreamBuilder<UsersRecord>(
                      stream: UsersRecord.getDocument(widget.thread!.author!),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
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
                              width: 50.0,
                              height: 50.0,
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
                                  10.0, 0.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    rowUsersRecord.name,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Text(
                                    rowUsersRecord.displayName,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        functions
                            .calculateNetVotes(widget.thread!.votes.toList())
                            .toString(),
                        '0',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                widget.thread?.title,
                'Title',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontSize: 17.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                dateTimeFormat(
                  'relative',
                  widget.thread?.timeStamp,
                  locale: FFLocalizations.of(context).languageShortCode ??
                      FFLocalizations.of(context).languageCode,
                ),
                'Time',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          Flexible(
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(
                minHeight: 30.0,
                maxHeight: 250.0,
              ),
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MarkdownBody(
                      data: widget.thread!.text,
                      selectable: true,
                      onTapLink: (_, url, __) => launchURL(url!),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (widget.thread?.summary != null && widget.thread?.summary != '')
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(
                  maxHeight: 80.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Summary',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Flexible(
                        child: Text(
                          valueOrDefault<String>(
                            widget.thread?.summary,
                            'text',
                          ),
                          maxLines: 3,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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
          if (widget.thread?.audio != null && widget.thread?.audio != '')
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(
                  maxHeight: 80.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 2.0,
                  ),
                ),
                child: FlutterFlowAudioPlayer(
                  audio: Audio.network(
                    widget.thread!.audio,
                    metas: Metas(
                      id: 'sample3.mp3-f40f72f1',
                      title: 'Audio File',
                    ),
                  ),
                  titleTextStyle:
                      FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Outfit',
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                          ),
                  playbackDurationTextStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Outfit',
                            letterSpacing: 0.0,
                          ),
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  playbackButtonColor: FlutterFlowTheme.of(context).primary,
                  activeTrackColor: FlutterFlowTheme.of(context).primary,
                  elevation: 0.0,
                  playInBackground:
                      PlayInBackground.disabledRestoreOnForeground,
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
                    if (widget.thread?.link != null &&
                        widget.thread?.link != '')
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
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
                          onPressed: () {
                            print('Link pressed ...');
                          },
                        ),
                      ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).primaryText,
                            borderRadius: 20.0,
                            borderWidth: 2.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              FFIcons.kx,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('Twitter pressed ...');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).primaryText,
                            borderRadius: 20.0,
                            borderWidth: 2.0,
                            buttonSize: 40.0,
                            icon: FaIcon(
                              FontAwesomeIcons.instagram,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('Instagram pressed ...');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).primaryText,
                            borderRadius: 20.0,
                            borderWidth: 2.0,
                            buttonSize: 40.0,
                            icon: FaIcon(
                              FontAwesomeIcons.facebookF,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 22.0,
                            ),
                            onPressed: () {
                              print('Facebook pressed ...');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).primaryText,
                            borderRadius: 20.0,
                            borderWidth: 2.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.play_arrow,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('Youtube pressed ...');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).primaryText,
                            borderRadius: 20.0,
                            borderWidth: 2.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.tiktok,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('Tiktok pressed ...');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).primaryText,
                            borderRadius: 20.0,
                            borderWidth: 2.0,
                            buttonSize: 40.0,
                            icon: FaIcon(
                              FontAwesomeIcons.fire,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('Gettr pressed ...');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).primaryText,
                            borderRadius: 20.0,
                            borderWidth: 2.0,
                            buttonSize: 40.0,
                            icon: FaIcon(
                              FontAwesomeIcons.linkedinIn,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('Linkedin pressed ...');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).primaryText,
                            borderRadius: 20.0,
                            borderWidth: 2.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.radar,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('Rumble pressed ...');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).primaryText,
                            borderRadius: 20.0,
                            borderWidth: 2.0,
                            buttonSize: 40.0,
                            icon: FaIcon(
                              FontAwesomeIcons.github,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('Github pressed ...');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).primaryText,
                            borderRadius: 20.0,
                            borderWidth: 2.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.snapchat,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('Snapchat pressed ...');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).primaryText,
                            borderRadius: 20.0,
                            borderWidth: 2.0,
                            buttonSize: 40.0,
                            icon: FaIcon(
                              FontAwesomeIcons.redditAlien,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('Reddit pressed ...');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).primaryText,
                            borderRadius: 20.0,
                            borderWidth: 2.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.discord,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('Discord pressed ...');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).primaryText,
                            borderRadius: 20.0,
                            borderWidth: 2.0,
                            buttonSize: 40.0,
                            icon: FaIcon(
                              FontAwesomeIcons.spotify,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () {
                              print('Spotify pressed ...');
                            },
                          ),
                        ),
                      ],
                    ),
                    if ((widget.thread?.hashtags != null &&
                            (widget.thread?.hashtags)!.isNotEmpty) ==
                        true)
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).secondary,
                        borderRadius: 20.0,
                        borderWidth: 2.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.tag,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 20.0,
                        ),
                        onPressed: () {
                          print('Hashtag pressed ...');
                        },
                      ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 45.0,
                            icon: Icon(
                              Icons.thumb_up_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              if (functions
                                      .voterInList(
                                          widget.thread!.votes.toList(),
                                          currentUserReference!)
                                      .toString() ==
                                  '1') {
                                await widget.thread!.reference.update({
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
                              } else {
                                if (functions
                                        .voterInList(
                                            widget.thread!.votes.toList(),
                                            currentUserReference!)
                                        .toString() ==
                                    '-1') {
                                  await widget.thread!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'Votes': FieldValue.arrayUnion([
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

                                  await widget.thread!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'Votes': FieldValue.arrayRemove([
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
                                  await widget.thread!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'Votes': FieldValue.arrayUnion([
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
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 45.0,
                            icon: Icon(
                              Icons.thumb_up_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              if (functions
                                      .voterInList(
                                          widget.thread!.votes.toList(),
                                          currentUserReference!)
                                      .toString() ==
                                  '1') {
                                await widget.thread!.reference.update({
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
                              } else {
                                if (functions
                                        .voterInList(
                                            widget.thread!.votes.toList(),
                                            currentUserReference!)
                                        .toString() ==
                                    '-1') {
                                  await widget.thread!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'Votes': FieldValue.arrayUnion([
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

                                  await widget.thread!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'Votes': FieldValue.arrayRemove([
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
                                  await widget.thread!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'Votes': FieldValue.arrayUnion([
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
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 45.0,
                            icon: Icon(
                              Icons.thumb_down_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              if (functions
                                      .voterInList(
                                          widget.thread!.votes.toList(),
                                          currentUserReference!)
                                      .toString() ==
                                  '-1') {
                                await widget.thread!.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'Votes': FieldValue.arrayRemove([
                                        getVotersFirestoreData(
                                          createVotersStruct(
                                            userReference: currentUserReference,
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
                                            widget.thread!.votes.toList(),
                                            currentUserReference!)
                                        .toString() ==
                                    '1') {
                                  await widget.thread!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'Votes': FieldValue.arrayUnion([
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

                                  await widget.thread!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'Votes': FieldValue.arrayRemove([
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
                                  await widget.thread!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'Votes': FieldValue.arrayUnion([
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
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 45.0,
                            icon: Icon(
                              Icons.thumb_down_off_alt_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              if (functions
                                      .voterInList(
                                          widget.thread!.votes.toList(),
                                          currentUserReference!)
                                      .toString() ==
                                  '-1') {
                                await widget.thread!.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'Votes': FieldValue.arrayRemove([
                                        getVotersFirestoreData(
                                          createVotersStruct(
                                            userReference: currentUserReference,
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
                                            widget.thread!.votes.toList(),
                                            currentUserReference!)
                                        .toString() ==
                                    '1') {
                                  await widget.thread!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'Votes': FieldValue.arrayUnion([
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

                                  await widget.thread!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'Votes': FieldValue.arrayRemove([
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
                                  await widget.thread!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'Votes': FieldValue.arrayUnion([
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
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 45.0,
                        icon: Icon(
                          Icons.comment_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
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
    );
  }
}
