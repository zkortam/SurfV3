import '/flutter_flow/flutter_flow_util.dart';
import 'threads_comp_edit_widget.dart' show ThreadsCompEditWidget;
import 'package:flutter/material.dart';

class ThreadsCompEditModel extends FlutterFlowModel<ThreadsCompEditWidget> {
  ///  State fields for stateful widgets in this component.

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
