import '/flutter_flow/flutter_flow_util.dart';
import 'post_widget.dart' show PostWidget;
import 'package:flutter/material.dart';

class PostModel extends FlutterFlowModel<PostWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for OnePost widget.
  PageController? onePostController;

  int get onePostCurrentIndex => onePostController != null &&
          onePostController!.hasClients &&
          onePostController!.page != null
      ? onePostController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
