import '/flutter_flow/flutter_flow_util.dart';
import 'gemini_experiment_widget.dart' show GeminiExperimentWidget;
import 'package:flutter/material.dart';

class GeminiExperimentModel extends FlutterFlowModel<GeminiExperimentWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Gemini - Generate Text] action in Button widget.
  String? output;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
