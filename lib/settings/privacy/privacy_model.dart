import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/blocked_widget.dart';
import '/components/info_widget.dart';
import '/components/select_group_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'privacy_widget.dart' show PrivacyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PrivacyModel extends FlutterFlowModel<PrivacyWidget> {
  ///  Local state fields for this page.

  String refresh = '0';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
