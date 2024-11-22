import '/flutter_flow/flutter_flow_util.dart';
import 'user_selection_for_group_widget.dart' show UserSelectionForGroupWidget;
import 'package:flutter/material.dart';

class UserSelectionForGroupModel
    extends FlutterFlowModel<UserSelectionForGroupWidget> {
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
