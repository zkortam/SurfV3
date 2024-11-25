import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/info_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_group_widget.dart' show CreateGroupWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateGroupModel extends FlutterFlowModel<CreateGroupWidget> {
  ///  Local state fields for this component.

  Color color = Color(4283120111);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TitleThreads widget.
  FocusNode? titleThreadsFocusNode;
  TextEditingController? titleThreadsTextController;
  String? Function(BuildContext, String?)? titleThreadsTextControllerValidator;
  Color? colorPicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleThreadsFocusNode?.dispose();
    titleThreadsTextController?.dispose();
  }
}
