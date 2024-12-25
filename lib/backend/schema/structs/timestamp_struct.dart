// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TimestampStruct extends FFFirebaseStruct {
  TimestampStruct({
    DateTime? timestamp,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _timestamp = timestamp,
        super(firestoreUtilData);

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;

  bool hasTimestamp() => _timestamp != null;

  static TimestampStruct fromMap(Map<String, dynamic> data) => TimestampStruct(
        timestamp: data['timestamp'] as DateTime?,
      );

  static TimestampStruct? maybeFromMap(dynamic data) => data is Map
      ? TimestampStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'timestamp': _timestamp,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static TimestampStruct fromSerializableMap(Map<String, dynamic> data) =>
      TimestampStruct(
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
      );

  static TimestampStruct fromAlgoliaData(Map<String, dynamic> data) =>
      TimestampStruct(
        timestamp: convertAlgoliaParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'TimestampStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TimestampStruct && timestamp == other.timestamp;
  }

  @override
  int get hashCode => const ListEquality().hash([timestamp]);
}

TimestampStruct createTimestampStruct({
  DateTime? timestamp,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TimestampStruct(
      timestamp: timestamp,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TimestampStruct? updateTimestampStruct(
  TimestampStruct? timestampStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    timestampStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTimestampStructData(
  Map<String, dynamic> firestoreData,
  TimestampStruct? timestampStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (timestampStruct == null) {
    return;
  }
  if (timestampStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && timestampStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final timestampStructData =
      getTimestampFirestoreData(timestampStruct, forFieldValue);
  final nestedData =
      timestampStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = timestampStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTimestampFirestoreData(
  TimestampStruct? timestampStruct, [
  bool forFieldValue = false,
]) {
  if (timestampStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(timestampStruct.toMap());

  // Add any Firestore field values
  timestampStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTimestampListFirestoreData(
  List<TimestampStruct>? timestampStructs,
) =>
    timestampStructs?.map((e) => getTimestampFirestoreData(e, true)).toList() ??
    [];
