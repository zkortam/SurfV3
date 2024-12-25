import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "sourcePost" field.
  DocumentReference? _sourcePost;
  DocumentReference? get sourcePost => _sourcePost;
  bool hasSourcePost() => _sourcePost != null;

  // "sourceThread" field.
  DocumentReference? _sourceThread;
  DocumentReference? get sourceThread => _sourceThread;
  bool hasSourceThread() => _sourceThread != null;

  // "sourceComment" field.
  DocumentReference? _sourceComment;
  DocumentReference? get sourceComment => _sourceComment;
  bool hasSourceComment() => _sourceComment != null;

  // "sourceChat" field.
  DocumentReference? _sourceChat;
  DocumentReference? get sourceChat => _sourceChat;
  bool hasSourceChat() => _sourceChat != null;

  // "sourceUser" field.
  DocumentReference? _sourceUser;
  DocumentReference? get sourceUser => _sourceUser;
  bool hasSourceUser() => _sourceUser != null;

  // "targetUser" field.
  DocumentReference? _targetUser;
  DocumentReference? get targetUser => _targetUser;
  bool hasTargetUser() => _targetUser != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "contentType" field.
  String? _contentType;
  String get contentType => _contentType ?? '';
  bool hasContentType() => _contentType != null;

  void _initializeFields() {
    _sourcePost = snapshotData['sourcePost'] as DocumentReference?;
    _sourceThread = snapshotData['sourceThread'] as DocumentReference?;
    _sourceComment = snapshotData['sourceComment'] as DocumentReference?;
    _sourceChat = snapshotData['sourceChat'] as DocumentReference?;
    _sourceUser = snapshotData['sourceUser'] as DocumentReference?;
    _targetUser = snapshotData['targetUser'] as DocumentReference?;
    _time = snapshotData['time'] as DateTime?;
    _type = snapshotData['type'] as String?;
    _contentType = snapshotData['contentType'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  DocumentReference? sourcePost,
  DocumentReference? sourceThread,
  DocumentReference? sourceComment,
  DocumentReference? sourceChat,
  DocumentReference? sourceUser,
  DocumentReference? targetUser,
  DateTime? time,
  String? type,
  String? contentType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sourcePost': sourcePost,
      'sourceThread': sourceThread,
      'sourceComment': sourceComment,
      'sourceChat': sourceChat,
      'sourceUser': sourceUser,
      'targetUser': targetUser,
      'time': time,
      'type': type,
      'contentType': contentType,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.sourcePost == e2?.sourcePost &&
        e1?.sourceThread == e2?.sourceThread &&
        e1?.sourceComment == e2?.sourceComment &&
        e1?.sourceChat == e2?.sourceChat &&
        e1?.sourceUser == e2?.sourceUser &&
        e1?.targetUser == e2?.targetUser &&
        e1?.time == e2?.time &&
        e1?.type == e2?.type &&
        e1?.contentType == e2?.contentType;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.sourcePost,
        e?.sourceThread,
        e?.sourceComment,
        e?.sourceChat,
        e?.sourceUser,
        e?.targetUser,
        e?.time,
        e?.type,
        e?.contentType
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
