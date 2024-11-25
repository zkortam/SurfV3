import '/backend/backend.dart';
import '/components/nav_bar_shorts_widget.dart';
import '/components/short_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'shorts_widget.dart' show ShortsWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShortsModel extends FlutterFlowModel<ShortsWidget> {
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
