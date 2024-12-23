import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_post_widget.dart' show CreatePostWidget;
import 'package:flutter/material.dart';

class CreatePostModel extends FlutterFlowModel<CreatePostWidget> {
  ///  Local state fields for this page.

  bool isSpoiler = false;

  bool isShort = false;

  bool isStealth = false;

  List<String> media = [];
  void addToMedia(String item) => media.add(item);
  void removeFromMedia(String item) => media.remove(item);
  void removeAtIndexFromMedia(int index) => media.removeAt(index);
  void insertAtIndexInMedia(int index, String item) =>
      media.insert(index, item);
  void updateMediaAtIndex(int index, Function(String) updateFn) =>
      media[index] = updateFn(media[index]);

  List<String> voteOptions = [];
  void addToVoteOptions(String item) => voteOptions.add(item);
  void removeFromVoteOptions(String item) => voteOptions.remove(item);
  void removeAtIndexFromVoteOptions(int index) => voteOptions.removeAt(index);
  void insertAtIndexInVoteOptions(int index, String item) =>
      voteOptions.insert(index, item);
  void updateVoteOptionsAtIndex(int index, Function(String) updateFn) =>
      voteOptions[index] = updateFn(voteOptions[index]);

  int addMoreValue = 0;

  bool isPoll = false;

  DocumentReference? space;

  bool isBeautifiedState = false;

  String group = '';

  bool isArticle = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for ViewMedia widget.
  PageController? viewMediaController;

  int get viewMediaCurrentIndex => viewMediaController != null &&
          viewMediaController!.hasClients &&
          viewMediaController!.page != null
      ? viewMediaController!.page!.round()
      : 0;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // Stores action output result for [Gemini - Generate Text] action in Tab widget.
  String? textPrompt;
  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl4 = '';

  // Stores action output result for [Gemini - Generate Text] action in IconButton widget.
  String? beautifiedText;
  // Stores action output result for [Bottom Sheet - BeautifyText] action in IconButton widget.
  bool? isBeautified;
  // Stores action output result for [Bottom Sheet - SpaceSelector] action in IconButton widget.
  SpacesRecord? selectedSpace;
  // Stores action output result for [Gemini - Generate Text] action in CaptionSet widget.
  String? autoBeautifiedText;
  // Stores action output result for [Gemini - Generate Text] action in CaptionSet widget.
  String? summarizedText;
  bool isDataUploading5 = false;
  FFUploadedFile uploadedLocalFile5 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl5 = '';

  // State field(s) for TitleThreads widget.
  FocusNode? titleThreadsFocusNode;
  TextEditingController? titleThreadsTextController;
  String? Function(BuildContext, String?)? titleThreadsTextControllerValidator;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for TextThread widget.
  FocusNode? textThreadFocusNode;
  TextEditingController? textThreadTextController;
  String? Function(BuildContext, String?)? textThreadTextControllerValidator;
  // State field(s) for Title widget.
  FocusNode? titleFocusNode1;
  TextEditingController? titleTextController1;
  String? Function(BuildContext, String?)? titleTextController1Validator;
  // State field(s) for Title widget.
  FocusNode? titleFocusNode2;
  TextEditingController? titleTextController2;
  String? Function(BuildContext, String?)? titleTextController2Validator;
  // State field(s) for option3 widget.
  FocusNode? option3FocusNode;
  TextEditingController? option3TextController;
  String? Function(BuildContext, String?)? option3TextControllerValidator;
  // State field(s) for option4 widget.
  FocusNode? option4FocusNode;
  TextEditingController? option4TextController;
  String? Function(BuildContext, String?)? option4TextControllerValidator;
  // State field(s) for CaptionSnippet widget.
  FocusNode? captionSnippetFocusNode;
  TextEditingController? captionSnippetTextController;
  String? Function(BuildContext, String?)?
      captionSnippetTextControllerValidator;
  bool isDataUploading6 = false;
  FFUploadedFile uploadedLocalFile6 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl6 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    titleThreadsFocusNode?.dispose();
    titleThreadsTextController?.dispose();

    textThreadFocusNode?.dispose();
    textThreadTextController?.dispose();

    titleFocusNode1?.dispose();
    titleTextController1?.dispose();

    titleFocusNode2?.dispose();
    titleTextController2?.dispose();

    option3FocusNode?.dispose();
    option3TextController?.dispose();

    option4FocusNode?.dispose();
    option4TextController?.dispose();

    captionSnippetFocusNode?.dispose();
    captionSnippetTextController?.dispose();
  }
}
