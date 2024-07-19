import '/flutter_flow/flutter_flow_util.dart';
import 'date_of_birth_widget.dart' show DateOfBirthWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateOfBirthModel extends FlutterFlowModel<DateOfBirthWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
