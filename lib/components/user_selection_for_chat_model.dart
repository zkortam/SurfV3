import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/create_group_chat_widget.dart';
import '/components/error_bar_widget.dart';
import '/components/info_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'user_selection_for_chat_widget.dart' show UserSelectionForChatWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
