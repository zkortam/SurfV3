import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/error_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'create_user_model.dart';
export 'create_user_model.dart';

class CreateUserWidget extends StatefulWidget {
  const CreateUserWidget({super.key});

  @override
  State<CreateUserWidget> createState() => _CreateUserWidgetState();
}

class _CreateUserWidgetState extends State<CreateUserWidget>
    with TickerProviderStateMixin {
  late CreateUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateUserModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.usernameTextController ??= TextEditingController();
    _model.usernameFocusNode ??= FocusNode();

    _model.emailTextController1 ??= TextEditingController();
    _model.emailFocusNode1 ??= FocusNode();

    _model.emailTextController2 ??= TextEditingController();
    _model.emailFocusNode2 ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 6,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF9F1CFA), Color(0xFF0D28A2)],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(0.87, -1.0),
                    end: AlignmentDirectional(-0.87, 1.0),
                  ),
                ),
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 500.0,
                      decoration: const BoxDecoration(),
                      child: Column(
                        children: [
                          Align(
                            alignment: const Alignment(0.0, 0),
                            child: TabBar(
                              labelColor: Colors.transparent,
                              unselectedLabelColor: Colors.transparent,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                  ),
                              unselectedLabelStyle: const TextStyle(),
                              indicatorColor: Colors.transparent,
                              tabs: const [
                                Tab(
                                  text: 'Example 1',
                                ),
                                Tab(
                                  text: 'Example 2',
                                ),
                              ],
                              controller: _model.tabBarController,
                              onTap: (i) async {
                                [() async {}, () async {}][i]();
                              },
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 265.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  final selectedMedia =
                                                      await selectMediaWithSourceBottomSheet(
                                                    context: context,
                                                    maxWidth: 600.00,
                                                    maxHeight: 400.00,
                                                    imageQuality: 76,
                                                    allowPhoto: true,
                                                    includeBlurHash: true,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    safeSetState(() => _model
                                                            .isDataUploading1 =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    var downloadUrls =
                                                        <String>[];
                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                  ))
                                                              .toList();

                                                      downloadUrls =
                                                          (await Future.wait(
                                                        selectedMedia.map(
                                                          (m) async =>
                                                              await uploadData(
                                                                  m.storagePath,
                                                                  m.bytes),
                                                        ),
                                                      ))
                                                              .where((u) =>
                                                                  u != null)
                                                              .map((u) => u!)
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading1 =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                                .length ==
                                                            selectedMedia
                                                                .length &&
                                                        downloadUrls.length ==
                                                            selectedMedia
                                                                .length) {
                                                      safeSetState(() {
                                                        _model.uploadedLocalFile1 =
                                                            selectedUploadedFiles
                                                                .first;
                                                        _model.uploadedFileUrl1 =
                                                            downloadUrls.first;
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
                                                  constraints: const BoxConstraints(
                                                    maxWidth: 600.0,
                                                    maxHeight: 120.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: (_model
                                                                    .uploadedLocalFile1
                                                                    .bytes
                                                                    ?.isNotEmpty ??
                                                                false)
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.network(
                                                        _model.uploadedFileUrl1,
                                                      ).image,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            23.0),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  maxWidth:
                                                                      300.00,
                                                                  maxHeight:
                                                                      300.00,
                                                                  imageQuality:
                                                                      76,
                                                                  includeBlurHash:
                                                                      true,
                                                                  mediaSource:
                                                                      MediaSource
                                                                          .photoGallery,
                                                                  multiImage:
                                                                      false,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading2 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
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

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    _model.isDataUploading2 =
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
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile2 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl2 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    return;
                                                                  }
                                                                }
                                                              },
                                                              child: SizedBox(
                                                                width: 90.0,
                                                                height: 90.0,
                                                                child: Stack(
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          90.0,
                                                                      height:
                                                                          90.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child: Image
                                                                          .network(
                                                                        _model
                                                                            .uploadedFileUrl2,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    if (_model.uploadedFileUrl2 ==
                                                                            '')
                                                                      Container(
                                                                        width:
                                                                            90.0,
                                                                        height:
                                                                            90.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(100.0),
                                                                        ),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .file_upload_outlined,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              30.0,
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      if (_model.uploadedFileUrl1 ==
                                                              '')
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -0.91, 0.76),
                                                          child: Icon(
                                                            Icons
                                                                .file_upload_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 30.0,
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Stack(
                                                        children: [
                                                          if (_model.uploadedFileUrl2 !=
                                                                  '')
                                                            const Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color: Color(
                                                                  0xFF39C727),
                                                              size: 24.0,
                                                            ),
                                                          if (_model.uploadedFileUrl2 ==
                                                                  '')
                                                            Icon(
                                                              Icons
                                                                  .not_interested,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              size: 24.0,
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Profile Picture',
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
                                                    ),
                                                    Stack(
                                                      children: [
                                                        if (_model.uploadedFileUrl1 !=
                                                                '')
                                                          const Icon(
                                                            Icons.check_circle,
                                                            color: Color(
                                                                0xFF39C727),
                                                            size: 24.0,
                                                          ),
                                                        if (_model.uploadedFileUrl1 ==
                                                                '')
                                                          Icon(
                                                            Icons
                                                                .not_interested,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 24.0,
                                                          ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Banner',
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
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Flexible(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .usernameTextController,
                                                      focusNode: _model
                                                          .usernameFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.usernameTextController',
                                                        const Duration(
                                                            milliseconds: 2000),
                                                        () async {
                                                          _model.usernameCheckCopy =
                                                              await queryUsersRecordOnce(
                                                            queryBuilder:
                                                                (usersRecord) =>
                                                                    usersRecord
                                                                        .where(
                                                              'display_name',
                                                              isEqualTo: _model
                                                                  .usernameTextController
                                                                  .text,
                                                            ),
                                                            singleRecord: true,
                                                          ).then((s) => s
                                                                  .firstOrNull);
                                                          if (_model
                                                                  .usernameCheckCopy !=
                                                              null) {
                                                            _model.isUsernameValid =
                                                                false;
                                                            safeSetState(() {});
                                                          } else {
                                                            _model.isUsernameValid =
                                                                true;
                                                            safeSetState(() {});
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                      ),
                                                      onFieldSubmitted:
                                                          (_) async {
                                                        _model.usernameCheck =
                                                            await queryUsersRecordOnce(
                                                          queryBuilder:
                                                              (usersRecord) =>
                                                                  usersRecord
                                                                      .where(
                                                            'display_name',
                                                            isEqualTo: _model
                                                                .usernameTextController
                                                                .text,
                                                          ),
                                                          singleRecord: true,
                                                        ).then((s) =>
                                                                s.firstOrNull);
                                                        if (_model
                                                                .usernameCheck !=
                                                            null) {
                                                          _model.isUsernameValid =
                                                              false;
                                                          safeSetState(() {});
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () =>
                                                                    FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      const ErrorBarWidget(
                                                                    text:
                                                                        'Username already Exists',
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        } else {
                                                          _model.isUsernameValid =
                                                              true;
                                                          safeSetState(() {});
                                                        }

                                                        safeSetState(() {});
                                                      },
                                                      autofocus: false,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .none,
                                                      textInputAction:
                                                          TextInputAction.done,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        hintText: 'Username',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        counterStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
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
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
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
                                                                .alternate,
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
                                                                .alternate,
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
                                                                15.0),
                                                        suffixIcon: Icon(
                                                          Icons.check_circle,
                                                          color: valueOrDefault<
                                                              Color>(
                                                            _model.isUsernameValid
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .success
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                          ),
                                                          size: 22.0,
                                                        ),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                      maxLength: 15,
                                                      maxLengthEnforcement:
                                                          MaxLengthEnforcement
                                                              .enforced,
                                                      validator: _model
                                                          .usernameTextControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .allow(RegExp(
                                                                '^[A-Za-z0-9_.]*\$'))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation']!),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (_model.isUsernameValid)
                                            FFButtonWidget(
                                              onPressed: () async {
                                                safeSetState(() {
                                                  _model.tabBarController!
                                                      .animateTo(
                                                    min(
                                                        _model.tabBarController!
                                                                .length -
                                                            1,
                                                        _model.tabBarController!
                                                                .index +
                                                            1),
                                                    duration: const Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.ease,
                                                  );
                                                });

                                                await currentUserReference!
                                                    .update(
                                                        createUsersRecordData(
                                                  displayName: _model
                                                      .usernameTextController
                                                      .text,
                                                  photoUrl:
                                                      _model.uploadedFileUrl2,
                                                  banner:
                                                      _model.uploadedFileUrl1,
                                                ));
                                              },
                                              text: 'Next',
                                              options: FFButtonOptions(
                                                width: 200.0,
                                                height: 47.0,
                                                padding: const EdgeInsets.all(0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                    ),
                                                elevation: 3.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(29.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller:
                                                _model.emailTextController1,
                                            focusNode: _model.emailFocusNode1,
                                            autofocus: false,
                                            autofillHints: const [
                                              AutofillHints.email
                                            ],
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'Your Name',
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              contentPadding:
                                                  const EdgeInsets.all(20.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                ),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            validator: _model
                                                .emailTextController1Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller:
                                              _model.emailTextController2,
                                          focusNode: _model.emailFocusNode2,
                                          autofocus: false,
                                          autofillHints: const [AutofillHints.email],
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Bio',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            counterStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            contentPadding:
                                                const EdgeInsets.all(20.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Montserrat',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                          maxLines: 4,
                                          minLines: 4,
                                          maxLength: 150,
                                          maxLengthEnforcement:
                                              MaxLengthEnforcement.enforced,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          validator: _model
                                              .emailTextController2Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  safeSetState(() {
                                                    _model.tabBarController!
                                                        .animateTo(
                                                      max(
                                                          0,
                                                          _model.tabBarController!
                                                                  .index -
                                                              1),
                                                      duration: const Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                  });
                                                },
                                                text: 'Back',
                                                options: FFButtonOptions(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.3,
                                                  height: 47.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          30.0, 0.0, 30.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          29.0),
                                                ),
                                                showLoadingIndicator: false,
                                              ),
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                context.pushNamed('CreatePin');

                                                await currentUserReference!
                                                    .update(
                                                        createUsersRecordData(
                                                  name: _model
                                                      .emailTextController1
                                                      .text,
                                                  bio: _model
                                                      .emailTextController2
                                                      .text,
                                                  latestSnippetTime:
                                                      getCurrentTimestamp,
                                                ));
                                              },
                                              text: 'Finish',
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.55,
                                                height: 47.0,
                                                padding: const EdgeInsets.all(0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(29.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
