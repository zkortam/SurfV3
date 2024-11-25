import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/make_snippet_caption_widget.dart';
import '/components/posts_comp_edit_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'posts_comp_widget.dart' show PostsCompWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class PostsCompModel extends FlutterFlowModel<PostsCompWidget> {
  ///  State fields for stateful widgets in this component.

  String currentPageLink = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
