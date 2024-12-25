import '/flutter_flow/flutter_flow_util.dart';
import 'post_compressed_widget.dart' show PostCompressedWidget;
import 'package:flutter/material.dart';

class PostCompressedModel extends FlutterFlowModel<PostCompressedWidget> {
  ///  Local state fields for this component.

  bool isinfoshowing = true;

  int voteValue = 0;

  bool animation = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for MultipleMedia widget.
  PageController? multipleMediaController;

  int get multipleMediaCurrentIndex => multipleMediaController != null &&
          multipleMediaController!.hasClients &&
          multipleMediaController!.page != null
      ? multipleMediaController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
