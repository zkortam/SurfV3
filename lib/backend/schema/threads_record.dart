import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThreadsRecord extends FirestoreRecord {
  ThreadsRecord._(
    super.reference,
    super.data,
  ) {
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

  // "views" field.
  int? _views;
  int get views => _views ?? 0;
  bool hasViews() => _views != null;

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
    _poll = snapshotData['Poll'] is PollStruct
        ? snapshotData['Poll']
        : PollStruct.maybeFromMap(snapshotData['Poll']);
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
    _views = castToType<int>(snapshotData['views']);
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

  static ThreadsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ThreadsRecord.getDocumentFromData(
        {
          'TimeStamp': convertAlgoliaParam(
            snapshot.data['TimeStamp'],
            ParamType.DateTime,
            false,
          ),
          'Author': convertAlgoliaParam(
            snapshot.data['Author'],
            ParamType.DocumentReference,
            false,
          ),
          'Title': snapshot.data['Title'],
          'Text': snapshot.data['Text'],
          'Votes': safeGet(
            () => (snapshot.data['Votes'] as Iterable)
                .map((d) => VotersStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'Hashtags': safeGet(
            () => snapshot.data['Hashtags'].toList(),
          ),
          'Poll':
              PollStruct.fromAlgoliaData(snapshot.data['Poll'] ?? {}).toMap(),
          'Audio': snapshot.data['Audio'],
          'Space': snapshot.data['Space'],
          'isStealth': snapshot.data['isStealth'],
          'isPrivate': snapshot.data['isPrivate'],
          'isCommentsAllowed': snapshot.data['isCommentsAllowed'],
          'summary': snapshot.data['summary'],
          'Link': snapshot.data['Link'],
          'comments': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['comments'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'isArticle': snapshot.data['isArticle'],
          'image': snapshot.data['image'],
          'views': convertAlgoliaParam(
            snapshot.data['views'],
            ParamType.int,
            false,
          ),
        },
        ThreadsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ThreadsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'Threads',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

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
  int? views,
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
      'views': views,
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
        e1?.image == e2?.image &&
        e1?.views == e2?.views;
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
        e?.image,
        e?.views
      ]);

  @override
  bool isValidKey(Object? o) => o is ThreadsRecord;
}
