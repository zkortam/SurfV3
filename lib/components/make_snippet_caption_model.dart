import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'make_snippet_caption_widget.dart' show MakeSnippetCaptionWidget;
import 'package:flutter/material.dart';

class MakeSnippetCaptionModel
    extends FlutterFlowModel<MakeSnippetCaptionWidget> {
  ///  Local state fields for this component.

  String name = 'name';

  Color color = const Color(0xff4b39ef);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Bottom Sheet - pickGroupForSnippet] action in Container widget.
  FollowerGroupStruct? groupOutput;
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
