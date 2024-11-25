import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/info_widget.dart';
import '/components/music_selector_widget.dart';
import '/components/pick_group_for_snippet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'make_snippet_caption_widget.dart' show MakeSnippetCaptionWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MakeSnippetCaptionModel
    extends FlutterFlowModel<MakeSnippetCaptionWidget> {
  ///  Local state fields for this component.

  String name = 'name';

  Color color = Color(4283120111);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Bottom Sheet - musicSelector] action in Icon widget.
  MusicRecord? music;
  // Stores action output result for [Bottom Sheet - pickGroupForSnippet] action in Container widget.
  FollowerGroupStruct? groupOutput;
  // State field(s) for TextThread widget.
  FocusNode? textThreadFocusNode;
  TextEditingController? textThreadTextController;
  String? Function(BuildContext, String?)? textThreadTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textThreadFocusNode?.dispose();
    textThreadTextController?.dispose();
  }
}
