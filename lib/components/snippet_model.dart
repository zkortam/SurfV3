import '/backend/backend.dart';
import '/components/post_widget.dart';
import '/components/threads_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'snippet_widget.dart' show SnippetWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class SnippetModel extends FlutterFlowModel<SnippetWidget> {
  ///  State fields for stateful widgets in this component.

  AudioPlayer? soundPlayer;
  // Model for Post component.
  late PostModel postModel;
  // Model for threadsComponent component.
  late ThreadsComponentModel threadsComponentModel;

  @override
  void initState(BuildContext context) {
    postModel = createModel(context, () => PostModel());
    threadsComponentModel = createModel(context, () => ThreadsComponentModel());
  }

  @override
  void dispose() {
    postModel.dispose();
    threadsComponentModel.dispose();
  }
}
