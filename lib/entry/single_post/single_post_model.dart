import '/backend/backend.dart';
import '/components/post_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'single_post_widget.dart' show SinglePostWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SinglePostModel extends FlutterFlowModel<SinglePostWidget> {
  ///  State fields for stateful widgets in this page.

  String currentPageLink = '';
  // Model for Post component.
  late PostModel postModel1;

  @override
  void initState(BuildContext context) {
    postModel1 = createModel(context, () => PostModel());
  }

  @override
  void dispose() {
    postModel1.dispose();
  }
}
