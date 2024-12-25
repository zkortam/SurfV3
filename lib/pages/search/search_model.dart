import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_widget.dart' show SearchWidget;
import 'package:flutter/material.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for CaptionSnippet widget.
  FocusNode? captionSnippetFocusNode1;
  TextEditingController? captionSnippetTextController1;
  String? Function(BuildContext, String?)?
      captionSnippetTextController1Validator;
  // Algolia Search Results from action on CaptionSnippet
  List<PostsRecord>? algoliaSearchResults1 = [];
  // State field(s) for CaptionSnippet widget.
  FocusNode? captionSnippetFocusNode2;
  TextEditingController? captionSnippetTextController2;
  String? Function(BuildContext, String?)?
      captionSnippetTextController2Validator;
  // Algolia Search Results from action on CaptionSnippet
  List<ThreadsRecord>? algoliaSearchResults2 = [];
  // State field(s) for CaptionSnippet widget.
  FocusNode? captionSnippetFocusNode3;
  TextEditingController? captionSnippetTextController3;
  String? Function(BuildContext, String?)?
      captionSnippetTextController3Validator;
  // Algolia Search Results from action on CaptionSnippet
  List<UsersRecord>? algoliaSearchResults3 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    captionSnippetFocusNode1?.dispose();
    captionSnippetTextController1?.dispose();

    captionSnippetFocusNode2?.dispose();
    captionSnippetTextController2?.dispose();

    captionSnippetFocusNode3?.dispose();
    captionSnippetTextController3?.dispose();
  }
}
