// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PostinteractionStruct extends FFFirebaseStruct {
  PostinteractionStruct({
    bool? disliked,
    bool? liked,
    String? postId,
    int? watchtimepercent,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _disliked = disliked,
        _liked = liked,
        _postId = postId,
        _watchtimepercent = watchtimepercent,
        super(firestoreUtilData);

  // "disliked" field.
  bool? _disliked;
  bool get disliked => _disliked ?? false;
  set disliked(bool? val) => _disliked = val;

  bool hasDisliked() => _disliked != null;

  // "liked" field.
  bool? _liked;
  bool get liked => _liked ?? false;
  set liked(bool? val) => _liked = val;

  bool hasLiked() => _liked != null;

  // "post_id" field.
  String? _postId;
  String get postId => _postId ?? '';
  set postId(String? val) => _postId = val;

  bool hasPostId() => _postId != null;

  // "watchtimepercent" field.
  int? _watchtimepercent;
  int get watchtimepercent => _watchtimepercent ?? 0;
  set watchtimepercent(int? val) => _watchtimepercent = val;

  void incrementWatchtimepercent(int amount) =>
      watchtimepercent = watchtimepercent + amount;

  bool hasWatchtimepercent() => _watchtimepercent != null;

  static PostinteractionStruct fromMap(Map<String, dynamic> data) =>
      PostinteractionStruct(
        disliked: data['disliked'] as bool?,
        liked: data['liked'] as bool?,
        postId: data['post_id'] as String?,
        watchtimepercent: castToType<int>(data['watchtimepercent']),
      );

  static PostinteractionStruct? maybeFromMap(dynamic data) => data is Map
      ? PostinteractionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'disliked': _disliked,
        'liked': _liked,
        'post_id': _postId,
        'watchtimepercent': _watchtimepercent,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'disliked': serializeParam(
          _disliked,
          ParamType.bool,
        ),
        'liked': serializeParam(
          _liked,
          ParamType.bool,
        ),
        'post_id': serializeParam(
          _postId,
          ParamType.String,
        ),
        'watchtimepercent': serializeParam(
          _watchtimepercent,
          ParamType.int,
        ),
      }.withoutNulls;

  static PostinteractionStruct fromSerializableMap(Map<String, dynamic> data) =>
      PostinteractionStruct(
        disliked: deserializeParam(
          data['disliked'],
          ParamType.bool,
          false,
        ),
        liked: deserializeParam(
          data['liked'],
          ParamType.bool,
          false,
        ),
        postId: deserializeParam(
          data['post_id'],
          ParamType.String,
          false,
        ),
        watchtimepercent: deserializeParam(
          data['watchtimepercent'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PostinteractionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PostinteractionStruct &&
        disliked == other.disliked &&
        liked == other.liked &&
        postId == other.postId &&
        watchtimepercent == other.watchtimepercent;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([disliked, liked, postId, watchtimepercent]);
}

PostinteractionStruct createPostinteractionStruct({
  bool? disliked,
  bool? liked,
  String? postId,
  int? watchtimepercent,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PostinteractionStruct(
      disliked: disliked,
      liked: liked,
      postId: postId,
      watchtimepercent: watchtimepercent,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PostinteractionStruct? updatePostinteractionStruct(
  PostinteractionStruct? postinteraction, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    postinteraction
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPostinteractionStructData(
  Map<String, dynamic> firestoreData,
  PostinteractionStruct? postinteraction,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (postinteraction == null) {
    return;
  }
  if (postinteraction.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && postinteraction.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final postinteractionData =
      getPostinteractionFirestoreData(postinteraction, forFieldValue);
  final nestedData =
      postinteractionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = postinteraction.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPostinteractionFirestoreData(
  PostinteractionStruct? postinteraction, [
  bool forFieldValue = false,
]) {
  if (postinteraction == null) {
    return {};
  }
  final firestoreData = mapToFirestore(postinteraction.toMap());

  // Add any Firestore field values
  postinteraction.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPostinteractionListFirestoreData(
  List<PostinteractionStruct>? postinteractions,
) =>
    postinteractions
        ?.map((e) => getPostinteractionFirestoreData(e, true))
        .toList() ??
    [];
