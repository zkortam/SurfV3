import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'snippet_history_widget.dart' show SnippetHistoryWidget;
import 'package:flutter/material.dart';

class SnippetHistoryModel extends FlutterFlowModel<SnippetHistoryWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  List<SnippetsRecord>? pageViewPreviousSnapshot;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
