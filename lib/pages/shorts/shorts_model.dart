import '/components/nav_bar_shorts_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'shorts_widget.dart' show ShortsWidget;
import 'package:flutter/material.dart';

class ShortsModel extends FlutterFlowModel<ShortsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NavBarShorts component.
  late NavBarShortsModel navBarShortsModel;

  @override
  void initState(BuildContext context) {
    navBarShortsModel = createModel(context, () => NavBarShortsModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navBarShortsModel.dispose();
  }
}
