import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'error_bar_model.dart';
export 'error_bar_model.dart';

class ErrorBarWidget extends StatefulWidget {
  const ErrorBarWidget({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  State<ErrorBarWidget> createState() => _ErrorBarWidgetState();
}

class _ErrorBarWidgetState extends State<ErrorBarWidget> {
  late ErrorBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ErrorBarModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 2000));
      Navigator.pop(context);
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
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
        child: Container(
          width: 600.0,
          height: 50.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF93333), Color(0xFFDA940A)],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(1.0, 0.0),
              end: AlignmentDirectional(-1.0, 0),
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget!.text!,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
