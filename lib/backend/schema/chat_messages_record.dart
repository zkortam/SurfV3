import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMessagesRecord extends FirestoreRecord {
  ChatMessagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "authorID" field.
  DocumentReference? _authorID;
  DocumentReference? get authorID => _authorID;
  bool hasAuthorID() => _authorID != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "file" field.
  String? _file;
  String get file => _file ?? '';
  bool hasFile() => _file != null;

  // "post" field.
  DocumentReference? _post;
  DocumentReference? get post => _post;
  bool hasPost() => _post != null;

  // "thread" field.
  DocumentReference? _thread;
  DocumentReference? get thread => _thread;
  bool hasThread() => _thread != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _text = snapshotData['text'] as String?;
    _timeStamp = snapshotData['timeStamp'] as DateTime?;
    _authorID = snapshotData['authorID'] as DocumentReference?;
    _image = snapshotData['image'] as String?;
    _audio = snapshotData['audio'] as String?;
    _file = snapshotData['file'] as String?;
    _post = snapshotData['post'] as DocumentReference?;
    _thread = snapshotData['thread'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chat_messages')
          : FirebaseFirestore.instance.collectionGroup('chat_messages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('chat_messages').doc(id);

  static Stream<ChatMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatMessagesRecord.fromSnapshot(s));

  static Future<ChatMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatMessagesRecord.fromSnapshot(s));

  static ChatMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatMessagesRecordData({
  String? text,
  DateTime? timeStamp,
  DocumentReference? authorID,
  String? image,
  String? audio,
  String? file,
  DocumentReference? post,
  DocumentReference? thread,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': text,
      'timeStamp': timeStamp,
      'authorID': authorID,
      'image': image,
      'audio': audio,
      'file': file,
      'post': post,
      'thread': thread,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatMessagesRecordDocumentEquality
    implements Equality<ChatMessagesRecord> {
  const ChatMessagesRecordDocumentEquality();

  @override
  bool equals(ChatMessagesRecord? e1, ChatMessagesRecord? e2) {
    return e1?.text == e2?.text &&
        e1?.timeStamp == e2?.timeStamp &&
        e1?.authorID == e2?.authorID &&
        e1?.image == e2?.image &&
        e1?.audio == e2?.audio &&
        e1?.file == e2?.file &&
        e1?.post == e2?.post &&
        e1?.thread == e2?.thread;
  }

  @override
  int hash(ChatMessagesRecord? e) => const ListEquality().hash([
        e?.text,
        e?.timeStamp,
        e?.authorID,
        e?.image,
        e?.audio,
        e?.file,
        e?.post,
        e?.thread
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatMessagesRecord;
}
