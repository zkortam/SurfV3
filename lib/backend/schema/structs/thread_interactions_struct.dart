// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThreadInteractionsStruct extends FFFirebaseStruct {
  ThreadInteractionsStruct({
    List<DocumentReference>? liked,
    List<DocumentReference>? disliked,
    List<DocumentReference>? commentPositive,
    List<DocumentReference>? commentNositive,
    List<DocumentReference>? shared,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _liked = liked,
        _disliked = disliked,
        _commentPositive = commentPositive,
        _commentNositive = commentNositive,
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

  // "commentPositive" field.
  List<DocumentReference>? _commentPositive;
  List<DocumentReference> get commentPositive => _commentPositive ?? const [];
  set commentPositive(List<DocumentReference>? val) => _commentPositive = val;

  void updateCommentPositive(Function(List<DocumentReference>) updateFn) {
    updateFn(_commentPositive ??= []);
  }

  bool hasCommentPositive() => _commentPositive != null;

  // "commentNositive" field.
  List<DocumentReference>? _commentNositive;
  List<DocumentReference> get commentNositive => _commentNositive ?? const [];
  set commentNositive(List<DocumentReference>? val) => _commentNositive = val;

  void updateCommentNositive(Function(List<DocumentReference>) updateFn) {
    updateFn(_commentNositive ??= []);
  }

  bool hasCommentNositive() => _commentNositive != null;

  // "shared" field.
  List<DocumentReference>? _shared;
  List<DocumentReference> get shared => _shared ?? const [];
  set shared(List<DocumentReference>? val) => _shared = val;

  void updateShared(Function(List<DocumentReference>) updateFn) {
    updateFn(_shared ??= []);
  }

  bool hasShared() => _shared != null;

  static ThreadInteractionsStruct fromMap(Map<String, dynamic> data) =>
      ThreadInteractionsStruct(
        liked: getDataList(data['liked']),
        disliked: getDataList(data['disliked']),
        commentPositive: getDataList(data['commentPositive']),
        commentNositive: getDataList(data['commentNositive']),
        shared: getDataList(data['shared']),
      );

  static ThreadInteractionsStruct? maybeFromMap(dynamic data) => data is Map
      ? ThreadInteractionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'liked': _liked,
        'disliked': _disliked,
        'commentPositive': _commentPositive,
        'commentNositive': _commentNositive,
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
        'commentPositive': serializeParam(
          _commentPositive,
          ParamType.DocumentReference,
          isList: true,
        ),
        'commentNositive': serializeParam(
          _commentNositive,
          ParamType.DocumentReference,
          isList: true,
        ),
        'shared': serializeParam(
          _shared,
          ParamType.DocumentReference,
          isList: true,
        ),
      }.withoutNulls;

  static ThreadInteractionsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ThreadInteractionsStruct(
        liked: deserializeParam<DocumentReference>(
          data['liked'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['Threads'],
        ),
        disliked: deserializeParam<DocumentReference>(
          data['disliked'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['Threads'],
        ),
        commentPositive: deserializeParam<DocumentReference>(
          data['commentPositive'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['Threads'],
        ),
        commentNositive: deserializeParam<DocumentReference>(
          data['commentNositive'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['Threads'],
        ),
        shared: deserializeParam<DocumentReference>(
          data['shared'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['Threads'],
        ),
      );

  static ThreadInteractionsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ThreadInteractionsStruct(
        liked: convertAlgoliaParam<DocumentReference>(
          data['liked'],
          ParamType.DocumentReference,
          true,
        ),
        disliked: convertAlgoliaParam<DocumentReference>(
          data['disliked'],
          ParamType.DocumentReference,
          true,
        ),
        commentPositive: convertAlgoliaParam<DocumentReference>(
          data['commentPositive'],
          ParamType.DocumentReference,
          true,
        ),
        commentNositive: convertAlgoliaParam<DocumentReference>(
          data['commentNositive'],
          ParamType.DocumentReference,
          true,
        ),
        shared: convertAlgoliaParam<DocumentReference>(
          data['shared'],
          ParamType.DocumentReference,
          true,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ThreadInteractionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ThreadInteractionsStruct &&
        listEquality.equals(liked, other.liked) &&
        listEquality.equals(disliked, other.disliked) &&
        listEquality.equals(commentPositive, other.commentPositive) &&
        listEquality.equals(commentNositive, other.commentNositive) &&
        listEquality.equals(shared, other.shared);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([liked, disliked, commentPositive, commentNositive, shared]);
}

ThreadInteractionsStruct createThreadInteractionsStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ThreadInteractionsStruct(
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
