import '/flutter_flow/flutter_flow_util.dart';
import 'create_pin_widget.dart' show CreatePinWidget;
import 'package:flutter/material.dart';

class CreatePinModel extends FlutterFlowModel<CreatePinWidget> {
  ///  Local state fields for this page.

  bool biometric = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pinCodeController?.dispose();
  }
}
