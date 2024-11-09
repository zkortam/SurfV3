import '/flutter_flow/flutter_flow_util.dart';
import 'space_rules_widget.dart' show SpaceRulesWidget;
import 'package:flutter/material.dart';

class SpaceRulesModel extends FlutterFlowModel<SpaceRulesWidget> {
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
