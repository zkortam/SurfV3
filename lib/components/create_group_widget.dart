import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/info_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'create_group_model.dart';
export 'create_group_model.dart';

class CreateGroupWidget extends StatefulWidget {
  const CreateGroupWidget({super.key});

  @override
  State<CreateGroupWidget> createState() => _CreateGroupWidgetState();
}

class _CreateGroupWidgetState extends State<CreateGroupWidget> {
  late CreateGroupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateGroupModel());

    _model.titleThreadsTextController ??= TextEditingController();
    _model.titleThreadsFocusNode ??= FocusNode();

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
        borderRadius: const BorderRadius.only(
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
            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      buttonSize: 42.0,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
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
                            '1rgfux1h' /* Create Group */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Montserrat',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
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
                        await currentUserReference!.update({
                          ...mapToFirestore(
                            {
                              'groups': FieldValue.arrayUnion([
                                getFollowerGroupFirestoreData(
                                  createFollowerGroupStruct(
                                    name:
                                        _model.titleThreadsTextController.text,
                                    color: _model.color,
                                    clearUnsetFields: false,
                                  ),
                                  true,
                                )
                              ]),
                            },
                          ),
                        });
                        Navigator.pop(context);
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: const InfoWidget(
                                text: 'Group Created',
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 8.0, 10.0),
              child: TextFormField(
                controller: _model.titleThreadsTextController,
                focusNode: _model.titleThreadsFocusNode,
                autofocus: false,
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.next,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: FFLocalizations.of(context).getText(
                    '3b7h20pt' /* Group Name */,
                  ),
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Montserrat',
                        letterSpacing: 0.0,
                      ),
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Montserrat',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                  counterStyle:
                      FlutterFlowTheme.of(context).bodyMedium.override(
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
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                    ),
                textAlign: TextAlign.start,
                maxLines: 3,
                minLines: 1,
                maxLength: 25,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                cursorColor: FlutterFlowTheme.of(context).secondaryText,
                validator: _model.titleThreadsTextControllerValidator
                    .asValidator(context),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'chpjx9fj' /* Group Colour */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Opacity(
              opacity: 0.9,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                    childAspectRatio: 1.6,
                  ),
                  scrollDirection: Axis.vertical,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.color = const Color(0xFFFF0000);
                        safeSetState(() {});
                      },
                      child: Container(
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF0000),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Visibility(
                          visible: _model.color == const Color(0xFFFF0000),
                          child: const Icon(
                            Icons.check_circle_sharp,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.color = const Color(0xFFFF7F00);
                        safeSetState(() {});
                      },
                      child: Container(
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF7F00),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Visibility(
                          visible: _model.color == const Color(0xFFFF7F00),
                          child: const Icon(
                            Icons.check_circle_sharp,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.color = const Color(0xFFFFFF00);
                        safeSetState(() {});
                      },
                      child: Container(
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFF00),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Visibility(
                          visible: _model.color == const Color(0xFFFFFF00),
                          child: const Icon(
                            Icons.check_circle_sharp,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.color = const Color(0xFF7FFF00);
                        safeSetState(() {});
                      },
                      child: Container(
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFF7FFF00),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Visibility(
                          visible: _model.color == const Color(0xFF7FFF00),
                          child: const Icon(
                            Icons.check_circle_sharp,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.color = const Color(0xFF00FF00);
                        safeSetState(() {});
                      },
                      child: Container(
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFF00FF00),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Visibility(
                          visible: _model.color == const Color(0xFF00FF00),
                          child: const Icon(
                            Icons.check_circle_sharp,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.color = const Color(0xFF00FF7F);
                        safeSetState(() {});
                      },
                      child: Container(
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFF00FF7F),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Visibility(
                          visible: _model.color == const Color(0xFF00FF7F),
                          child: const Icon(
                            Icons.check_circle_sharp,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.color = const Color(0xFF007FFF);
                        safeSetState(() {});
                      },
                      child: Container(
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFF007FFF),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Visibility(
                          visible: _model.color == const Color(0xFF007FFF),
                          child: const Icon(
                            Icons.check_circle_sharp,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.color = const Color(0xFF0000FF);
                        safeSetState(() {});
                      },
                      child: Container(
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0000FF),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Visibility(
                          visible: _model.color == const Color(0xFF0000FF),
                          child: const Icon(
                            Icons.check_circle_sharp,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.color = const Color(0xFF4B0082);
                        safeSetState(() {});
                      },
                      child: Container(
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4B0082),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Visibility(
                          visible: _model.color == const Color(0xFF4B0082),
                          child: const Icon(
                            Icons.check_circle_sharp,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.color = const Color(0xFF9400D3);
                        safeSetState(() {});
                      },
                      child: Container(
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFF9400D3),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Visibility(
                          visible: _model.color == const Color(0xFF9400D3),
                          child: const Icon(
                            Icons.check_circle_sharp,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.color = const Color(0xFFFF00FF);
                        safeSetState(() {});
                      },
                      child: Container(
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF00FF),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Visibility(
                          visible: _model.color == const Color(0xFFFF00FF),
                          child: const Icon(
                            Icons.check_circle_sharp,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        final colorPickedColor = await showFFColorPicker(
                          context,
                          currentColor: _model.colorPicked ??=
                              FlutterFlowTheme.of(context).primary,
                          showRecentColors: true,
                          allowOpacity: true,
                          textColor: FlutterFlowTheme.of(context).primaryText,
                          secondaryTextColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          primaryButtonBackgroundColor:
                              FlutterFlowTheme.of(context).primary,
                          primaryButtonTextColor: Colors.white,
                          primaryButtonBorderColor: Colors.transparent,
                          displayAsBottomSheet: isMobileWidth(context),
                        );

                        if (colorPickedColor != null) {
                          safeSetState(
                              () => _model.colorPicked = colorPickedColor);
                        }

                        _model.color = _model.colorPicked!;
                        safeSetState(() {});
                      },
                      child: Container(
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            _model.colorPicked,
                            FlutterFlowTheme.of(context).alternate,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.colorize_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 32.0,
                            ),
                          ],
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
    );
  }
}
