import '/backend/backend.dart';
import '/components/post_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_posts_widget.dart' show ProfilePostsWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProfilePostsModel extends FlutterFlowModel<ProfilePostsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ListView1 widget.
  ScrollController? listView1;
  // State field(s) for singlePostList widget.
  ScrollController? singlePostList;
  // Model for Post component.
  late PostModel postModel2;
  // State field(s) for ListView2 widget.
  ScrollController? listView20;

  PagingController<DocumentSnapshot?, PostsRecord>? listView2PagingController;
  Query? listView2PagingQuery;
  List<StreamSubscription?> listView2StreamSubscriptions = [];

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    listView1 = ScrollController();
    singlePostList = ScrollController();
    postModel2 = createModel(context, () => PostModel());
    listView20 = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    listView1?.dispose();
    singlePostList?.dispose();
    postModel2.dispose();
    listView20?.dispose();
    for (var s in listView2StreamSubscriptions) {
      s?.cancel();
    }
    listView2PagingController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, PostsRecord> setListView2Controller(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listView2PagingController ??= _createListView2Controller(query, parent);
    if (listView2PagingQuery != query) {
      listView2PagingQuery = query;
      listView2PagingController?.refresh();
    }
    return listView2PagingController!;
  }

  PagingController<DocumentSnapshot?, PostsRecord> _createListView2Controller(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, PostsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryPostsRecordPage(
          queryBuilder: (_) => listView2PagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listView2StreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
