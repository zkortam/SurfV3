import '/components/navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_post_widget.dart' show CreatePostWidget;
import 'package:flutter/material.dart';

class CreatePostModel extends FlutterFlowModel<CreatePostWidget> {
  ///  Local state fields for this page.

  List<String> uploadedData = [];
  void addToUploadedData(String item) => uploadedData.add(item);
  void removeFromUploadedData(String item) => uploadedData.remove(item);
  void removeAtIndexFromUploadedData(int index) => uploadedData.removeAt(index);
  void insertAtIndexInUploadedData(int index, String item) =>
      uploadedData.insert(index, item);
  void updateUploadedDataAtIndex(int index, Function(String) updateFn) =>
      uploadedData[index] = updateFn(uploadedData[index]);

  bool isSpoiler = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Caption widget.
  FocusNode? captionFocusNode;
  TextEditingController? captionTextController;
  String? Function(BuildContext, String?)? captionTextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl4 = '';

  bool isDataUploading5 = false;
  FFUploadedFile uploadedLocalFile5 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl5 = '';

  // Model for NavigationBar component.
  late NavigationBarModel navigationBarModel;

  @override
  void initState(BuildContext context) {
    navigationBarModel = createModel(context, () => NavigationBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    captionFocusNode?.dispose();
    captionTextController?.dispose();

    navigationBarModel.dispose();
  }
}
