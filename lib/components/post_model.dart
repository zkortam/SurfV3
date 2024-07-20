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
  // State field(s) for TwoPosts widget.
  PageController? twoPostsController;

  int get twoPostsCurrentIndex => twoPostsController != null &&
          twoPostsController!.hasClients &&
          twoPostsController!.page != null
      ? twoPostsController!.page!.round()
      : 0;
  // State field(s) for ThreePosts widget.
  PageController? threePostsController;

  int get threePostsCurrentIndex => threePostsController != null &&
          threePostsController!.hasClients &&
          threePostsController!.page != null
      ? threePostsController!.page!.round()
      : 0;
  // State field(s) for FourPosts widget.
  PageController? fourPostsController;

  int get fourPostsCurrentIndex => fourPostsController != null &&
          fourPostsController!.hasClients &&
          fourPostsController!.page != null
      ? fourPostsController!.page!.round()
      : 0;
  // State field(s) for FivePosts widget.
  PageController? fivePostsController;

  int get fivePostsCurrentIndex => fivePostsController != null &&
          fivePostsController!.hasClients &&
          fivePostsController!.page != null
      ? fivePostsController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
