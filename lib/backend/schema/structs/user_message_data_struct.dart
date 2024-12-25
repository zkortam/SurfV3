// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserMessageDataStruct extends FFFirebaseStruct {
  UserMessageDataStruct({
    DocumentReference? userReference,
    DateTime? lastTimeOnline,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userReference = userReference,
        _lastTimeOnline = lastTimeOnline,
        super(firestoreUtilData);

  // "userReference" field.
  DocumentReference? _userReference;
  DocumentReference? get userReference => _userReference;
  set userReference(DocumentReference? val) => _userReference = val;

  bool hasUserReference() => _userReference != null;

  // "lastTimeOnline" field.
  DateTime? _lastTimeOnline;
  DateTime? get lastTimeOnline => _lastTimeOnline;
  set lastTimeOnline(DateTime? val) => _lastTimeOnline = val;

  bool hasLastTimeOnline() => _lastTimeOnline != null;

  static UserMessageDataStruct fromMap(Map<String, dynamic> data) =>
      UserMessageDataStruct(
        userReference: data['userReference'] as DocumentReference?,
        lastTimeOnline: data['lastTimeOnline'] as DateTime?,
      );

  static UserMessageDataStruct? maybeFromMap(dynamic data) => data is Map
      ? UserMessageDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'userReference': _userReference,
        'lastTimeOnline': _lastTimeOnline,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userReference': serializeParam(
          _userReference,
          ParamType.DocumentReference,
        ),
        'lastTimeOnline': serializeParam(
          _lastTimeOnline,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static UserMessageDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserMessageDataStruct(
        userReference: deserializeParam(
          data['userReference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        lastTimeOnline: deserializeParam(
          data['lastTimeOnline'],
          ParamType.DateTime,
          false,
        ),
      );

  static UserMessageDataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserMessageDataStruct(
        userReference: convertAlgoliaParam(
          data['userReference'],
          ParamType.DocumentReference,
          false,
        ),
        lastTimeOnline: convertAlgoliaParam(
          data['lastTimeOnline'],
          ParamType.DateTime,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserMessageDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserMessageDataStruct &&
        userReference == other.userReference &&
        lastTimeOnline == other.lastTimeOnline;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([userReference, lastTimeOnline]);
}

UserMessageDataStruct createUserMessageDataStruct({
  DocumentReference? userReference,
  DateTime? lastTimeOnline,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserMessageDataStruct(
      userReference: userReference,
      lastTimeOnline: lastTimeOnline,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserMessageDataStruct? updateUserMessageDataStruct(
  UserMessageDataStruct? userMessageData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userMessageData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserMessageDataStructData(
  Map<String, dynamic> firestoreData,
  UserMessageDataStruct? userMessageData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userMessageData == null) {
    return;
  }
  if (userMessageData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userMessageData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userMessageDataData =
      getUserMessageDataFirestoreData(userMessageData, forFieldValue);
  final nestedData =
      userMessageDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userMessageData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserMessageDataFirestoreData(
  UserMessageDataStruct? userMessageData, [
  bool forFieldValue = false,
]) {
  if (userMessageData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userMessageData.toMap());

  // Add any Firestore field values
  userMessageData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserMessageDataListFirestoreData(
  List<UserMessageDataStruct>? userMessageDatas,
) =>
    userMessageDatas
        ?.map((e) => getUserMessageDataFirestoreData(e, true))
        .toList() ??
    [];
