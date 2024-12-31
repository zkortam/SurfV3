import '/flutter_flow/flutter_flow_util.dart';
import 'smart_generation_widget.dart' show SmartGenerationWidget;
import 'package:flutter/material.dart';

class SmartGenerationModel extends FlutterFlowModel<SmartGenerationWidget> {
  ///  Local state fields for this component.

  double politicalView = 0.0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Gemini - Generate Text] action in IconButton widget.
  String? geminiOut;
  // State field(s) for Caption widget.
  FocusNode? captionFocusNode;
  TextEditingController? captionTextController;
  String? Function(BuildContext, String?)? captionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    captionFocusNode?.dispose();
    captionTextController?.dispose();
  }
}
