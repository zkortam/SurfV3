import '/components/post_compressed_widget.dart';
import '/components/threads_compressed_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_chat_widget.dart' show UserChatWidget;
import 'package:flutter/material.dart';

class UserChatModel extends FlutterFlowModel<UserChatWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for PostCompressed component.
  late PostCompressedModel postCompressedModel;
  // Model for threadsCompressed component.
  late ThreadsCompressedModel threadsCompressedModel;

  @override
  void initState(BuildContext context) {
    postCompressedModel = createModel(context, () => PostCompressedModel());
    threadsCompressedModel =
        createModel(context, () => ThreadsCompressedModel());
  }

  @override
  void dispose() {
    postCompressedModel.dispose();
    threadsCompressedModel.dispose();
  }
}
