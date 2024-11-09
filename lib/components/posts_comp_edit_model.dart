import '/flutter_flow/flutter_flow_util.dart';
import 'posts_comp_edit_widget.dart' show PostsCompEditWidget;
import 'package:flutter/material.dart';

class PostsCompEditModel extends FlutterFlowModel<PostsCompEditWidget> {
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
