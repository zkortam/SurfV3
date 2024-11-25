import '/backend/backend.dart';
import '/components/create_audio_widget.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'music_selector_widget.dart' show MusicSelectorWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MusicSelectorModel extends FlutterFlowModel<MusicSelectorWidget> {
  ///  Local state fields for this component.

  MusicRecord? selectedAudio;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
