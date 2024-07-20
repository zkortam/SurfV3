import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "TimePosted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "Caption" field.
  String? _caption;
  String get caption => _caption ?? '';
  bool hasCaption() => _caption != null;

  // "Author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "Voters" field.
  List<VotersStruct>? _voters;
  List<VotersStruct> get voters => _voters ?? const [];
  bool hasVoters() => _voters != null;

  // "SpoilerClickers" field.
  List<DocumentReference>? _spoilerClickers;
  List<DocumentReference> get spoilerClickers => _spoilerClickers ?? const [];
  bool hasSpoilerClickers() => _spoilerClickers != null;

  // "Comments" field.
  List<DocumentReference>? _comments;
  List<DocumentReference> get comments => _comments ?? const [];
  bool hasComments() => _comments != null;

  // "isShort" field.
  bool? _isShort;
  bool get isShort => _isShort ?? false;
  bool hasIsShort() => _isShort != null;

  // "isExpanded" field.
  bool? _isExpanded;
  bool get isExpanded => _isExpanded ?? false;
  bool hasIsExpanded() => _isExpanded != null;

  // "isSpoiler" field.
  bool? _isSpoiler;
  bool get isSpoiler => _isSpoiler ?? false;
  bool hasIsSpoiler() => _isSpoiler != null;

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

  // "Videos" field.
  List<String>? _videos;
  List<String> get videos => _videos ?? const [];
  bool hasVideos() => _videos != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  void _initializeFields() {
    _timePosted = snapshotData['TimePosted'] as DateTime?;
    _caption = snapshotData['Caption'] as String?;
    _author = snapshotData['Author'] as DocumentReference?;
    _voters = getStructList(
      snapshotData['Voters'],
      VotersStruct.fromMap,
    );
    _spoilerClickers = getDataList(snapshotData['SpoilerClickers']);
    _comments = getDataList(snapshotData['Comments']);
    _isShort = snapshotData['isShort'] as bool?;
    _isExpanded = snapshotData['isExpanded'] as bool?;
    _isSpoiler = snapshotData['isSpoiler'] as bool?;
    _isStealth = snapshotData['isStealth'] as bool?;
    _isPrivate = snapshotData['isPrivate'] as bool?;
    _isCommentsAllowed = snapshotData['isCommentsAllowed'] as bool?;
    _videos = getDataList(snapshotData['Videos']);
    _images = getDataList(snapshotData['images']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  DateTime? timePosted,
  String? caption,
  DocumentReference? author,
  bool? isShort,
  bool? isExpanded,
  bool? isSpoiler,
  bool? isStealth,
  bool? isPrivate,
  bool? isCommentsAllowed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'TimePosted': timePosted,
      'Caption': caption,
      'Author': author,
      'isShort': isShort,
      'isExpanded': isExpanded,
      'isSpoiler': isSpoiler,
      'isStealth': isStealth,
      'isPrivate': isPrivate,
      'isCommentsAllowed': isCommentsAllowed,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.timePosted == e2?.timePosted &&
        e1?.caption == e2?.caption &&
        e1?.author == e2?.author &&
        listEquality.equals(e1?.voters, e2?.voters) &&
        listEquality.equals(e1?.spoilerClickers, e2?.spoilerClickers) &&
        listEquality.equals(e1?.comments, e2?.comments) &&
        e1?.isShort == e2?.isShort &&
        e1?.isExpanded == e2?.isExpanded &&
        e1?.isSpoiler == e2?.isSpoiler &&
        e1?.isStealth == e2?.isStealth &&
        e1?.isPrivate == e2?.isPrivate &&
        e1?.isCommentsAllowed == e2?.isCommentsAllowed &&
        listEquality.equals(e1?.videos, e2?.videos) &&
        listEquality.equals(e1?.images, e2?.images);
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.timePosted,
        e?.caption,
        e?.author,
        e?.voters,
        e?.spoilerClickers,
        e?.comments,
        e?.isShort,
        e?.isExpanded,
        e?.isSpoiler,
        e?.isStealth,
        e?.isPrivate,
        e?.isCommentsAllowed,
        e?.videos,
        e?.images
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
