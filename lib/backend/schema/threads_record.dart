import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThreadsRecord extends FirestoreRecord {
  ThreadsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "TimeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "Author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "Text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "Votes" field.
  List<VotersStruct>? _votes;
  List<VotersStruct> get votes => _votes ?? const [];
  bool hasVotes() => _votes != null;

  // "Hashtags" field.
  List<String>? _hashtags;
  List<String> get hashtags => _hashtags ?? const [];
  bool hasHashtags() => _hashtags != null;

  // "Poll" field.
  PollStruct? _poll;
  PollStruct get poll => _poll ?? PollStruct();
  bool hasPoll() => _poll != null;

  // "Audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "Space" field.
  String? _space;
  String get space => _space ?? '';
  bool hasSpace() => _space != null;

  // "isStealth" field.
  bool? _isStealth;
  bool get isStealth => _isStealth ?? false;
  bool hasIsStealth() => _isStealth != null;

  // "isPrivate" field.
  bool? _isPrivate;
  bool get isPrivate => _isPrivate ?? false;
  bool hasIsPrivate() => _isPrivate != null;

  // "isCommentsAllowed" field.
  bool? _isCommentsAllowed;
  bool get isCommentsAllowed => _isCommentsAllowed ?? false;
  bool hasIsCommentsAllowed() => _isCommentsAllowed != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  // "Link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "comments" field.
  List<DocumentReference>? _comments;
  List<DocumentReference> get comments => _comments ?? const [];
  bool hasComments() => _comments != null;

  // "isArticle" field.
  bool? _isArticle;
  bool get isArticle => _isArticle ?? false;
  bool hasIsArticle() => _isArticle != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _timeStamp = snapshotData['TimeStamp'] as DateTime?;
    _author = snapshotData['Author'] as DocumentReference?;
    _title = snapshotData['Title'] as String?;
    _text = snapshotData['Text'] as String?;
    _votes = getStructList(
      snapshotData['Votes'],
      VotersStruct.fromMap,
    );
    _hashtags = getDataList(snapshotData['Hashtags']);
    _poll = PollStruct.maybeFromMap(snapshotData['Poll']);
    _audio = snapshotData['Audio'] as String?;
    _space = snapshotData['Space'] as String?;
    _isStealth = snapshotData['isStealth'] as bool?;
    _isPrivate = snapshotData['isPrivate'] as bool?;
    _isCommentsAllowed = snapshotData['isCommentsAllowed'] as bool?;
    _summary = snapshotData['summary'] as String?;
    _link = snapshotData['Link'] as String?;
    _comments = getDataList(snapshotData['comments']);
    _isArticle = snapshotData['isArticle'] as bool?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Threads');

  static Stream<ThreadsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ThreadsRecord.fromSnapshot(s));

  static Future<ThreadsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ThreadsRecord.fromSnapshot(s));

  static ThreadsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ThreadsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ThreadsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ThreadsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ThreadsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ThreadsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createThreadsRecordData({
  DateTime? timeStamp,
  DocumentReference? author,
  String? title,
  String? text,
  PollStruct? poll,
  String? audio,
  String? space,
  bool? isStealth,
  bool? isPrivate,
  bool? isCommentsAllowed,
  String? summary,
  String? link,
  bool? isArticle,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'TimeStamp': timeStamp,
      'Author': author,
      'Title': title,
      'Text': text,
      'Poll': PollStruct().toMap(),
      'Audio': audio,
      'Space': space,
      'isStealth': isStealth,
      'isPrivate': isPrivate,
      'isCommentsAllowed': isCommentsAllowed,
      'summary': summary,
      'Link': link,
      'isArticle': isArticle,
      'image': image,
    }.withoutNulls,
  );

  // Handle nested data for "Poll" field.
  addPollStructData(firestoreData, poll, 'Poll');

  return firestoreData;
}

class ThreadsRecordDocumentEquality implements Equality<ThreadsRecord> {
  const ThreadsRecordDocumentEquality();

  @override
  bool equals(ThreadsRecord? e1, ThreadsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.timeStamp == e2?.timeStamp &&
        e1?.author == e2?.author &&
        e1?.title == e2?.title &&
        e1?.text == e2?.text &&
        listEquality.equals(e1?.votes, e2?.votes) &&
        listEquality.equals(e1?.hashtags, e2?.hashtags) &&
        e1?.poll == e2?.poll &&
        e1?.audio == e2?.audio &&
        e1?.space == e2?.space &&
        e1?.isStealth == e2?.isStealth &&
        e1?.isPrivate == e2?.isPrivate &&
        e1?.isCommentsAllowed == e2?.isCommentsAllowed &&
        e1?.summary == e2?.summary &&
        e1?.link == e2?.link &&
        listEquality.equals(e1?.comments, e2?.comments) &&
        e1?.isArticle == e2?.isArticle &&
        e1?.image == e2?.image;
  }

  @override
  int hash(ThreadsRecord? e) => const ListEquality().hash([
        e?.timeStamp,
        e?.author,
        e?.title,
        e?.text,
        e?.votes,
        e?.hashtags,
        e?.poll,
        e?.audio,
        e?.space,
        e?.isStealth,
        e?.isPrivate,
        e?.isCommentsAllowed,
        e?.summary,
        e?.link,
        e?.comments,
        e?.isArticle,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is ThreadsRecord;
}
