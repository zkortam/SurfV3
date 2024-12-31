import '/components/nav_bar_shorts_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'single_short_widget.dart' show SingleShortWidget;
import 'package:flutter/material.dart';

class SingleShortModel extends FlutterFlowModel<SingleShortWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for NavBarShorts component.
  late NavBarShortsModel navBarShortsModel;

  @override
  void initState(BuildContext context) {
    navBarShortsModel = createModel(context, () => NavBarShortsModel());
  }

  @override
  void dispose() {
    navBarShortsModel.dispose();
  }
}
