// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PollStruct extends FFFirebaseStruct {
  PollStruct({
    bool? isPoll,
    List<String>? options,
    List<VotersStruct>? voters,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isPoll = isPoll,
        _options = options,
        _voters = voters,
        super(firestoreUtilData);

  // "isPoll" field.
  bool? _isPoll;
  bool get isPoll => _isPoll ?? false;
  set isPoll(bool? val) => _isPoll = val;

  bool hasIsPoll() => _isPoll != null;

  // "options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  set options(List<String>? val) => _options = val;

  void updateOptions(Function(List<String>) updateFn) {
    updateFn(_options ??= []);
  }

  bool hasOptions() => _options != null;

  // "voters" field.
  List<VotersStruct>? _voters;
  List<VotersStruct> get voters => _voters ?? const [];
  set voters(List<VotersStruct>? val) => _voters = val;

  void updateVoters(Function(List<VotersStruct>) updateFn) {
    updateFn(_voters ??= []);
  }

  bool hasVoters() => _voters != null;

  static PollStruct fromMap(Map<String, dynamic> data) => PollStruct(
        isPoll: data['isPoll'] as bool?,
        options: getDataList(data['options']),
        voters: getStructList(
          data['voters'],
          VotersStruct.fromMap,
        ),
      );

  static PollStruct? maybeFromMap(dynamic data) =>
      data is Map ? PollStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'isPoll': _isPoll,
        'options': _options,
        'voters': _voters?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isPoll': serializeParam(
          _isPoll,
          ParamType.bool,
        ),
        'options': serializeParam(
          _options,
          ParamType.String,
          isList: true,
        ),
        'voters': serializeParam(
          _voters,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static PollStruct fromSerializableMap(Map<String, dynamic> data) =>
      PollStruct(
        isPoll: deserializeParam(
          data['isPoll'],
          ParamType.bool,
          false,
        ),
        options: deserializeParam<String>(
          data['options'],
          ParamType.String,
          true,
        ),
        voters: deserializeStructParam<VotersStruct>(
          data['voters'],
          ParamType.DataStruct,
          true,
          structBuilder: VotersStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'PollStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PollStruct &&
        isPoll == other.isPoll &&
        listEquality.equals(options, other.options) &&
        listEquality.equals(voters, other.voters);
  }

  @override
  int get hashCode => const ListEquality().hash([isPoll, options, voters]);
}

PollStruct createPollStruct({
  bool? isPoll,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PollStruct(
      isPoll: isPoll,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PollStruct? updatePollStruct(
  PollStruct? poll, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    poll
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPollStructData(
  Map<String, dynamic> firestoreData,
  PollStruct? poll,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (poll == null) {
    return;
  }
  if (poll.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && poll.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pollData = getPollFirestoreData(poll, forFieldValue);
  final nestedData = pollData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = poll.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPollFirestoreData(
  PollStruct? poll, [
  bool forFieldValue = false,
]) {
  if (poll == null) {
    return {};
  }
  final firestoreData = mapToFirestore(poll.toMap());

  // Add any Firestore field values
  poll.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPollListFirestoreData(
  List<PollStruct>? polls,
) =>
    polls?.map((e) => getPollFirestoreData(e, true)).toList() ?? [];
