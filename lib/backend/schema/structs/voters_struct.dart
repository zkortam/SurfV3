// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class VotersStruct extends FFFirebaseStruct {
  VotersStruct({
    DocumentReference? userReference,
    int? voteValue,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userReference = userReference,
        _voteValue = voteValue,
        super(firestoreUtilData);

  // "UserReference" field.
  DocumentReference? _userReference;
  DocumentReference? get userReference => _userReference;
  set userReference(DocumentReference? val) => _userReference = val;

  bool hasUserReference() => _userReference != null;

  // "VoteValue" field.
  int? _voteValue;
  int get voteValue => _voteValue ?? 0;
  set voteValue(int? val) => _voteValue = val;

  void incrementVoteValue(int amount) => voteValue = voteValue + amount;

  bool hasVoteValue() => _voteValue != null;

  static VotersStruct fromMap(Map<String, dynamic> data) => VotersStruct(
        userReference: data['UserReference'] as DocumentReference?,
        voteValue: castToType<int>(data['VoteValue']),
      );

  static VotersStruct? maybeFromMap(dynamic data) =>
      data is Map ? VotersStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'UserReference': _userReference,
        'VoteValue': _voteValue,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'UserReference': serializeParam(
          _userReference,
          ParamType.DocumentReference,
        ),
        'VoteValue': serializeParam(
          _voteValue,
          ParamType.int,
        ),
      }.withoutNulls;

  static VotersStruct fromSerializableMap(Map<String, dynamic> data) =>
      VotersStruct(
        userReference: deserializeParam(
          data['UserReference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        voteValue: deserializeParam(
          data['VoteValue'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'VotersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VotersStruct &&
        userReference == other.userReference &&
        voteValue == other.voteValue;
  }

  @override
  int get hashCode => const ListEquality().hash([userReference, voteValue]);
}

VotersStruct createVotersStruct({
  DocumentReference? userReference,
  int? voteValue,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VotersStruct(
      userReference: userReference,
      voteValue: voteValue,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VotersStruct? updateVotersStruct(
  VotersStruct? voters, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    voters
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVotersStructData(
  Map<String, dynamic> firestoreData,
  VotersStruct? voters,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (voters == null) {
    return;
  }
  if (voters.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && voters.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final votersData = getVotersFirestoreData(voters, forFieldValue);
  final nestedData = votersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = voters.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVotersFirestoreData(
  VotersStruct? voters, [
  bool forFieldValue = false,
]) {
  if (voters == null) {
    return {};
  }
  final firestoreData = mapToFirestore(voters.toMap());

  // Add any Firestore field values
  voters.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVotersListFirestoreData(
  List<VotersStruct>? voterss,
) =>
    voterss?.map((e) => getVotersFirestoreData(e, true)).toList() ?? [];
