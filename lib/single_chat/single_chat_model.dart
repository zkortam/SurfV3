import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'single_chat_widget.dart' show SingleChatWidget;
import 'package:flutter/material.dart';

class SingleChatModel extends FlutterFlowModel<SingleChatWidget> {
  ///  Local state fields for this page.

  int refresh = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatMessagesRecord? output;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    listViewController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
