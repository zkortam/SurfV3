// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThreadSharedStruct extends FFFirebaseStruct {
  ThreadSharedStruct({
    DocumentReference? threadRef,
    int? count,
    ThreadSharedStruct? shared,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _threadRef = threadRef,
        _count = count,
        _shared = shared,
        super(firestoreUtilData);

  // "threadRef" field.
  DocumentReference? _threadRef;
  DocumentReference? get threadRef => _threadRef;
  set threadRef(DocumentReference? val) => _threadRef = val;

  bool hasThreadRef() => _threadRef != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  // "shared" field.
  ThreadSharedStruct? _shared;
  ThreadSharedStruct get shared => _shared ?? ThreadSharedStruct();
  set shared(ThreadSharedStruct? val) => _shared = val;

  void updateShared(Function(ThreadSharedStruct) updateFn) {
    updateFn(_shared ??= ThreadSharedStruct());
  }

  bool hasShared() => _shared != null;

  static ThreadSharedStruct fromMap(Map<String, dynamic> data) =>
      ThreadSharedStruct(
        threadRef: data['threadRef'] as DocumentReference?,
        count: castToType<int>(data['count']),
        shared: data['shared'] is ThreadSharedStruct
            ? data['shared']
            : ThreadSharedStruct.maybeFromMap(data['shared']),
      );

  static ThreadSharedStruct? maybeFromMap(dynamic data) => data is Map
      ? ThreadSharedStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'threadRef': _threadRef,
        'count': _count,
        'shared': _shared?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'threadRef': serializeParam(
          _threadRef,
          ParamType.DocumentReference,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
        'shared': serializeParam(
          _shared,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ThreadSharedStruct fromSerializableMap(Map<String, dynamic> data) =>
      ThreadSharedStruct(
        threadRef: deserializeParam(
          data['threadRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Threads'],
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
        shared: deserializeStructParam(
          data['shared'],
          ParamType.DataStruct,
          false,
          structBuilder: ThreadSharedStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ThreadSharedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ThreadSharedStruct &&
        threadRef == other.threadRef &&
        count == other.count &&
        shared == other.shared;
  }

  @override
  int get hashCode => const ListEquality().hash([threadRef, count, shared]);
}

ThreadSharedStruct createThreadSharedStruct({
  DocumentReference? threadRef,
  int? count,
  ThreadSharedStruct? shared,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ThreadSharedStruct(
      threadRef: threadRef,
      count: count,
      shared: shared ?? (clearUnsetFields ? ThreadSharedStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ThreadSharedStruct? updateThreadSharedStruct(
  ThreadSharedStruct? threadShared, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    threadShared
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addThreadSharedStructData(
  Map<String, dynamic> firestoreData,
  ThreadSharedStruct? threadShared,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (threadShared == null) {
    return;
  }
  if (threadShared.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && threadShared.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final threadSharedData =
      getThreadSharedFirestoreData(threadShared, forFieldValue);
  final nestedData =
      threadSharedData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = threadShared.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getThreadSharedFirestoreData(
  ThreadSharedStruct? threadShared, [
  bool forFieldValue = false,
]) {
  if (threadShared == null) {
    return {};
  }
  final firestoreData = mapToFirestore(threadShared.toMap());

  // Handle nested data for "shared" field.
  addThreadSharedStructData(
    firestoreData,
    threadShared.hasShared() ? threadShared.shared : null,
    'shared',
    forFieldValue,
  );

  // Add any Firestore field values
  threadShared.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getThreadSharedListFirestoreData(
  List<ThreadSharedStruct>? threadShareds,
) =>
    threadShareds?.map((e) => getThreadSharedFirestoreData(e, true)).toList() ??
    [];
