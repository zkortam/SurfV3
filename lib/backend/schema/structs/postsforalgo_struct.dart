// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsforalgoStruct extends FFFirebaseStruct {
  PostsforalgoStruct({
    String? caption,
    DateTime? timestamp,
    DocumentReference? author,
    bool? isShort,
    bool? isStealth,
    String? media,
    String? shortVideo,
    VotersStruct? voters,
    List<String>? hashtags,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _caption = caption,
        _timestamp = timestamp,
        _author = author,
        _isShort = isShort,
        _isStealth = isStealth,
        _media = media,
        _shortVideo = shortVideo,
        _voters = voters,
        _hashtags = hashtags,
        super(firestoreUtilData);

  // "caption" field.
  String? _caption;
  String get caption => _caption ?? '';
  set caption(String? val) => _caption = val;

  bool hasCaption() => _caption != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;

  bool hasTimestamp() => _timestamp != null;

  // "author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  set author(DocumentReference? val) => _author = val;

  bool hasAuthor() => _author != null;

  // "isShort" field.
  bool? _isShort;
  bool get isShort => _isShort ?? false;
  set isShort(bool? val) => _isShort = val;

  bool hasIsShort() => _isShort != null;

  // "isStealth" field.
  bool? _isStealth;
  bool get isStealth => _isStealth ?? false;
  set isStealth(bool? val) => _isStealth = val;

  bool hasIsStealth() => _isStealth != null;

  // "media" field.
  String? _media;
  String get media => _media ?? '';
  set media(String? val) => _media = val;

  bool hasMedia() => _media != null;

  // "shortVideo" field.
  String? _shortVideo;
  String get shortVideo => _shortVideo ?? '';
  set shortVideo(String? val) => _shortVideo = val;

  bool hasShortVideo() => _shortVideo != null;

  // "voters" field.
  VotersStruct? _voters;
  VotersStruct get voters => _voters ?? VotersStruct();
  set voters(VotersStruct? val) => _voters = val;

  void updateVoters(Function(VotersStruct) updateFn) {
    updateFn(_voters ??= VotersStruct());
  }

  bool hasVoters() => _voters != null;

  // "hashtags" field.
  List<String>? _hashtags;
  List<String> get hashtags => _hashtags ?? const [];
  set hashtags(List<String>? val) => _hashtags = val;

  void updateHashtags(Function(List<String>) updateFn) {
    updateFn(_hashtags ??= []);
  }

  bool hasHashtags() => _hashtags != null;

  static PostsforalgoStruct fromMap(Map<String, dynamic> data) =>
      PostsforalgoStruct(
        caption: data['caption'] as String?,
        timestamp: data['timestamp'] as DateTime?,
        author: data['author'] as DocumentReference?,
        isShort: data['isShort'] as bool?,
        isStealth: data['isStealth'] as bool?,
        media: data['media'] as String?,
        shortVideo: data['shortVideo'] as String?,
        voters: data['voters'] is VotersStruct
            ? data['voters']
            : VotersStruct.maybeFromMap(data['voters']),
        hashtags: getDataList(data['hashtags']),
      );

  static PostsforalgoStruct? maybeFromMap(dynamic data) => data is Map
      ? PostsforalgoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'caption': _caption,
        'timestamp': _timestamp,
        'author': _author,
        'isShort': _isShort,
        'isStealth': _isStealth,
        'media': _media,
        'shortVideo': _shortVideo,
        'voters': _voters?.toMap(),
        'hashtags': _hashtags,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'caption': serializeParam(
          _caption,
          ParamType.String,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
        'author': serializeParam(
          _author,
          ParamType.DocumentReference,
        ),
        'isShort': serializeParam(
          _isShort,
          ParamType.bool,
        ),
        'isStealth': serializeParam(
          _isStealth,
          ParamType.bool,
        ),
        'media': serializeParam(
          _media,
          ParamType.String,
        ),
        'shortVideo': serializeParam(
          _shortVideo,
          ParamType.String,
        ),
        'voters': serializeParam(
          _voters,
          ParamType.DataStruct,
        ),
        'hashtags': serializeParam(
          _hashtags,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static PostsforalgoStruct fromSerializableMap(Map<String, dynamic> data) =>
      PostsforalgoStruct(
        caption: deserializeParam(
          data['caption'],
          ParamType.String,
          false,
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        author: deserializeParam(
          data['author'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        isShort: deserializeParam(
          data['isShort'],
          ParamType.bool,
          false,
        ),
        isStealth: deserializeParam(
          data['isStealth'],
          ParamType.bool,
          false,
        ),
        media: deserializeParam(
          data['media'],
          ParamType.String,
          false,
        ),
        shortVideo: deserializeParam(
          data['shortVideo'],
          ParamType.String,
          false,
        ),
        voters: deserializeStructParam(
          data['voters'],
          ParamType.DataStruct,
          false,
          structBuilder: VotersStruct.fromSerializableMap,
        ),
        hashtags: deserializeParam<String>(
          data['hashtags'],
          ParamType.String,
          true,
        ),
      );

  static PostsforalgoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PostsforalgoStruct(
        caption: convertAlgoliaParam(
          data['caption'],
          ParamType.String,
          false,
        ),
        timestamp: convertAlgoliaParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        author: convertAlgoliaParam(
          data['author'],
          ParamType.DocumentReference,
          false,
        ),
        isShort: convertAlgoliaParam(
          data['isShort'],
          ParamType.bool,
          false,
        ),
        isStealth: convertAlgoliaParam(
          data['isStealth'],
          ParamType.bool,
          false,
        ),
        media: convertAlgoliaParam(
          data['media'],
          ParamType.String,
          false,
        ),
        shortVideo: convertAlgoliaParam(
          data['shortVideo'],
          ParamType.String,
          false,
        ),
        voters: convertAlgoliaParam(
          data['voters'],
          ParamType.DataStruct,
          false,
          structBuilder: VotersStruct.fromAlgoliaData,
        ),
        hashtags: convertAlgoliaParam<String>(
          data['hashtags'],
          ParamType.String,
          true,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PostsforalgoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PostsforalgoStruct &&
        caption == other.caption &&
        timestamp == other.timestamp &&
        author == other.author &&
        isShort == other.isShort &&
        isStealth == other.isStealth &&
        media == other.media &&
        shortVideo == other.shortVideo &&
        voters == other.voters &&
        listEquality.equals(hashtags, other.hashtags);
  }

  @override
  int get hashCode => const ListEquality().hash([
        caption,
        timestamp,
        author,
        isShort,
        isStealth,
        media,
        shortVideo,
        voters,
        hashtags
      ]);
}

PostsforalgoStruct createPostsforalgoStruct({
  String? caption,
  DateTime? timestamp,
  DocumentReference? author,
  bool? isShort,
  bool? isStealth,
  String? media,
  String? shortVideo,
  VotersStruct? voters,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PostsforalgoStruct(
      caption: caption,
      timestamp: timestamp,
      author: author,
      isShort: isShort,
      isStealth: isStealth,
      media: media,
      shortVideo: shortVideo,
      voters: voters ?? (clearUnsetFields ? VotersStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PostsforalgoStruct? updatePostsforalgoStruct(
  PostsforalgoStruct? postsforalgo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    postsforalgo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPostsforalgoStructData(
  Map<String, dynamic> firestoreData,
  PostsforalgoStruct? postsforalgo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (postsforalgo == null) {
    return;
  }
  if (postsforalgo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && postsforalgo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final postsforalgoData =
      getPostsforalgoFirestoreData(postsforalgo, forFieldValue);
  final nestedData =
      postsforalgoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = postsforalgo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPostsforalgoFirestoreData(
  PostsforalgoStruct? postsforalgo, [
  bool forFieldValue = false,
]) {
  if (postsforalgo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(postsforalgo.toMap());

  // Handle nested data for "voters" field.
  addVotersStructData(
    firestoreData,
    postsforalgo.hasVoters() ? postsforalgo.voters : null,
    'voters',
    forFieldValue,
  );

  // Add any Firestore field values
  postsforalgo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPostsforalgoListFirestoreData(
  List<PostsforalgoStruct>? postsforalgos,
) =>
    postsforalgos?.map((e) => getPostsforalgoFirestoreData(e, true)).toList() ??
    [];
