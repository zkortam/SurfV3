import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
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

  // "hashtags" field.
  List<String>? _hashtags;
  List<String> get hashtags => _hashtags ?? const [];
  bool hasHashtags() => _hashtags != null;

  // "post_id" field.
  String? _postId;
  String get postId => _postId ?? '';
  bool hasPostId() => _postId != null;

  // "comments" field.
  List<DocumentReference>? _comments;
  List<DocumentReference> get comments => _comments ?? const [];
  bool hasComments() => _comments != null;

  // "media" field.
  List<String>? _media;
  List<String> get media => _media ?? const [];
  bool hasMedia() => _media != null;

  // "ShortVideo" field.
  String? _shortVideo;
  String get shortVideo => _shortVideo ?? '';
  bool hasShortVideo() => _shortVideo != null;

  // "caption_embedding" field.
  List<double>? _captionEmbedding;
  List<double> get captionEmbedding => _captionEmbedding ?? const [];
  bool hasCaptionEmbedding() => _captionEmbedding != null;

  // "image_embedding" field.
  List<double>? _imageEmbedding;
  List<double> get imageEmbedding => _imageEmbedding ?? const [];
  bool hasImageEmbedding() => _imageEmbedding != null;

  // "informative_value" field.
  double? _informativeValue;
  double get informativeValue => _informativeValue ?? 0.0;
  bool hasInformativeValue() => _informativeValue != null;

  // "political_value" field.
  double? _politicalValue;
  double get politicalValue => _politicalValue ?? 0.0;
  bool hasPoliticalValue() => _politicalValue != null;

  // "toxic_value" field.
  double? _toxicValue;
  double get toxicValue => _toxicValue ?? 0.0;
  bool hasToxicValue() => _toxicValue != null;

  // "vulgar_value" field.
  double? _vulgarValue;
  double get vulgarValue => _vulgarValue ?? 0.0;
  bool hasVulgarValue() => _vulgarValue != null;

  // "shortDuration" field.
  double? _shortDuration;
  double get shortDuration => _shortDuration ?? 0.0;
  bool hasShortDuration() => _shortDuration != null;

  // "views" field.
  int? _views;
  int get views => _views ?? 0;
  bool hasViews() => _views != null;

  void _initializeFields() {
    _timePosted = snapshotData['TimePosted'] as DateTime?;
    _caption = snapshotData['Caption'] as String?;
    _author = snapshotData['Author'] as DocumentReference?;
    _voters = getStructList(
      snapshotData['Voters'],
      VotersStruct.fromMap,
    );
    _spoilerClickers = getDataList(snapshotData['SpoilerClickers']);
    _isShort = snapshotData['isShort'] as bool?;
    _isExpanded = snapshotData['isExpanded'] as bool?;
    _isSpoiler = snapshotData['isSpoiler'] as bool?;
    _isStealth = snapshotData['isStealth'] as bool?;
    _isPrivate = snapshotData['isPrivate'] as bool?;
    _isCommentsAllowed = snapshotData['isCommentsAllowed'] as bool?;
    _hashtags = getDataList(snapshotData['hashtags']);
    _postId = snapshotData['post_id'] as String?;
    _comments = getDataList(snapshotData['comments']);
    _media = getDataList(snapshotData['media']);
    _shortVideo = snapshotData['ShortVideo'] as String?;
    _captionEmbedding = getDataList(snapshotData['caption_embedding']);
    _imageEmbedding = getDataList(snapshotData['image_embedding']);
    _informativeValue = castToType<double>(snapshotData['informative_value']);
    _politicalValue = castToType<double>(snapshotData['political_value']);
    _toxicValue = castToType<double>(snapshotData['toxic_value']);
    _vulgarValue = castToType<double>(snapshotData['vulgar_value']);
    _shortDuration = castToType<double>(snapshotData['shortDuration']);
    _views = castToType<int>(snapshotData['views']);
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

  static PostsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      PostsRecord.getDocumentFromData(
        {
          'TimePosted': convertAlgoliaParam(
            snapshot.data['TimePosted'],
            ParamType.DateTime,
            false,
          ),
          'Caption': snapshot.data['Caption'],
          'Author': convertAlgoliaParam(
            snapshot.data['Author'],
            ParamType.DocumentReference,
            false,
          ),
          'Voters': safeGet(
            () => (snapshot.data['Voters'] as Iterable)
                .map((d) => VotersStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'SpoilerClickers': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['SpoilerClickers'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'isShort': snapshot.data['isShort'],
          'isExpanded': snapshot.data['isExpanded'],
          'isSpoiler': snapshot.data['isSpoiler'],
          'isStealth': snapshot.data['isStealth'],
          'isPrivate': snapshot.data['isPrivate'],
          'isCommentsAllowed': snapshot.data['isCommentsAllowed'],
          'hashtags': safeGet(
            () => snapshot.data['hashtags'].toList(),
          ),
          'post_id': snapshot.data['post_id'],
          'comments': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['comments'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'media': safeGet(
            () => snapshot.data['media'].toList(),
          ),
          'ShortVideo': snapshot.data['ShortVideo'],
          'caption_embedding': safeGet(
            () => convertAlgoliaParam<double>(
              snapshot.data['caption_embedding'],
              ParamType.double,
              true,
            ).toList(),
          ),
          'image_embedding': safeGet(
            () => convertAlgoliaParam<double>(
              snapshot.data['image_embedding'],
              ParamType.double,
              true,
            ).toList(),
          ),
          'informative_value': convertAlgoliaParam(
            snapshot.data['informative_value'],
            ParamType.double,
            false,
          ),
          'political_value': convertAlgoliaParam(
            snapshot.data['political_value'],
            ParamType.double,
            false,
          ),
          'toxic_value': convertAlgoliaParam(
            snapshot.data['toxic_value'],
            ParamType.double,
            false,
          ),
          'vulgar_value': convertAlgoliaParam(
            snapshot.data['vulgar_value'],
            ParamType.double,
            false,
          ),
          'shortDuration': convertAlgoliaParam(
            snapshot.data['shortDuration'],
            ParamType.double,
            false,
          ),
          'views': convertAlgoliaParam(
            snapshot.data['views'],
            ParamType.int,
            false,
          ),
        },
        PostsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<PostsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'posts',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

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
  String? postId,
  String? shortVideo,
  double? informativeValue,
  double? politicalValue,
  double? toxicValue,
  double? vulgarValue,
  double? shortDuration,
  int? views,
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
      'post_id': postId,
      'ShortVideo': shortVideo,
      'informative_value': informativeValue,
      'political_value': politicalValue,
      'toxic_value': toxicValue,
      'vulgar_value': vulgarValue,
      'shortDuration': shortDuration,
      'views': views,
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
        e1?.isShort == e2?.isShort &&
        e1?.isExpanded == e2?.isExpanded &&
        e1?.isSpoiler == e2?.isSpoiler &&
        e1?.isStealth == e2?.isStealth &&
        e1?.isPrivate == e2?.isPrivate &&
        e1?.isCommentsAllowed == e2?.isCommentsAllowed &&
        listEquality.equals(e1?.hashtags, e2?.hashtags) &&
        e1?.postId == e2?.postId &&
        listEquality.equals(e1?.comments, e2?.comments) &&
        listEquality.equals(e1?.media, e2?.media) &&
        e1?.shortVideo == e2?.shortVideo &&
        listEquality.equals(e1?.captionEmbedding, e2?.captionEmbedding) &&
        listEquality.equals(e1?.imageEmbedding, e2?.imageEmbedding) &&
        e1?.informativeValue == e2?.informativeValue &&
        e1?.politicalValue == e2?.politicalValue &&
        e1?.toxicValue == e2?.toxicValue &&
        e1?.vulgarValue == e2?.vulgarValue &&
        e1?.shortDuration == e2?.shortDuration &&
        e1?.views == e2?.views;
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.timePosted,
        e?.caption,
        e?.author,
        e?.voters,
        e?.spoilerClickers,
        e?.isShort,
        e?.isExpanded,
        e?.isSpoiler,
        e?.isStealth,
        e?.isPrivate,
        e?.isCommentsAllowed,
        e?.hashtags,
        e?.postId,
        e?.comments,
        e?.media,
        e?.shortVideo,
        e?.captionEmbedding,
        e?.imageEmbedding,
        e?.informativeValue,
        e?.politicalValue,
        e?.toxicValue,
        e?.vulgarValue,
        e?.shortDuration,
        e?.views
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
