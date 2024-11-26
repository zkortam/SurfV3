import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "chats" field.
  List<DocumentReference>? _chats;
  List<DocumentReference> get chats => _chats ?? const [];
  bool hasChats() => _chats != null;

  // "lastTime" field.
  DateTime? _lastTime;
  DateTime? get lastTime => _lastTime;
  bool hasLastTime() => _lastTime != null;

  // "lastMessage" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "userChatData" field.
  List<UserMessageDataStruct>? _userChatData;
  List<UserMessageDataStruct> get userChatData => _userChatData ?? const [];
  bool hasUserChatData() => _userChatData != null;

  void _initializeFields() {
    _users = getDataList(snapshotData['users']);
    _image = snapshotData['image'] as String?;
    _title = snapshotData['title'] as String?;
    _chats = getDataList(snapshotData['chats']);
    _lastTime = snapshotData['lastTime'] as DateTime?;
    _lastMessage = snapshotData['lastMessage'] as String?;
    _userChatData = getStructList(
      snapshotData['userChatData'],
      UserMessageDataStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? image,
  String? title,
  DateTime? lastTime,
  String? lastMessage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'title': title,
      'lastTime': lastTime,
      'lastMessage': lastMessage,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.users, e2?.users) &&
        e1?.image == e2?.image &&
        e1?.title == e2?.title &&
        listEquality.equals(e1?.chats, e2?.chats) &&
        e1?.lastTime == e2?.lastTime &&
        e1?.lastMessage == e2?.lastMessage &&
        listEquality.equals(e1?.userChatData, e2?.userChatData);
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.users,
        e?.image,
        e?.title,
        e?.chats,
        e?.lastTime,
        e?.lastMessage,
        e?.userChatData
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
