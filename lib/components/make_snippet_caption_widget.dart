import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/info_widget.dart';
import '/components/pick_group_for_snippet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'make_snippet_caption_model.dart';
export 'make_snippet_caption_model.dart';

class MakeSnippetCaptionWidget extends StatefulWidget {
  const MakeSnippetCaptionWidget({
    super.key,
    this.thread,
    this.post,
  });

  final DocumentReference? thread;
  final DocumentReference? post;

  @override
  State<MakeSnippetCaptionWidget> createState() =>
      _MakeSnippetCaptionWidgetState();
}

class _MakeSnippetCaptionWidgetState extends State<MakeSnippetCaptionWidget> {
  late MakeSnippetCaptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MakeSnippetCaptionModel());

    _model.textThreadTextController ??= TextEditingController();
    _model.textThreadFocusNode ??= FocusNode();

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
      height: 450.0,
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
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '0d5nrjlg' /* Create Snippet */,
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
                        color: FlutterFlowTheme.of(context).info,
                        size: 20.0,
                      ),
                      onPressed: () async {
                        final firestoreBatch =
                            FirebaseFirestore.instance.batch();
                        try {
                          firestoreBatch.set(SnippetsRecord.collection.doc(), {
                            ...createSnippetsRecordData(
                              timePosted: getCurrentTimestamp,
                              author: currentUserReference,
                              caption: _model.textThreadTextController.text,
                              threadsReference: widget.thread,
                              timeCloses:
                                  functions.nextDay(getCurrentTimestamp),
                              postShortReference: widget.post,
                              isOnlyForGroup:
                                  _model.groupOutput?.people != null &&
                                      (_model.groupOutput?.people)!.isNotEmpty,
                            ),
                            ...mapToFirestore(
                              {
                                'validPeople': _model.groupOutput?.people,
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
                                  text: 'Created Snippet',
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));

                          firestoreBatch.update(
                              currentUserReference!,
                              createUsersRecordData(
                                latestSnippetTime:
                                    functions.nextDay(getCurrentTimestamp),
                              ));
                        } finally {
                          await firestoreBatch.commit();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: const PickGroupForSnippetWidget(),
                    );
                  },
                ).then(
                    (value) => safeSetState(() => _model.groupOutput = value));

                _model.name = _model.groupOutput!.name;
                _model.color = _model.groupOutput!.color!;
                safeSetState(() {});

                safeSetState(() {});
              },
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(
                    color: valueOrDefault<Color>(
                      _model.color ?? FlutterFlowTheme.of(context).primary,
                      FlutterFlowTheme.of(context).primary,
                    ),
                    width: 4.0,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        _model.name != ''
                            ? valueOrDefault<String>(
                                _model.name,
                                'Everyone',
                              )
                            : 'Everyone',
                        'Everyone',
                      ),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 8.0, 0.0),
            child: TextFormField(
              controller: _model.textThreadTextController,
              focusNode: _model.textThreadFocusNode,
              autofocus: false,
              textInputAction: TextInputAction.done,
              obscureText: false,
              decoration: InputDecoration(
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Montserrat',
                      letterSpacing: 0.0,
                    ),
                hintText: FFLocalizations.of(context).getText(
                  'ymhm2onz' /* Enter Caption */,
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
              maxLines: 15,
              minLines: 5,
              maxLength: 200,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              cursorColor: FlutterFlowTheme.of(context).secondaryText,
              validator:
                  _model.textThreadTextControllerValidator.asValidator(context),
            ),
          ),
        ],
      ),
    );
  }
}
