// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserdataStruct extends FFFirebaseStruct {
  UserdataStruct({
    List<String>? ipAddresses,
    List<DocumentReference>? friends,
    List<DocumentReference>? feedback,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ipAddresses = ipAddresses,
        _friends = friends,
        _feedback = feedback,
        super(firestoreUtilData);

  // "ip_addresses" field.
  List<String>? _ipAddresses;
  List<String> get ipAddresses => _ipAddresses ?? const [];
  set ipAddresses(List<String>? val) => _ipAddresses = val;

  void updateIpAddresses(Function(List<String>) updateFn) {
    updateFn(_ipAddresses ??= []);
  }

  bool hasIpAddresses() => _ipAddresses != null;

  // "friends" field.
  List<DocumentReference>? _friends;
  List<DocumentReference> get friends => _friends ?? const [];
  set friends(List<DocumentReference>? val) => _friends = val;

  void updateFriends(Function(List<DocumentReference>) updateFn) {
    updateFn(_friends ??= []);
  }

  bool hasFriends() => _friends != null;

  // "feedback" field.
  List<DocumentReference>? _feedback;
  List<DocumentReference> get feedback => _feedback ?? const [];
  set feedback(List<DocumentReference>? val) => _feedback = val;

  void updateFeedback(Function(List<DocumentReference>) updateFn) {
    updateFn(_feedback ??= []);
  }

  bool hasFeedback() => _feedback != null;

  static UserdataStruct fromMap(Map<String, dynamic> data) => UserdataStruct(
        ipAddresses: getDataList(data['ip_addresses']),
        friends: getDataList(data['friends']),
        feedback: getDataList(data['feedback']),
      );

  static UserdataStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserdataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'ip_addresses': _ipAddresses,
        'friends': _friends,
        'feedback': _feedback,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ip_addresses': serializeParam(
          _ipAddresses,
          ParamType.String,
          isList: true,
        ),
        'friends': serializeParam(
          _friends,
          ParamType.DocumentReference,
          isList: true,
        ),
        'feedback': serializeParam(
          _feedback,
          ParamType.DocumentReference,
          isList: true,
        ),
      }.withoutNulls;

  static UserdataStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserdataStruct(
        ipAddresses: deserializeParam<String>(
          data['ip_addresses'],
          ParamType.String,
          true,
        ),
        friends: deserializeParam<DocumentReference>(
          data['friends'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['users'],
        ),
        feedback: deserializeParam<DocumentReference>(
          data['feedback'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['feedback'],
        ),
      );

  @override
  String toString() => 'UserdataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserdataStruct &&
        listEquality.equals(ipAddresses, other.ipAddresses) &&
        listEquality.equals(friends, other.friends) &&
        listEquality.equals(feedback, other.feedback);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([ipAddresses, friends, feedback]);
}

UserdataStruct createUserdataStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserdataStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserdataStruct? updateUserdataStruct(
  UserdataStruct? userdata, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userdata
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserdataStructData(
  Map<String, dynamic> firestoreData,
  UserdataStruct? userdata,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userdata == null) {
    return;
  }
  if (userdata.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userdata.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userdataData = getUserdataFirestoreData(userdata, forFieldValue);
  final nestedData = userdataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userdata.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserdataFirestoreData(
  UserdataStruct? userdata, [
  bool forFieldValue = false,
]) {
  if (userdata == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userdata.toMap());

  // Add any Firestore field values
  userdata.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserdataListFirestoreData(
  List<UserdataStruct>? userdatas,
) =>
    userdatas?.map((e) => getUserdataFirestoreData(e, true)).toList() ?? [];
