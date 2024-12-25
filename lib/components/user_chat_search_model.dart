import '/flutter_flow/flutter_flow_util.dart';
import 'user_chat_search_widget.dart' show UserChatSearchWidget;
import 'package:flutter/material.dart';

class UserChatSearchModel extends FlutterFlowModel<UserChatSearchWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for CaptionSnippet widget.
  FocusNode? captionSnippetFocusNode;
  TextEditingController? captionSnippetTextController;
  String? Function(BuildContext, String?)?
      captionSnippetTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    captionSnippetFocusNode?.dispose();
    captionSnippetTextController?.dispose();
  }
}
