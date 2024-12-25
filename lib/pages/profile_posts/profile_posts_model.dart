import '/components/post_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_posts_widget.dart' show ProfilePostsWidget;
import 'package:flutter/material.dart';

class ProfilePostsModel extends FlutterFlowModel<ProfilePostsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ListView1 widget.
  ScrollController? listView1;
  // State field(s) for singlePostList widget.
  ScrollController? singlePostList;
  // Model for Post component.
  late PostModel postModel2;
  // State field(s) for ListView2 widget.
  ScrollController? listView2;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    listView1 = ScrollController();
    singlePostList = ScrollController();
    postModel2 = createModel(context, () => PostModel());
    listView2 = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    listView1?.dispose();
    singlePostList?.dispose();
    postModel2.dispose();
    listView2?.dispose();
  }
}
