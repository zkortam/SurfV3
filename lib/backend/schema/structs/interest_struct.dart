// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class InterestStruct extends FFFirebaseStruct {
  InterestStruct({
    String? interestname,
    double? interestpercentage,
    int? slidermax,
    int? slidermin,
    int? sliderval,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _interestname = interestname,
        _interestpercentage = interestpercentage,
        _slidermax = slidermax,
        _slidermin = slidermin,
        _sliderval = sliderval,
        super(firestoreUtilData);

  // "interestname" field.
  String? _interestname;
  String get interestname => _interestname ?? 'HI';
  set interestname(String? val) => _interestname = val;

  bool hasInterestname() => _interestname != null;

  // "interestpercentage" field.
  double? _interestpercentage;
  double get interestpercentage => _interestpercentage ?? 0.0;
  set interestpercentage(double? val) => _interestpercentage = val;

  void incrementInterestpercentage(double amount) =>
      interestpercentage = interestpercentage + amount;

  bool hasInterestpercentage() => _interestpercentage != null;

  // "slidermax" field.
  int? _slidermax;
  int get slidermax => _slidermax ?? 100;
  set slidermax(int? val) => _slidermax = val;

  void incrementSlidermax(int amount) => slidermax = slidermax + amount;

  bool hasSlidermax() => _slidermax != null;

  // "slidermin" field.
  int? _slidermin;
  int get slidermin => _slidermin ?? 0;
  set slidermin(int? val) => _slidermin = val;

  void incrementSlidermin(int amount) => slidermin = slidermin + amount;

  bool hasSlidermin() => _slidermin != null;

  // "sliderval" field.
  int? _sliderval;
  int get sliderval => _sliderval ?? 0;
  set sliderval(int? val) => _sliderval = val;

  void incrementSliderval(int amount) => sliderval = sliderval + amount;

  bool hasSliderval() => _sliderval != null;

  static InterestStruct fromMap(Map<String, dynamic> data) => InterestStruct(
        interestname: data['interestname'] as String?,
        interestpercentage: castToType<double>(data['interestpercentage']),
        slidermax: castToType<int>(data['slidermax']),
        slidermin: castToType<int>(data['slidermin']),
        sliderval: castToType<int>(data['sliderval']),
      );

  static InterestStruct? maybeFromMap(dynamic data) =>
      data is Map ? InterestStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'interestname': _interestname,
        'interestpercentage': _interestpercentage,
        'slidermax': _slidermax,
        'slidermin': _slidermin,
        'sliderval': _sliderval,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'interestname': serializeParam(
          _interestname,
          ParamType.String,
        ),
        'interestpercentage': serializeParam(
          _interestpercentage,
          ParamType.double,
        ),
        'slidermax': serializeParam(
          _slidermax,
          ParamType.int,
        ),
        'slidermin': serializeParam(
          _slidermin,
          ParamType.int,
        ),
        'sliderval': serializeParam(
          _sliderval,
          ParamType.int,
        ),
      }.withoutNulls;

  static InterestStruct fromSerializableMap(Map<String, dynamic> data) =>
      InterestStruct(
        interestname: deserializeParam(
          data['interestname'],
          ParamType.String,
          false,
        ),
        interestpercentage: deserializeParam(
          data['interestpercentage'],
          ParamType.double,
          false,
        ),
        slidermax: deserializeParam(
          data['slidermax'],
          ParamType.int,
          false,
        ),
        slidermin: deserializeParam(
          data['slidermin'],
          ParamType.int,
          false,
        ),
        sliderval: deserializeParam(
          data['sliderval'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'InterestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InterestStruct &&
        interestname == other.interestname &&
        interestpercentage == other.interestpercentage &&
        slidermax == other.slidermax &&
        slidermin == other.slidermin &&
        sliderval == other.sliderval;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [interestname, interestpercentage, slidermax, slidermin, sliderval]);
}

InterestStruct createInterestStruct({
  String? interestname,
  double? interestpercentage,
  int? slidermax,
  int? slidermin,
  int? sliderval,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InterestStruct(
      interestname: interestname,
      interestpercentage: interestpercentage,
      slidermax: slidermax,
      slidermin: slidermin,
      sliderval: sliderval,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InterestStruct? updateInterestStruct(
  InterestStruct? interest, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    interest
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInterestStructData(
  Map<String, dynamic> firestoreData,
  InterestStruct? interest,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (interest == null) {
    return;
  }
  if (interest.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && interest.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final interestData = getInterestFirestoreData(interest, forFieldValue);
  final nestedData = interestData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = interest.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInterestFirestoreData(
  InterestStruct? interest, [
  bool forFieldValue = false,
]) {
  if (interest == null) {
    return {};
  }
  final firestoreData = mapToFirestore(interest.toMap());

  // Add any Firestore field values
  interest.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInterestListFirestoreData(
  List<InterestStruct>? interests,
) =>
    interests?.map((e) => getInterestFirestoreData(e, true)).toList() ?? [];
