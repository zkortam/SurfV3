import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_selection_for_chat_widget.dart' show UserSelectionForChatWidget;
import 'package:flutter/material.dart';

class UserSelectionForChatModel
    extends FlutterFlowModel<UserSelectionForChatWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> selectedUsers = [];
  void addToSelectedUsers(DocumentReference item) => selectedUsers.add(item);
  void removeFromSelectedUsers(DocumentReference item) =>
      selectedUsers.remove(item);
  void removeAtIndexFromSelectedUsers(int index) =>
      selectedUsers.removeAt(index);
  void insertAtIndexInSelectedUsers(int index, DocumentReference item) =>
      selectedUsers.insert(index, item);
  void updateSelectedUsersAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      selectedUsers[index] = updateFn(selectedUsers[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<ChatsRecord>? out;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatsRecord? output;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
