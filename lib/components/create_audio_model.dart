import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import 'create_audio_widget.dart' show CreateAudioWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateAudioModel extends FlutterFlowModel<CreateAudioWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for TextThread widget.
  FocusNode? textThreadFocusNode1;
  TextEditingController? textThreadTextController1;
  String? Function(BuildContext, String?)? textThreadTextController1Validator;
  // State field(s) for TextThread widget.
  FocusNode? textThreadFocusNode2;
  TextEditingController? textThreadTextController2;
  String? Function(BuildContext, String?)? textThreadTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textThreadFocusNode1?.dispose();
    textThreadTextController1?.dispose();

    textThreadFocusNode2?.dispose();
    textThreadTextController2?.dispose();
  }
}
