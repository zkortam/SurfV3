// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThreadInteractionsStruct extends FFFirebaseStruct {
  ThreadInteractionsStruct({
    DocumentReference? liked,
    DocumentReference? disliked,
    DocumentReference? commentPositive,
    DocumentReference? commentNegative,
    DocumentReference? shared,
    List<DocumentReference>? clickedLink,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _liked = liked,
        _disliked = disliked,
        _commentPositive = commentPositive,
        _commentNegative = commentNegative,
        _shared = shared,
        _clickedLink = clickedLink,
        super(firestoreUtilData);

  // "Liked" field.
  DocumentReference? _liked;
  DocumentReference? get liked => _liked;
  set liked(DocumentReference? val) => _liked = val;

  bool hasLiked() => _liked != null;

  // "Disliked" field.
  DocumentReference? _disliked;
  DocumentReference? get disliked => _disliked;
  set disliked(DocumentReference? val) => _disliked = val;

  bool hasDisliked() => _disliked != null;

  // "CommentPositive" field.
  DocumentReference? _commentPositive;
  DocumentReference? get commentPositive => _commentPositive;
  set commentPositive(DocumentReference? val) => _commentPositive = val;

  bool hasCommentPositive() => _commentPositive != null;

  // "CommentNegative" field.
  DocumentReference? _commentNegative;
  DocumentReference? get commentNegative => _commentNegative;
  set commentNegative(DocumentReference? val) => _commentNegative = val;

  bool hasCommentNegative() => _commentNegative != null;

  // "shared" field.
  DocumentReference? _shared;
  DocumentReference? get shared => _shared;
  set shared(DocumentReference? val) => _shared = val;

  bool hasShared() => _shared != null;

  // "clickedLink" field.
  List<DocumentReference>? _clickedLink;
  List<DocumentReference> get clickedLink => _clickedLink ?? const [];
  set clickedLink(List<DocumentReference>? val) => _clickedLink = val;

  void updateClickedLink(Function(List<DocumentReference>) updateFn) {
    updateFn(_clickedLink ??= []);
  }

  bool hasClickedLink() => _clickedLink != null;

  static ThreadInteractionsStruct fromMap(Map<String, dynamic> data) =>
      ThreadInteractionsStruct(
        liked: data['Liked'] as DocumentReference?,
        disliked: data['Disliked'] as DocumentReference?,
        commentPositive: data['CommentPositive'] as DocumentReference?,
        commentNegative: data['CommentNegative'] as DocumentReference?,
        shared: data['shared'] as DocumentReference?,
        clickedLink: getDataList(data['clickedLink']),
      );

  static ThreadInteractionsStruct? maybeFromMap(dynamic data) => data is Map
      ? ThreadInteractionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Liked': _liked,
        'Disliked': _disliked,
        'CommentPositive': _commentPositive,
        'CommentNegative': _commentNegative,
        'shared': _shared,
        'clickedLink': _clickedLink,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Liked': serializeParam(
          _liked,
          ParamType.DocumentReference,
        ),
        'Disliked': serializeParam(
          _disliked,
          ParamType.DocumentReference,
        ),
        'CommentPositive': serializeParam(
          _commentPositive,
          ParamType.DocumentReference,
        ),
        'CommentNegative': serializeParam(
          _commentNegative,
          ParamType.DocumentReference,
        ),
        'shared': serializeParam(
          _shared,
          ParamType.DocumentReference,
        ),
        'clickedLink': serializeParam(
          _clickedLink,
          ParamType.DocumentReference,
          isList: true,
        ),
      }.withoutNulls;

  static ThreadInteractionsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ThreadInteractionsStruct(
        liked: deserializeParam(
          data['Liked'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Threads'],
        ),
        disliked: deserializeParam(
          data['Disliked'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Threads'],
        ),
        commentPositive: deserializeParam(
          data['CommentPositive'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Threads'],
        ),
        commentNegative: deserializeParam(
          data['CommentNegative'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Threads'],
        ),
        shared: deserializeParam(
          data['shared'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Threads'],
        ),
        clickedLink: deserializeParam<DocumentReference>(
          data['clickedLink'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['Threads'],
        ),
      );

  @override
  String toString() => 'ThreadInteractionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ThreadInteractionsStruct &&
        liked == other.liked &&
        disliked == other.disliked &&
        commentPositive == other.commentPositive &&
        commentNegative == other.commentNegative &&
        shared == other.shared &&
        listEquality.equals(clickedLink, other.clickedLink);
  }

  @override
  int get hashCode => const ListEquality().hash(
      [liked, disliked, commentPositive, commentNegative, shared, clickedLink]);
}

ThreadInteractionsStruct createThreadInteractionsStruct({
  DocumentReference? liked,
  DocumentReference? disliked,
  DocumentReference? commentPositive,
  DocumentReference? commentNegative,
  DocumentReference? shared,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ThreadInteractionsStruct(
      liked: liked,
      disliked: disliked,
      commentPositive: commentPositive,
      commentNegative: commentNegative,
      shared: shared,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ThreadInteractionsStruct? updateThreadInteractionsStruct(
  ThreadInteractionsStruct? threadInteractions, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    threadInteractions
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addThreadInteractionsStructData(
  Map<String, dynamic> firestoreData,
  ThreadInteractionsStruct? threadInteractions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (threadInteractions == null) {
    return;
  }
  if (threadInteractions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && threadInteractions.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final threadInteractionsData =
      getThreadInteractionsFirestoreData(threadInteractions, forFieldValue);
  final nestedData =
      threadInteractionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      threadInteractions.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getThreadInteractionsFirestoreData(
  ThreadInteractionsStruct? threadInteractions, [
  bool forFieldValue = false,
]) {
  if (threadInteractions == null) {
    return {};
  }
  final firestoreData = mapToFirestore(threadInteractions.toMap());

  // Add any Firestore field values
  threadInteractions.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getThreadInteractionsListFirestoreData(
  List<ThreadInteractionsStruct>? threadInteractionss,
) =>
    threadInteractionss
        ?.map((e) => getThreadInteractionsFirestoreData(e, true))
        .toList() ??
    [];
