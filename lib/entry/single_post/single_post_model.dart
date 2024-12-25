import '/components/post_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'single_post_widget.dart' show SinglePostWidget;
import 'package:flutter/material.dart';

class SinglePostModel extends FlutterFlowModel<SinglePostWidget> {
  ///  State fields for stateful widgets in this page.

  String currentPageLink = '';
  // Model for Post component.
  late PostModel postModel1;
  // Model for Post component.
  late PostModel postModel2;

  @override
  void initState(BuildContext context) {
    postModel1 = createModel(context, () => PostModel());
    postModel2 = createModel(context, () => PostModel());
  }

  @override
  void dispose() {
    postModel1.dispose();
    postModel2.dispose();
  }
}
