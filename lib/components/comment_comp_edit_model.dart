import '/flutter_flow/flutter_flow_util.dart';
import 'comment_comp_edit_widget.dart' show CommentCompEditWidget;
import 'package:flutter/material.dart';

class CommentCompEditModel extends FlutterFlowModel<CommentCompEditWidget> {
  ///  State fields for stateful widgets in this component.

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
