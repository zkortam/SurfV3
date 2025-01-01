import '/components/threads_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'single_thread_widget.dart' show SingleThreadWidget;
import 'package:flutter/material.dart';

class SingleThreadModel extends FlutterFlowModel<SingleThreadWidget> {
  ///  State fields for stateful widgets in this page.

  String currentPageLink = '';
  // Model for threadsComponent component.
  late ThreadsComponentModel threadsComponentModel1;

  @override
  void initState(BuildContext context) {
    threadsComponentModel1 =
        createModel(context, () => ThreadsComponentModel());
  }

  @override
  void dispose() {
    threadsComponentModel1.dispose();
  }
}
