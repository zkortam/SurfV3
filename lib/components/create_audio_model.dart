import '/flutter_flow/flutter_flow_util.dart';
import 'create_audio_widget.dart' show CreateAudioWidget;
import 'package:flutter/material.dart';

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
