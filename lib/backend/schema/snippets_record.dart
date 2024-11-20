import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SnippetsRecord extends FirestoreRecord {
  SnippetsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "timePosted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "caption" field.
  String? _caption;
  String get caption => _caption ?? '';
  bool hasCaption() => _caption != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "timeCloses" field.
  DateTime? _timeCloses;
  DateTime? get timeCloses => _timeCloses;
  bool hasTimeCloses() => _timeCloses != null;

  // "postShortReference" field.
  DocumentReference? _postShortReference;
  DocumentReference? get postShortReference => _postShortReference;
  bool hasPostShortReference() => _postShortReference != null;

  // "threadsReference" field.
  DocumentReference? _threadsReference;
  DocumentReference? get threadsReference => _threadsReference;
  bool hasThreadsReference() => _threadsReference != null;

  // "validPeople" field.
  List<DocumentReference>? _validPeople;
  List<DocumentReference> get validPeople => _validPeople ?? const [];
  bool hasValidPeople() => _validPeople != null;

  // "isOnlyForGroup" field.
  bool? _isOnlyForGroup;
  bool get isOnlyForGroup => _isOnlyForGroup ?? false;
  bool hasIsOnlyForGroup() => _isOnlyForGroup != null;

  void _initializeFields() {
    _timePosted = snapshotData['timePosted'] as DateTime?;
    _author = snapshotData['author'] as DocumentReference?;
    _caption = snapshotData['caption'] as String?;
    _image = snapshotData['image'] as String?;
    _video = snapshotData['video'] as String?;
    _timeCloses = snapshotData['timeCloses'] as DateTime?;
    _postShortReference =
        snapshotData['postShortReference'] as DocumentReference?;
    _threadsReference = snapshotData['threadsReference'] as DocumentReference?;
    _validPeople = getDataList(snapshotData['validPeople']);
    _isOnlyForGroup = snapshotData['isOnlyForGroup'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Snippets');

  static Stream<SnippetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SnippetsRecord.fromSnapshot(s));

  static Future<SnippetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SnippetsRecord.fromSnapshot(s));

  static SnippetsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SnippetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SnippetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SnippetsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SnippetsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SnippetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSnippetsRecordData({
  DateTime? timePosted,
  DocumentReference? author,
  String? caption,
  String? image,
  String? video,
  DateTime? timeCloses,
  DocumentReference? postShortReference,
  DocumentReference? threadsReference,
  bool? isOnlyForGroup,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timePosted': timePosted,
      'author': author,
      'caption': caption,
      'image': image,
      'video': video,
      'timeCloses': timeCloses,
      'postShortReference': postShortReference,
      'threadsReference': threadsReference,
      'isOnlyForGroup': isOnlyForGroup,
    }.withoutNulls,
  );

  return firestoreData;
}

class SnippetsRecordDocumentEquality implements Equality<SnippetsRecord> {
  const SnippetsRecordDocumentEquality();

  @override
  bool equals(SnippetsRecord? e1, SnippetsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.timePosted == e2?.timePosted &&
        e1?.author == e2?.author &&
        e1?.caption == e2?.caption &&
        e1?.image == e2?.image &&
        e1?.video == e2?.video &&
        e1?.timeCloses == e2?.timeCloses &&
        e1?.postShortReference == e2?.postShortReference &&
        e1?.threadsReference == e2?.threadsReference &&
        listEquality.equals(e1?.validPeople, e2?.validPeople) &&
        e1?.isOnlyForGroup == e2?.isOnlyForGroup;
  }

  @override
  int hash(SnippetsRecord? e) => const ListEquality().hash([
        e?.timePosted,
        e?.author,
        e?.caption,
        e?.image,
        e?.video,
        e?.timeCloses,
        e?.postShortReference,
        e?.threadsReference,
        e?.validPeople,
        e?.isOnlyForGroup
      ]);

  @override
  bool isValidKey(Object? o) => o is SnippetsRecord;
}
