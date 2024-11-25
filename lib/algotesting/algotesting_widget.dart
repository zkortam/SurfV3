import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'algotesting_model.dart';
export 'algotesting_model.dart';

class AlgotestingWidget extends StatefulWidget {
  const AlgotestingWidget({super.key});

  @override
  State<AlgotestingWidget> createState() => _AlgotestingWidgetState();
}

class _AlgotestingWidgetState extends State<AlgotestingWidget> {
  late AlgotestingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlgotestingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: GetrecommendationsCall.call(
        userId: '123456789',
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitFadingFour(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        final algotestingGetrecommendationsResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final captions = GetrecommendationsCall.captions(
                          algotestingGetrecommendationsResponse.jsonBody,
                        )?.toList() ??
                        [];

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(captions.length, (captionsIndex) {
                        final captionsItem = captions[captionsIndex];
                        return Text(
                          captionsItem,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                  ),
                        );
                      }),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
