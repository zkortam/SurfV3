import '/components/post_compressed_widget.dart';
import '/components/threads_compressed_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'other_chat_widget.dart' show OtherChatWidget;
import 'package:flutter/material.dart';

class OtherChatModel extends FlutterFlowModel<OtherChatWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for threadsCompressed component.
  late ThreadsCompressedModel threadsCompressedModel;
  // Model for PostCompressed component.
  late PostCompressedModel postCompressedModel;

  @override
  void initState(BuildContext context) {
    threadsCompressedModel =
        createModel(context, () => ThreadsCompressedModel());
    postCompressedModel = createModel(context, () => PostCompressedModel());
  }

  @override
  void dispose() {
    threadsCompressedModel.dispose();
    postCompressedModel.dispose();
  }
}
