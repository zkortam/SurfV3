// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ShortSharedStruct extends FFFirebaseStruct {
  ShortSharedStruct({
    DocumentReference? shortRef,
    int? count,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _shortRef = shortRef,
        _count = count,
        super(firestoreUtilData);

  // "shortRef" field.
  DocumentReference? _shortRef;
  DocumentReference? get shortRef => _shortRef;
  set shortRef(DocumentReference? val) => _shortRef = val;

  bool hasShortRef() => _shortRef != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  static ShortSharedStruct fromMap(Map<String, dynamic> data) =>
      ShortSharedStruct(
        shortRef: data['shortRef'] as DocumentReference?,
        count: castToType<int>(data['count']),
      );

  static ShortSharedStruct? maybeFromMap(dynamic data) => data is Map
      ? ShortSharedStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'shortRef': _shortRef,
        'count': _count,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'shortRef': serializeParam(
          _shortRef,
          ParamType.DocumentReference,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
      }.withoutNulls;

  static ShortSharedStruct fromSerializableMap(Map<String, dynamic> data) =>
      ShortSharedStruct(
        shortRef: deserializeParam(
          data['shortRef'],
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
  String toString() => 'ShortSharedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ShortSharedStruct &&
        shortRef == other.shortRef &&
        count == other.count;
  }

  @override
  int get hashCode => const ListEquality().hash([shortRef, count]);
}

ShortSharedStruct createShortSharedStruct({
  DocumentReference? shortRef,
  int? count,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ShortSharedStruct(
      shortRef: shortRef,
      count: count,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ShortSharedStruct? updateShortSharedStruct(
  ShortSharedStruct? shortShared, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    shortShared
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addShortSharedStructData(
  Map<String, dynamic> firestoreData,
  ShortSharedStruct? shortShared,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (shortShared == null) {
    return;
  }
  if (shortShared.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && shortShared.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final shortSharedData =
      getShortSharedFirestoreData(shortShared, forFieldValue);
  final nestedData =
      shortSharedData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = shortShared.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getShortSharedFirestoreData(
  ShortSharedStruct? shortShared, [
  bool forFieldValue = false,
]) {
  if (shortShared == null) {
    return {};
  }
  final firestoreData = mapToFirestore(shortShared.toMap());

  // Add any Firestore field values
  shortShared.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getShortSharedListFirestoreData(
  List<ShortSharedStruct>? shortShareds,
) =>
    shortShareds?.map((e) => getShortSharedFirestoreData(e, true)).toList() ??
    [];
