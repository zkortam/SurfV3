import '/backend/api_requests/api_calls.dart';
import '/components/navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  int postindex = 0;

  List<DocumentReference> postrefs = [];
  void addToPostrefs(DocumentReference item) => postrefs.add(item);
  void removeFromPostrefs(DocumentReference item) => postrefs.remove(item);
  void removeAtIndexFromPostrefs(int index) => postrefs.removeAt(index);
  void insertAtIndexInPostrefs(int index, DocumentReference item) =>
      postrefs.insert(index, item);
  void updatePostrefsAtIndex(int index, Function(DocumentReference) updateFn) =>
      postrefs[index] = updateFn(postrefs[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getrecommendations)] action in HomePage widget.
  ApiCallResponse? aPIresult;
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Model for NavigationBar component.
  late NavigationBarModel navigationBarModel;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
    navigationBarModel = createModel(context, () => NavigationBarModel());
  }

  @override
  void dispose() {
    navigationBarModel.dispose();
  }
}
