import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comment_widget.dart' show CommentWidget;
import 'package:flutter/material.dart';

class CommentModel extends FlutterFlowModel<CommentWidget> {
  ///  Local state fields for this component.

  bool replyOn = false;

  bool isReplying = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for ReplyText widget.
  FocusNode? replyTextFocusNode;
  TextEditingController? replyTextTextController;
  String? Function(BuildContext, String?)? replyTextTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in ReplyText widget.
  CommentsRecord? commentOutput;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  CommentsRecord? commentOutputCopyTwo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    replyTextFocusNode?.dispose();
    replyTextTextController?.dispose();
  }
}
