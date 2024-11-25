import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/user_selection_for_group_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'view_group_widget.dart' show ViewGroupWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ViewGroupModel extends FlutterFlowModel<ViewGroupWidget> {
  ///  Local state fields for this page.

  String refresh = '0';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
