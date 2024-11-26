import '/backend/backend.dart';
import '/components/navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  int postindex = 0;

  List<PostsRecord> postlist = [];
  void addToPostlist(PostsRecord item) => postlist.add(item);
  void removeFromPostlist(PostsRecord item) => postlist.remove(item);
  void removeAtIndexFromPostlist(int index) => postlist.removeAt(index);
  void insertAtIndexInPostlist(int index, PostsRecord item) =>
      postlist.insert(index, item);
  void updatePostlistAtIndex(int index, Function(PostsRecord) updateFn) =>
      postlist[index] = updateFn(postlist[index]);

  PostsRecord? currentpost;

  ///  State fields for stateful widgets in this page.

  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, PostsRecord>? listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // Model for NavigationBar component.
  late NavigationBarModel navigationBarModel;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
    navigationBarModel = createModel(context, () => NavigationBarModel());
  }

  @override
  void dispose() {
    for (var s in listViewStreamSubscriptions) {
      s?.cancel();
    }
    listViewPagingController?.dispose();

    navigationBarModel.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, PostsRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, PostsRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, PostsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryPostsRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 15,
          isStream: true,
        ),
      );
  }
}
