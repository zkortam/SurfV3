import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custom_algorithm_model.dart';
export 'custom_algorithm_model.dart';

class CustomAlgorithmWidget extends StatefulWidget {
  const CustomAlgorithmWidget({super.key});

  @override
  State<CustomAlgorithmWidget> createState() => _CustomAlgorithmWidgetState();
}

class _CustomAlgorithmWidgetState extends State<CustomAlgorithmWidget> {
  late CustomAlgorithmModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomAlgorithmModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.politicalView =
          currentUserDocument!.algorithmPreferences.politicalView;
      safeSetState(() {});
    });

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
      height: 500.0,
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
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 10.0),
              child: Container(
                width: double.infinity,
                height: 55.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0x7F2120BC), Color(0x7B7D16C1)],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(1.0, -1.0),
                    end: AlignmentDirectional(-1.0, 1.0),
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Container(
                          width: double.infinity,
                          height: 90.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    3.0, 0.0, 0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  buttonSize: 42.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  icon: Icon(
                                    Icons.not_interested,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 25.0,
                                  ),
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '8705s0t0' /* Algorithm */,
                                        ),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 3.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  buttonSize: 42.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  icon: Icon(
                                    Icons.check_rounded,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 25.0,
                                  ),
                                  onPressed: () async {
                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      algorithmPreferences:
                                          createUserAlgorithmPreferencesStruct(
                                        vulgarity: _model.sliderValue1,
                                        politicalView: _model.sliderValue2,
                                        informativeness: _model.sliderValue3,
                                        toxicity: _model.sliderValue4,
                                        relevance: _model.sliderValue5,
                                        clearUnsetFields: false,
                                      ),
                                    ));
                                    Navigator.pop(context, true);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                width: double.infinity,
                height: 55.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 3.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).alternate,
                              icon: FaIcon(
                                FontAwesomeIcons.solidAngry,
                                color: FlutterFlowTheme.of(context).info,
                                size: 20.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '35fl1j7y' /* Vulgarity */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: AuthUserStreamWidget(
                          builder: (context) => SliderTheme(
                            data: SliderThemeData(
                              showValueIndicator: ShowValueIndicator.always,
                            ),
                            child: Container(
                              width: 200.0,
                              child: Slider(
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveColor:
                                    FlutterFlowTheme.of(context).alternate,
                                min: 0.0,
                                max: 100.0,
                                value: _model.sliderValue1 ??=
                                    valueOrDefault<double>(
                                  currentUserDocument?.algorithmPreferences
                                              ?.vulgarity !=
                                          null
                                      ? currentUserDocument
                                          ?.algorithmPreferences?.vulgarity
                                      : 0.0,
                                  0.0,
                                ),
                                label: _model.sliderValue1?.toStringAsFixed(0),
                                onChanged: (newValue) {
                                  newValue =
                                      double.parse(newValue.toStringAsFixed(0));
                                  safeSetState(
                                      () => _model.sliderValue1 = newValue);
                                },
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
              padding: EdgeInsets.all(5.0),
              child: Container(
                width: double.infinity,
                height: 55.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 3.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).alternate,
                              icon: Icon(
                                Icons.policy,
                                color: FlutterFlowTheme.of(context).info,
                                size: 20.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '8xmpqnjw' /* Political View */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: AuthUserStreamWidget(
                          builder: (context) => SliderTheme(
                            data: SliderThemeData(
                              showValueIndicator: ShowValueIndicator.always,
                            ),
                            child: Container(
                              width: 200.0,
                              child: Slider(
                                activeColor: () {
                                  if (_model.politicalView < -25.0) {
                                    return FlutterFlowTheme.of(context).primary;
                                  } else if (_model.politicalView < 0.0) {
                                    return FlutterFlowTheme.of(context)
                                        .secondary;
                                  } else if (_model.politicalView > 25.0) {
                                    return FlutterFlowTheme.of(context).error;
                                  } else if (_model.politicalView > 0.0) {
                                    return Color(0x9ED01C27);
                                  } else {
                                    return FlutterFlowTheme.of(context)
                                        .secondaryText;
                                  }
                                }(),
                                inactiveColor:
                                    FlutterFlowTheme.of(context).alternate,
                                min: -50.0,
                                max: 50.0,
                                value: _model.sliderValue2 ??=
                                    valueOrDefault<double>(
                                  currentUserDocument?.algorithmPreferences
                                              ?.politicalView !=
                                          null
                                      ? currentUserDocument
                                          ?.algorithmPreferences?.politicalView
                                      : 0.0,
                                  0.0,
                                ),
                                label: _model.sliderValue2?.toStringAsFixed(0),
                                onChanged: (newValue) {
                                  newValue =
                                      double.parse(newValue.toStringAsFixed(0));
                                  safeSetState(
                                      () => _model.sliderValue2 = newValue);
                                },
                                onChangeEnd: (newValue) async {
                                  newValue =
                                      double.parse(newValue.toStringAsFixed(0));
                                  safeSetState(
                                      () => _model.sliderValue2 = newValue);
                                  _model.politicalView = _model.sliderValue2!;
                                  safeSetState(() {});
                                },
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
              padding: EdgeInsets.all(5.0),
              child: Container(
                width: double.infinity,
                height: 55.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 3.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).alternate,
                              icon: Icon(
                                Icons.book_rounded,
                                color: FlutterFlowTheme.of(context).info,
                                size: 20.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'exgg8l0y' /* Informative */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: AuthUserStreamWidget(
                          builder: (context) => SliderTheme(
                            data: SliderThemeData(
                              showValueIndicator: ShowValueIndicator.always,
                            ),
                            child: Container(
                              width: 200.0,
                              child: Slider(
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveColor:
                                    FlutterFlowTheme.of(context).alternate,
                                min: 0.0,
                                max: 100.0,
                                value: _model.sliderValue3 ??=
                                    valueOrDefault<double>(
                                  currentUserDocument?.algorithmPreferences
                                              ?.informativeness !=
                                          null
                                      ? currentUserDocument
                                          ?.algorithmPreferences
                                          ?.informativeness
                                      : 50.0,
                                  50.0,
                                ),
                                label: _model.sliderValue3?.toStringAsFixed(0),
                                onChanged: (newValue) {
                                  newValue =
                                      double.parse(newValue.toStringAsFixed(0));
                                  safeSetState(
                                      () => _model.sliderValue3 = newValue);
                                },
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
              padding: EdgeInsets.all(5.0),
              child: Container(
                width: double.infinity,
                height: 55.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 3.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).alternate,
                              icon: Icon(
                                Icons.warning_rounded,
                                color: FlutterFlowTheme.of(context).info,
                                size: 20.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'oiki3ruc' /* Toxicity */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: AuthUserStreamWidget(
                          builder: (context) => SliderTheme(
                            data: SliderThemeData(
                              showValueIndicator: ShowValueIndicator.always,
                            ),
                            child: Container(
                              width: 200.0,
                              child: Slider(
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveColor:
                                    FlutterFlowTheme.of(context).alternate,
                                min: 0.0,
                                max: 100.0,
                                value: _model.sliderValue4 ??=
                                    valueOrDefault<double>(
                                  currentUserDocument?.algorithmPreferences
                                              ?.toxicity !=
                                          null
                                      ? currentUserDocument
                                          ?.algorithmPreferences?.toxicity
                                      : 0.0,
                                  0.0,
                                ),
                                label: _model.sliderValue4?.toStringAsFixed(0),
                                onChanged: (newValue) {
                                  newValue =
                                      double.parse(newValue.toStringAsFixed(0));
                                  safeSetState(
                                      () => _model.sliderValue4 = newValue);
                                },
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
              padding: EdgeInsets.all(5.0),
              child: Container(
                width: double.infinity,
                height: 55.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 3.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).alternate,
                              icon: Icon(
                                Icons.all_out,
                                color: FlutterFlowTheme.of(context).info,
                                size: 20.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '00pq01yu' /* Relevance */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: AuthUserStreamWidget(
                          builder: (context) => SliderTheme(
                            data: SliderThemeData(
                              showValueIndicator: ShowValueIndicator.always,
                            ),
                            child: Container(
                              width: 200.0,
                              child: Slider(
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveColor:
                                    FlutterFlowTheme.of(context).alternate,
                                min: 0.0,
                                max: 100.0,
                                value: _model.sliderValue5 ??=
                                    valueOrDefault<double>(
                                  currentUserDocument?.algorithmPreferences
                                              ?.relevance !=
                                          null
                                      ? currentUserDocument
                                          ?.algorithmPreferences?.relevance
                                      : 100.0,
                                  100.0,
                                ),
                                label: _model.sliderValue5?.toStringAsFixed(0),
                                onChanged: (newValue) {
                                  newValue =
                                      double.parse(newValue.toStringAsFixed(0));
                                  safeSetState(
                                      () => _model.sliderValue5 = newValue);
                                },
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
          ],
        ),
      ),
    );
  }
}
