import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_group_chat_widget.dart' show CreateGroupChatWidget;
import 'package:flutter/material.dart';

class CreateGroupChatModel extends FlutterFlowModel<CreateGroupChatWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatsRecord? output;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
