// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostInteractionsStruct extends FFFirebaseStruct {
  PostInteractionsStruct({
    List<DocumentReference>? liked,
    List<DocumentReference>? disliked,
    List<DocumentReference>? commentNegative,
    DocumentReference? commentPositive,
    DocumentReference? shared,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _liked = liked,
        _disliked = disliked,
        _commentNegative = commentNegative,
        _commentPositive = commentPositive,
        _shared = shared,
        super(firestoreUtilData);

  // "liked" field.
  List<DocumentReference>? _liked;
  List<DocumentReference> get liked => _liked ?? const [];
  set liked(List<DocumentReference>? val) => _liked = val;

  void updateLiked(Function(List<DocumentReference>) updateFn) {
    updateFn(_liked ??= []);
  }

  bool hasLiked() => _liked != null;

  // "disliked" field.
  List<DocumentReference>? _disliked;
  List<DocumentReference> get disliked => _disliked ?? const [];
  set disliked(List<DocumentReference>? val) => _disliked = val;

  void updateDisliked(Function(List<DocumentReference>) updateFn) {
    updateFn(_disliked ??= []);
  }

  bool hasDisliked() => _disliked != null;

  // "commentNegative" field.
  List<DocumentReference>? _commentNegative;
  List<DocumentReference> get commentNegative => _commentNegative ?? const [];
  set commentNegative(List<DocumentReference>? val) => _commentNegative = val;

  void updateCommentNegative(Function(List<DocumentReference>) updateFn) {
    updateFn(_commentNegative ??= []);
  }

  bool hasCommentNegative() => _commentNegative != null;

  // "commentPositive" field.
  DocumentReference? _commentPositive;
  DocumentReference? get commentPositive => _commentPositive;
  set commentPositive(DocumentReference? val) => _commentPositive = val;

  bool hasCommentPositive() => _commentPositive != null;

  // "shared" field.
  DocumentReference? _shared;
  DocumentReference? get shared => _shared;
  set shared(DocumentReference? val) => _shared = val;

  bool hasShared() => _shared != null;

  static PostInteractionsStruct fromMap(Map<String, dynamic> data) =>
      PostInteractionsStruct(
        liked: getDataList(data['liked']),
        disliked: getDataList(data['disliked']),
        commentNegative: getDataList(data['commentNegative']),
        commentPositive: data['commentPositive'] as DocumentReference?,
        shared: data['shared'] as DocumentReference?,
      );

  static PostInteractionsStruct? maybeFromMap(dynamic data) => data is Map
      ? PostInteractionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'liked': _liked,
        'disliked': _disliked,
        'commentNegative': _commentNegative,
        'commentPositive': _commentPositive,
        'shared': _shared,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'liked': serializeParam(
          _liked,
          ParamType.DocumentReference,
          isList: true,
        ),
        'disliked': serializeParam(
          _disliked,
          ParamType.DocumentReference,
          isList: true,
        ),
        'commentNegative': serializeParam(
          _commentNegative,
          ParamType.DocumentReference,
          isList: true,
        ),
        'commentPositive': serializeParam(
          _commentPositive,
          ParamType.DocumentReference,
        ),
        'shared': serializeParam(
          _shared,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static PostInteractionsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PostInteractionsStruct(
        liked: deserializeParam<DocumentReference>(
          data['liked'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['posts'],
        ),
        disliked: deserializeParam<DocumentReference>(
          data['disliked'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['posts'],
        ),
        commentNegative: deserializeParam<DocumentReference>(
          data['commentNegative'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['posts'],
        ),
        commentPositive: deserializeParam(
          data['commentPositive'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['posts'],
        ),
        shared: deserializeParam(
          data['shared'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['posts'],
        ),
      );

  @override
  String toString() => 'PostInteractionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PostInteractionsStruct &&
        listEquality.equals(liked, other.liked) &&
        listEquality.equals(disliked, other.disliked) &&
        listEquality.equals(commentNegative, other.commentNegative) &&
        commentPositive == other.commentPositive &&
        shared == other.shared;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([liked, disliked, commentNegative, commentPositive, shared]);
}

PostInteractionsStruct createPostInteractionsStruct({
  DocumentReference? commentPositive,
  DocumentReference? shared,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PostInteractionsStruct(
      commentPositive: commentPositive,
      shared: shared,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PostInteractionsStruct? updatePostInteractionsStruct(
  PostInteractionsStruct? postInteractions, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    postInteractions
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPostInteractionsStructData(
  Map<String, dynamic> firestoreData,
  PostInteractionsStruct? postInteractions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (postInteractions == null) {
    return;
  }
  if (postInteractions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && postInteractions.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final postInteractionsData =
      getPostInteractionsFirestoreData(postInteractions, forFieldValue);
  final nestedData =
      postInteractionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = postInteractions.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPostInteractionsFirestoreData(
  PostInteractionsStruct? postInteractions, [
  bool forFieldValue = false,
]) {
  if (postInteractions == null) {
    return {};
  }
  final firestoreData = mapToFirestore(postInteractions.toMap());

  // Add any Firestore field values
  postInteractions.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPostInteractionsListFirestoreData(
  List<PostInteractionsStruct>? postInteractionss,
) =>
    postInteractionss
        ?.map((e) => getPostInteractionsFirestoreData(e, true))
        .toList() ??
    [];
