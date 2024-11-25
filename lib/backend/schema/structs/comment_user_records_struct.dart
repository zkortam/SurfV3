// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CommentUserRecordsStruct extends FFFirebaseStruct {
  CommentUserRecordsStruct({
    DocumentReference? comment,
    DocumentReference? post,
    DocumentReference? thread,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _comment = comment,
        _post = post,
        _thread = thread,
        super(firestoreUtilData);

  // "Comment" field.
  DocumentReference? _comment;
  DocumentReference? get comment => _comment;
  set comment(DocumentReference? val) => _comment = val;

  bool hasComment() => _comment != null;

  // "Post" field.
  DocumentReference? _post;
  DocumentReference? get post => _post;
  set post(DocumentReference? val) => _post = val;

  bool hasPost() => _post != null;

  // "Thread" field.
  DocumentReference? _thread;
  DocumentReference? get thread => _thread;
  set thread(DocumentReference? val) => _thread = val;

  bool hasThread() => _thread != null;

  static CommentUserRecordsStruct fromMap(Map<String, dynamic> data) =>
      CommentUserRecordsStruct(
        comment: data['Comment'] as DocumentReference?,
        post: data['Post'] as DocumentReference?,
        thread: data['Thread'] as DocumentReference?,
      );

  static CommentUserRecordsStruct? maybeFromMap(dynamic data) => data is Map
      ? CommentUserRecordsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Comment': _comment,
        'Post': _post,
        'Thread': _thread,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Comment': serializeParam(
          _comment,
          ParamType.DocumentReference,
        ),
        'Post': serializeParam(
          _post,
          ParamType.DocumentReference,
        ),
        'Thread': serializeParam(
          _thread,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static CommentUserRecordsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CommentUserRecordsStruct(
        comment: deserializeParam(
          data['Comment'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Comments'],
        ),
        post: deserializeParam(
          data['Post'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['posts'],
        ),
        thread: deserializeParam(
          data['Thread'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Threads'],
        ),
      );

  @override
  String toString() => 'CommentUserRecordsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CommentUserRecordsStruct &&
        comment == other.comment &&
        post == other.post &&
        thread == other.thread;
  }

  @override
  int get hashCode => const ListEquality().hash([comment, post, thread]);
}

CommentUserRecordsStruct createCommentUserRecordsStruct({
  DocumentReference? comment,
  DocumentReference? post,
  DocumentReference? thread,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CommentUserRecordsStruct(
      comment: comment,
      post: post,
      thread: thread,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CommentUserRecordsStruct? updateCommentUserRecordsStruct(
  CommentUserRecordsStruct? commentUserRecords, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    commentUserRecords
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCommentUserRecordsStructData(
  Map<String, dynamic> firestoreData,
  CommentUserRecordsStruct? commentUserRecords,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (commentUserRecords == null) {
    return;
  }
  if (commentUserRecords.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && commentUserRecords.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final commentUserRecordsData =
      getCommentUserRecordsFirestoreData(commentUserRecords, forFieldValue);
  final nestedData =
      commentUserRecordsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      commentUserRecords.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCommentUserRecordsFirestoreData(
  CommentUserRecordsStruct? commentUserRecords, [
  bool forFieldValue = false,
]) {
  if (commentUserRecords == null) {
    return {};
  }
  final firestoreData = mapToFirestore(commentUserRecords.toMap());

  // Add any Firestore field values
  commentUserRecords.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCommentUserRecordsListFirestoreData(
  List<CommentUserRecordsStruct>? commentUserRecordss,
) =>
    commentUserRecordss
        ?.map((e) => getCommentUserRecordsFirestoreData(e, true))
        .toList() ??
    [];
