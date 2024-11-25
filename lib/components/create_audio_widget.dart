import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_audio_model.dart';
export 'create_audio_model.dart';

class CreateAudioWidget extends StatefulWidget {
  const CreateAudioWidget({super.key});

  @override
  State<CreateAudioWidget> createState() => _CreateAudioWidgetState();
}

class _CreateAudioWidgetState extends State<CreateAudioWidget>
    with TickerProviderStateMixin {
  late CreateAudioModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateAudioModel());

    _model.textThreadTextController1 ??= TextEditingController();
    _model.textThreadFocusNode1 ??= FocusNode();

    _model.textThreadTextController2 ??= TextEditingController();
    _model.textThreadFocusNode2 ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          SaturateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 3000.0.ms,
            begin: 0.0,
            end: 1.0,
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 650.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
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
                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      buttonSize: 42.0,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      icon: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).info,
                        size: 15.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'llnq8bpe' /* Create Audio */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ]
                            .divide(SizedBox(width: 10.0))
                            .addToEnd(SizedBox(width: 10.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      buttonSize: 42.0,
                      fillColor: FlutterFlowTheme.of(context).primary,
                      icon: Icon(
                        Icons.check_rounded,
                        color: FlutterFlowTheme.of(context).info,
                        size: 20.0,
                      ),
                      onPressed: () async {
                        await MusicRecord.collection
                            .doc()
                            .set(createMusicRecordData(
                              name: _model.textThreadTextController1.text,
                              author: currentUserReference,
                              audio: _model.uploadedFileUrl2,
                              cover: _model.uploadedFileUrl1,
                              time: getCurrentTimestamp,
                              authorRealName:
                                  _model.textThreadTextController2.text,
                            ));
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                final selectedMedia = await selectMediaWithSourceBottomSheet(
                  context: context,
                  maxWidth: 600.00,
                  maxHeight: 400.00,
                  imageQuality: 76,
                  allowPhoto: true,
                  includeBlurHash: true,
                );
                if (selectedMedia != null &&
                    selectedMedia.every(
                        (m) => validateFileFormat(m.storagePath, context))) {
                  safeSetState(() => _model.isDataUploading1 = true);
                  var selectedUploadedFiles = <FFUploadedFile>[];

                  var downloadUrls = <String>[];
                  try {
                    selectedUploadedFiles = selectedMedia
                        .map((m) => FFUploadedFile(
                              name: m.storagePath.split('/').last,
                              bytes: m.bytes,
                              height: m.dimensions?.height,
                              width: m.dimensions?.width,
                              blurHash: m.blurHash,
                            ))
                        .toList();

                    downloadUrls = (await Future.wait(
                      selectedMedia.map(
                        (m) async => await uploadData(m.storagePath, m.bytes),
                      ),
                    ))
                        .where((u) => u != null)
                        .map((u) => u!)
                        .toList();
                  } finally {
                    _model.isDataUploading1 = false;
                  }
                  if (selectedUploadedFiles.length == selectedMedia.length &&
                      downloadUrls.length == selectedMedia.length) {
                    safeSetState(() {
                      _model.uploadedLocalFile1 = selectedUploadedFiles.first;
                      _model.uploadedFileUrl1 = downloadUrls.first;
                    });
                  } else {
                    safeSetState(() {});
                    return;
                  }
                }
              },
              child: Container(
                width: double.infinity,
                height: 120.0,
                constraints: BoxConstraints(
                  maxWidth: 600.0,
                  maxHeight: 120.0,
                ),
                decoration: BoxDecoration(
                  color: _model.uploadedLocalFile1 != null &&
                          (_model.uploadedLocalFile1.bytes?.isNotEmpty ?? false)
                      ? FlutterFlowTheme.of(context).secondaryBackground
                      : FlutterFlowTheme.of(context).primary,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      _model.uploadedFileUrl1,
                    ).image,
                  ),
                  borderRadius: BorderRadius.circular(23.0),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.91, 0.76),
                      child: Icon(
                        Icons.file_upload_outlined,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Stack(
            children: [
              if (_model.uploadedLocalFile1 != null &&
                  (_model.uploadedLocalFile1.bytes?.isNotEmpty ?? false))
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 150.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          _model.uploadedFileUrl1,
                        ).image,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 5.0,
                      ),
                    ),
                  )
                      .animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation']!)
                      .animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation']!,
                      ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: FFButtonWidget(
              onPressed: () async {
                final selectedFiles = await selectFiles(
                  allowedExtensions: ['mp3'],
                  multiFile: false,
                );
                if (selectedFiles != null) {
                  safeSetState(() => _model.isDataUploading2 = true);
                  var selectedUploadedFiles = <FFUploadedFile>[];

                  var downloadUrls = <String>[];
                  try {
                    selectedUploadedFiles = selectedFiles
                        .map((m) => FFUploadedFile(
                              name: m.storagePath.split('/').last,
                              bytes: m.bytes,
                            ))
                        .toList();

                    downloadUrls = (await Future.wait(
                      selectedFiles.map(
                        (f) async => await uploadData(f.storagePath, f.bytes),
                      ),
                    ))
                        .where((u) => u != null)
                        .map((u) => u!)
                        .toList();
                  } finally {
                    _model.isDataUploading2 = false;
                  }
                  if (selectedUploadedFiles.length == selectedFiles.length &&
                      downloadUrls.length == selectedFiles.length) {
                    safeSetState(() {
                      _model.uploadedLocalFile2 = selectedUploadedFiles.first;
                      _model.uploadedFileUrl2 = downloadUrls.first;
                    });
                  } else {
                    safeSetState(() {});
                    return;
                  }
                }
              },
              text: FFLocalizations.of(context).getText(
                '7u99cmgs' /* Upload Audio */,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 50.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
            child: TextFormField(
              controller: _model.textThreadTextController1,
              focusNode: _model.textThreadFocusNode1,
              autofocus: false,
              textInputAction: TextInputAction.done,
              obscureText: false,
              decoration: InputDecoration(
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Montserrat',
                      letterSpacing: 0.0,
                    ),
                hintText: FFLocalizations.of(context).getText(
                  '6cdqsuj7' /* Title */,
                ),
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Montserrat',
                      letterSpacing: 0.0,
                    ),
                counterStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Montserrat',
                    letterSpacing: 0.0,
                  ),
              minLines: 1,
              maxLength: 50,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              buildCounter: (context,
                      {required currentLength,
                      required isFocused,
                      maxLength}) =>
                  null,
              cursorColor: FlutterFlowTheme.of(context).secondaryText,
              validator: _model.textThreadTextController1Validator
                  .asValidator(context),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 8.0, 0.0),
            child: TextFormField(
              controller: _model.textThreadTextController2,
              focusNode: _model.textThreadFocusNode2,
              autofocus: false,
              textInputAction: TextInputAction.done,
              obscureText: false,
              decoration: InputDecoration(
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Montserrat',
                      letterSpacing: 0.0,
                    ),
                hintText: FFLocalizations.of(context).getText(
                  'q18dl6lh' /* Author */,
                ),
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Montserrat',
                      letterSpacing: 0.0,
                    ),
                counterStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Montserrat',
                    letterSpacing: 0.0,
                  ),
              minLines: 1,
              maxLength: 50,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              buildCounter: (context,
                      {required currentLength,
                      required isFocused,
                      maxLength}) =>
                  null,
              cursorColor: FlutterFlowTheme.of(context).secondaryText,
              validator: _model.textThreadTextController2Validator
                  .asValidator(context),
            ),
          ),
          if (_model.uploadedFileUrl2 != null && _model.uploadedFileUrl2 != '')
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(24.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 3.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: FlutterFlowAudioPlayer(
                    audio: Audio.network(
                      _model.uploadedFileUrl2,
                      metas: Metas(
                        title: _model.textThreadTextController1.text,
                      ),
                    ),
                    titleTextStyle:
                        FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                    playbackDurationTextStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Outfit',
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                    fillColor: Color(0x00000000),
                    playbackButtonColor: FlutterFlowTheme.of(context).primary,
                    activeTrackColor: FlutterFlowTheme.of(context).primary,
                    elevation: 0.0,
                    playInBackground:
                        PlayInBackground.disabledRestoreOnForeground,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
