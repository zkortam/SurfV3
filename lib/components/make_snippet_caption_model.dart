import '/flutter_flow/flutter_flow_util.dart';
import 'make_snippet_caption_widget.dart' show MakeSnippetCaptionWidget;
import 'package:flutter/material.dart';

class MakeSnippetCaptionModel
    extends FlutterFlowModel<MakeSnippetCaptionWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextThread widget.
  FocusNode? textThreadFocusNode;
  TextEditingController? textThreadTextController;
  String? Function(BuildContext, String?)? textThreadTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textThreadFocusNode?.dispose();
    textThreadTextController?.dispose();
  }
}
