// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PostSharedStruct extends FFFirebaseStruct {
  PostSharedStruct({
    DocumentReference? postref,
    int? count,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _postref = postref,
        _count = count,
        super(firestoreUtilData);

  // "postref" field.
  DocumentReference? _postref;
  DocumentReference? get postref => _postref;
  set postref(DocumentReference? val) => _postref = val;

  bool hasPostref() => _postref != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  static PostSharedStruct fromMap(Map<String, dynamic> data) =>
      PostSharedStruct(
        postref: data['postref'] as DocumentReference?,
        count: castToType<int>(data['count']),
      );

  static PostSharedStruct? maybeFromMap(dynamic data) => data is Map
      ? PostSharedStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'postref': _postref,
        'count': _count,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'postref': serializeParam(
          _postref,
          ParamType.DocumentReference,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
      }.withoutNulls;

  static PostSharedStruct fromSerializableMap(Map<String, dynamic> data) =>
      PostSharedStruct(
        postref: deserializeParam(
          data['postref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['posts'],
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PostSharedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PostSharedStruct &&
        postref == other.postref &&
        count == other.count;
  }

  @override
  int get hashCode => const ListEquality().hash([postref, count]);
}

PostSharedStruct createPostSharedStruct({
  DocumentReference? postref,
  int? count,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PostSharedStruct(
      postref: postref,
      count: count,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PostSharedStruct? updatePostSharedStruct(
  PostSharedStruct? postShared, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    postShared
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPostSharedStructData(
  Map<String, dynamic> firestoreData,
  PostSharedStruct? postShared,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (postShared == null) {
    return;
  }
  if (postShared.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && postShared.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final postSharedData = getPostSharedFirestoreData(postShared, forFieldValue);
  final nestedData = postSharedData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = postShared.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPostSharedFirestoreData(
  PostSharedStruct? postShared, [
  bool forFieldValue = false,
]) {
  if (postShared == null) {
    return {};
  }
  final firestoreData = mapToFirestore(postShared.toMap());

  // Add any Firestore field values
  postShared.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPostSharedListFirestoreData(
  List<PostSharedStruct>? postShareds,
) =>
    postShareds?.map((e) => getPostSharedFirestoreData(e, true)).toList() ?? [];
