import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "TimeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "PostReference" field.
  DocumentReference? _postReference;
  DocumentReference? get postReference => _postReference;
  bool hasPostReference() => _postReference != null;

  // "ThreadReference" field.
  DocumentReference? _threadReference;
  DocumentReference? get threadReference => _threadReference;
  bool hasThreadReference() => _threadReference != null;

  // "Author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "Votes" field.
  List<VotersStruct>? _votes;
  List<VotersStruct> get votes => _votes ?? const [];
  bool hasVotes() => _votes != null;

  // "isStealth" field.
  bool? _isStealth;
  bool get isStealth => _isStealth ?? false;
  bool hasIsStealth() => _isStealth != null;

  void _initializeFields() {
    _timeStamp = snapshotData['TimeStamp'] as DateTime?;
    _postReference = snapshotData['PostReference'] as DocumentReference?;
    _threadReference = snapshotData['ThreadReference'] as DocumentReference?;
    _author = snapshotData['Author'] as DocumentReference?;
    _text = snapshotData['text'] as String?;
    _image = snapshotData['image'] as String?;
    _votes = getStructList(
      snapshotData['Votes'],
      VotersStruct.fromMap,
    );
    _isStealth = snapshotData['isStealth'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Comments');

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  static CommentsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      CommentsRecord.getDocumentFromData(
        {
          'TimeStamp': convertAlgoliaParam(
            snapshot.data['TimeStamp'],
            ParamType.DateTime,
            false,
          ),
          'PostReference': convertAlgoliaParam(
            snapshot.data['PostReference'],
            ParamType.DocumentReference,
            false,
          ),
          'ThreadReference': convertAlgoliaParam(
            snapshot.data['ThreadReference'],
            ParamType.DocumentReference,
            false,
          ),
          'Author': convertAlgoliaParam(
            snapshot.data['Author'],
            ParamType.DocumentReference,
            false,
          ),
          'text': snapshot.data['text'],
          'image': snapshot.data['image'],
          'Votes': safeGet(
            () => (snapshot.data['Votes'] as Iterable)
                .map((d) => VotersStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'isStealth': snapshot.data['isStealth'],
        },
        CommentsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CommentsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'Comments',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  DateTime? timeStamp,
  DocumentReference? postReference,
  DocumentReference? threadReference,
  DocumentReference? author,
  String? text,
  String? image,
  bool? isStealth,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'TimeStamp': timeStamp,
      'PostReference': postReference,
      'ThreadReference': threadReference,
      'Author': author,
      'text': text,
      'image': image,
      'isStealth': isStealth,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.timeStamp == e2?.timeStamp &&
        e1?.postReference == e2?.postReference &&
        e1?.threadReference == e2?.threadReference &&
        e1?.author == e2?.author &&
        e1?.text == e2?.text &&
        e1?.image == e2?.image &&
        listEquality.equals(e1?.votes, e2?.votes) &&
        e1?.isStealth == e2?.isStealth;
  }

  @override
  int hash(CommentsRecord? e) => const ListEquality().hash([
        e?.timeStamp,
        e?.postReference,
        e?.threadReference,
        e?.author,
        e?.text,
        e?.image,
        e?.votes,
        e?.isStealth
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}
