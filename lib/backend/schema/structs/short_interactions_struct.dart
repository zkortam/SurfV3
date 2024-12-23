// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShortInteractionsStruct extends FFFirebaseStruct {
  ShortInteractionsStruct({
    List<DocumentReference>? liked,
    List<DocumentReference>? disliked,
    List<DocumentReference>? commentNegative,
    List<ViewerStruct>? viewedShorts,
    List<DocumentReference>? commentPositive,
    ShortSharedStruct? shared,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _liked = liked,
        _disliked = disliked,
        _commentNegative = commentNegative,
        _viewedShorts = viewedShorts,
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

  // "ViewedShorts" field.
  List<ViewerStruct>? _viewedShorts;
  List<ViewerStruct> get viewedShorts => _viewedShorts ?? const [];
  set viewedShorts(List<ViewerStruct>? val) => _viewedShorts = val;

  void updateViewedShorts(Function(List<ViewerStruct>) updateFn) {
    updateFn(_viewedShorts ??= []);
  }

  bool hasViewedShorts() => _viewedShorts != null;

  // "commentPositive" field.
  List<DocumentReference>? _commentPositive;
  List<DocumentReference> get commentPositive => _commentPositive ?? const [];
  set commentPositive(List<DocumentReference>? val) => _commentPositive = val;

  void updateCommentPositive(Function(List<DocumentReference>) updateFn) {
    updateFn(_commentPositive ??= []);
  }

  bool hasCommentPositive() => _commentPositive != null;

  // "shared" field.
  ShortSharedStruct? _shared;
  ShortSharedStruct get shared => _shared ?? ShortSharedStruct();
  set shared(ShortSharedStruct? val) => _shared = val;

  void updateShared(Function(ShortSharedStruct) updateFn) {
    updateFn(_shared ??= ShortSharedStruct());
  }

  bool hasShared() => _shared != null;

  static ShortInteractionsStruct fromMap(Map<String, dynamic> data) =>
      ShortInteractionsStruct(
        liked: getDataList(data['liked']),
        disliked: getDataList(data['disliked']),
        commentNegative: getDataList(data['commentNegative']),
        viewedShorts: getStructList(
          data['ViewedShorts'],
          ViewerStruct.fromMap,
        ),
        commentPositive: getDataList(data['commentPositive']),
        shared: data['shared'] is ShortSharedStruct
            ? data['shared']
            : ShortSharedStruct.maybeFromMap(data['shared']),
      );

  static ShortInteractionsStruct? maybeFromMap(dynamic data) => data is Map
      ? ShortInteractionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'liked': _liked,
        'disliked': _disliked,
        'commentNegative': _commentNegative,
        'ViewedShorts': _viewedShorts?.map((e) => e.toMap()).toList(),
        'commentPositive': _commentPositive,
        'shared': _shared?.toMap(),
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
        'ViewedShorts': serializeParam(
          _viewedShorts,
          ParamType.DataStruct,
          isList: true,
        ),
        'commentPositive': serializeParam(
          _commentPositive,
          ParamType.DocumentReference,
          isList: true,
        ),
        'shared': serializeParam(
          _shared,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ShortInteractionsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ShortInteractionsStruct(
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
        viewedShorts: deserializeStructParam<ViewerStruct>(
          data['ViewedShorts'],
          ParamType.DataStruct,
          true,
          structBuilder: ViewerStruct.fromSerializableMap,
        ),
        commentPositive: deserializeParam<DocumentReference>(
          data['commentPositive'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['posts'],
        ),
        shared: deserializeStructParam(
          data['shared'],
          ParamType.DataStruct,
          false,
          structBuilder: ShortSharedStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ShortInteractionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ShortInteractionsStruct &&
        listEquality.equals(liked, other.liked) &&
        listEquality.equals(disliked, other.disliked) &&
        listEquality.equals(commentNegative, other.commentNegative) &&
        listEquality.equals(viewedShorts, other.viewedShorts) &&
        listEquality.equals(commentPositive, other.commentPositive) &&
        shared == other.shared;
  }

  @override
  int get hashCode => const ListEquality().hash([
        liked,
        disliked,
        commentNegative,
        viewedShorts,
        commentPositive,
        shared
      ]);
}

ShortInteractionsStruct createShortInteractionsStruct({
  ShortSharedStruct? shared,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ShortInteractionsStruct(
      shared: shared ?? (clearUnsetFields ? ShortSharedStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ShortInteractionsStruct? updateShortInteractionsStruct(
  ShortInteractionsStruct? shortInteractions, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    shortInteractions
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addShortInteractionsStructData(
  Map<String, dynamic> firestoreData,
  ShortInteractionsStruct? shortInteractions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (shortInteractions == null) {
    return;
  }
  if (shortInteractions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && shortInteractions.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final shortInteractionsData =
      getShortInteractionsFirestoreData(shortInteractions, forFieldValue);
  final nestedData =
      shortInteractionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = shortInteractions.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getShortInteractionsFirestoreData(
  ShortInteractionsStruct? shortInteractions, [
  bool forFieldValue = false,
]) {
  if (shortInteractions == null) {
    return {};
  }
  final firestoreData = mapToFirestore(shortInteractions.toMap());

  // Handle nested data for "shared" field.
  addShortSharedStructData(
    firestoreData,
    shortInteractions.hasShared() ? shortInteractions.shared : null,
    'shared',
    forFieldValue,
  );

  // Add any Firestore field values
  shortInteractions.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getShortInteractionsListFirestoreData(
  List<ShortInteractionsStruct>? shortInteractionss,
) =>
    shortInteractionss
        ?.map((e) => getShortInteractionsFirestoreData(e, true))
        .toList() ??
    [];
