// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentStruct extends FFFirebaseStruct {
  CommentStruct({
    DateTime? timeStamp,
    DocumentReference? postReference,
    DocumentReference? threadReference,
    DocumentReference? author,
    String? text,
    String? image,
    bool? isStealth,
    String? commentID,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _timeStamp = timeStamp,
        _postReference = postReference,
        _threadReference = threadReference,
        _author = author,
        _text = text,
        _image = image,
        _isStealth = isStealth,
        _commentID = commentID,
        super(firestoreUtilData);

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  set timeStamp(DateTime? val) => _timeStamp = val;

  bool hasTimeStamp() => _timeStamp != null;

  // "postReference" field.
  DocumentReference? _postReference;
  DocumentReference? get postReference => _postReference;
  set postReference(DocumentReference? val) => _postReference = val;

  bool hasPostReference() => _postReference != null;

  // "threadReference" field.
  DocumentReference? _threadReference;
  DocumentReference? get threadReference => _threadReference;
  set threadReference(DocumentReference? val) => _threadReference = val;

  bool hasThreadReference() => _threadReference != null;

  // "author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  set author(DocumentReference? val) => _author = val;

  bool hasAuthor() => _author != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "isStealth" field.
  bool? _isStealth;
  bool get isStealth => _isStealth ?? false;
  set isStealth(bool? val) => _isStealth = val;

  bool hasIsStealth() => _isStealth != null;

  // "commentID" field.
  String? _commentID;
  String get commentID => _commentID ?? '';
  set commentID(String? val) => _commentID = val;

  bool hasCommentID() => _commentID != null;

  static CommentStruct fromMap(Map<String, dynamic> data) => CommentStruct(
        timeStamp: data['timeStamp'] as DateTime?,
        postReference: data['postReference'] as DocumentReference?,
        threadReference: data['threadReference'] as DocumentReference?,
        author: data['author'] as DocumentReference?,
        text: data['text'] as String?,
        image: data['image'] as String?,
        isStealth: data['isStealth'] as bool?,
        commentID: data['commentID'] as String?,
      );

  static CommentStruct? maybeFromMap(dynamic data) =>
      data is Map ? CommentStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'timeStamp': _timeStamp,
        'postReference': _postReference,
        'threadReference': _threadReference,
        'author': _author,
        'text': _text,
        'image': _image,
        'isStealth': _isStealth,
        'commentID': _commentID,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'timeStamp': serializeParam(
          _timeStamp,
          ParamType.DateTime,
        ),
        'postReference': serializeParam(
          _postReference,
          ParamType.DocumentReference,
        ),
        'threadReference': serializeParam(
          _threadReference,
          ParamType.DocumentReference,
        ),
        'author': serializeParam(
          _author,
          ParamType.DocumentReference,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'isStealth': serializeParam(
          _isStealth,
          ParamType.bool,
        ),
        'commentID': serializeParam(
          _commentID,
          ParamType.String,
        ),
      }.withoutNulls;

  static CommentStruct fromSerializableMap(Map<String, dynamic> data) =>
      CommentStruct(
        timeStamp: deserializeParam(
          data['timeStamp'],
          ParamType.DateTime,
          false,
        ),
        postReference: deserializeParam(
          data['postReference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['posts'],
        ),
        threadReference: deserializeParam(
          data['threadReference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Threads'],
        ),
        author: deserializeParam(
          data['author'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        isStealth: deserializeParam(
          data['isStealth'],
          ParamType.bool,
          false,
        ),
        commentID: deserializeParam(
          data['commentID'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CommentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CommentStruct &&
        timeStamp == other.timeStamp &&
        postReference == other.postReference &&
        threadReference == other.threadReference &&
        author == other.author &&
        text == other.text &&
        image == other.image &&
        isStealth == other.isStealth &&
        commentID == other.commentID;
  }

  @override
  int get hashCode => const ListEquality().hash([
        timeStamp,
        postReference,
        threadReference,
        author,
        text,
        image,
        isStealth,
        commentID
      ]);
}

CommentStruct createCommentStruct({
  DateTime? timeStamp,
  DocumentReference? postReference,
  DocumentReference? threadReference,
  DocumentReference? author,
  String? text,
  String? image,
  bool? isStealth,
  String? commentID,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CommentStruct(
      timeStamp: timeStamp,
      postReference: postReference,
      threadReference: threadReference,
      author: author,
      text: text,
      image: image,
      isStealth: isStealth,
      commentID: commentID,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CommentStruct? updateCommentStruct(
  CommentStruct? comment, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    comment
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCommentStructData(
  Map<String, dynamic> firestoreData,
  CommentStruct? comment,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (comment == null) {
    return;
  }
  if (comment.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && comment.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final commentData = getCommentFirestoreData(comment, forFieldValue);
  final nestedData = commentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = comment.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCommentFirestoreData(
  CommentStruct? comment, [
  bool forFieldValue = false,
]) {
  if (comment == null) {
    return {};
  }
  final firestoreData = mapToFirestore(comment.toMap());

  // Add any Firestore field values
  comment.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCommentListFirestoreData(
  List<CommentStruct>? comments,
) =>
    comments?.map((e) => getCommentFirestoreData(e, true)).toList() ?? [];
