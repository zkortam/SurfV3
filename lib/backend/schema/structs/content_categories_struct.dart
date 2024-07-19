// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ContentCategoriesStruct extends FFFirebaseStruct {
  ContentCategoriesStruct({
    bool? isPolitical,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isPolitical = isPolitical,
        super(firestoreUtilData);

  // "isPolitical" field.
  bool? _isPolitical;
  bool get isPolitical => _isPolitical ?? false;
  set isPolitical(bool? val) => _isPolitical = val;

  bool hasIsPolitical() => _isPolitical != null;

  static ContentCategoriesStruct fromMap(Map<String, dynamic> data) =>
      ContentCategoriesStruct(
        isPolitical: data['isPolitical'] as bool?,
      );

  static ContentCategoriesStruct? maybeFromMap(dynamic data) => data is Map
      ? ContentCategoriesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'isPolitical': _isPolitical,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isPolitical': serializeParam(
          _isPolitical,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ContentCategoriesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ContentCategoriesStruct(
        isPolitical: deserializeParam(
          data['isPolitical'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ContentCategoriesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContentCategoriesStruct && isPolitical == other.isPolitical;
  }

  @override
  int get hashCode => const ListEquality().hash([isPolitical]);
}

ContentCategoriesStruct createContentCategoriesStruct({
  bool? isPolitical,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContentCategoriesStruct(
      isPolitical: isPolitical,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ContentCategoriesStruct? updateContentCategoriesStruct(
  ContentCategoriesStruct? contentCategories, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    contentCategories
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addContentCategoriesStructData(
  Map<String, dynamic> firestoreData,
  ContentCategoriesStruct? contentCategories,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (contentCategories == null) {
    return;
  }
  if (contentCategories.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && contentCategories.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contentCategoriesData =
      getContentCategoriesFirestoreData(contentCategories, forFieldValue);
  final nestedData =
      contentCategoriesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = contentCategories.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getContentCategoriesFirestoreData(
  ContentCategoriesStruct? contentCategories, [
  bool forFieldValue = false,
]) {
  if (contentCategories == null) {
    return {};
  }
  final firestoreData = mapToFirestore(contentCategories.toMap());

  // Add any Firestore field values
  contentCategories.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContentCategoriesListFirestoreData(
  List<ContentCategoriesStruct>? contentCategoriess,
) =>
    contentCategoriess
        ?.map((e) => getContentCategoriesFirestoreData(e, true))
        .toList() ??
    [];
