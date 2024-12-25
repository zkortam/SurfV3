// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ViewerStruct extends FFFirebaseStruct {
  ViewerStruct({
    DocumentReference? short,
    double? ratio,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _short = short,
        _ratio = ratio,
        super(firestoreUtilData);

  // "short" field.
  DocumentReference? _short;
  DocumentReference? get short => _short;
  set short(DocumentReference? val) => _short = val;

  bool hasShort() => _short != null;

  // "ratio" field.
  double? _ratio;
  double get ratio => _ratio ?? 0.0;
  set ratio(double? val) => _ratio = val;

  void incrementRatio(double amount) => ratio = ratio + amount;

  bool hasRatio() => _ratio != null;

  static ViewerStruct fromMap(Map<String, dynamic> data) => ViewerStruct(
        short: data['short'] as DocumentReference?,
        ratio: castToType<double>(data['ratio']),
      );

  static ViewerStruct? maybeFromMap(dynamic data) =>
      data is Map ? ViewerStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'short': _short,
        'ratio': _ratio,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'short': serializeParam(
          _short,
          ParamType.DocumentReference,
        ),
        'ratio': serializeParam(
          _ratio,
          ParamType.double,
        ),
      }.withoutNulls;

  static ViewerStruct fromSerializableMap(Map<String, dynamic> data) =>
      ViewerStruct(
        short: deserializeParam(
          data['short'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['posts'],
        ),
        ratio: deserializeParam(
          data['ratio'],
          ParamType.double,
          false,
        ),
      );

  static ViewerStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ViewerStruct(
        short: convertAlgoliaParam(
          data['short'],
          ParamType.DocumentReference,
          false,
        ),
        ratio: convertAlgoliaParam(
          data['ratio'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ViewerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ViewerStruct &&
        short == other.short &&
        ratio == other.ratio;
  }

  @override
  int get hashCode => const ListEquality().hash([short, ratio]);
}

ViewerStruct createViewerStruct({
  DocumentReference? short,
  double? ratio,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ViewerStruct(
      short: short,
      ratio: ratio,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ViewerStruct? updateViewerStruct(
  ViewerStruct? viewer, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    viewer
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addViewerStructData(
  Map<String, dynamic> firestoreData,
  ViewerStruct? viewer,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (viewer == null) {
    return;
  }
  if (viewer.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && viewer.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final viewerData = getViewerFirestoreData(viewer, forFieldValue);
  final nestedData = viewerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = viewer.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getViewerFirestoreData(
  ViewerStruct? viewer, [
  bool forFieldValue = false,
]) {
  if (viewer == null) {
    return {};
  }
  final firestoreData = mapToFirestore(viewer.toMap());

  // Add any Firestore field values
  viewer.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getViewerListFirestoreData(
  List<ViewerStruct>? viewers,
) =>
    viewers?.map((e) => getViewerFirestoreData(e, true)).toList() ?? [];
