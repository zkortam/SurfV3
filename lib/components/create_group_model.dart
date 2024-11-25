import '/flutter_flow/flutter_flow_util.dart';
import 'create_group_widget.dart' show CreateGroupWidget;
import 'package:flutter/material.dart';

class CreateGroupModel extends FlutterFlowModel<CreateGroupWidget> {
  ///  Local state fields for this component.

  Color color = const Color(0xff4b39ef);

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
