import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'posts_comp_edit_widget.dart' show PostsCompEditWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PostsCompEditModel extends FlutterFlowModel<PostsCompEditWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Caption widget.
  FocusNode? captionFocusNode;
  TextEditingController? captionTextController;
  String? Function(BuildContext, String?)? captionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    captionFocusNode?.dispose();
    captionTextController?.dispose();
  }
}
