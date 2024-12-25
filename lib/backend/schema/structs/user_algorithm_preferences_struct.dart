// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserAlgorithmPreferencesStruct extends FFFirebaseStruct {
  UserAlgorithmPreferencesStruct({
    double? vulgarity,
    double? politicalView,
    double? informativeness,
    double? toxicity,
    double? relevance,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _vulgarity = vulgarity,
        _politicalView = politicalView,
        _informativeness = informativeness,
        _toxicity = toxicity,
        _relevance = relevance,
        super(firestoreUtilData);

  // "vulgarity" field.
  double? _vulgarity;
  double get vulgarity => _vulgarity ?? 0.0;
  set vulgarity(double? val) => _vulgarity = val;

  void incrementVulgarity(double amount) => vulgarity = vulgarity + amount;

  bool hasVulgarity() => _vulgarity != null;

  // "politicalView" field.
  double? _politicalView;
  double get politicalView => _politicalView ?? 0.0;
  set politicalView(double? val) => _politicalView = val;

  void incrementPoliticalView(double amount) =>
      politicalView = politicalView + amount;

  bool hasPoliticalView() => _politicalView != null;

  // "informativeness" field.
  double? _informativeness;
  double get informativeness => _informativeness ?? 0.0;
  set informativeness(double? val) => _informativeness = val;

  void incrementInformativeness(double amount) =>
      informativeness = informativeness + amount;

  bool hasInformativeness() => _informativeness != null;

  // "toxicity" field.
  double? _toxicity;
  double get toxicity => _toxicity ?? 0.0;
  set toxicity(double? val) => _toxicity = val;

  void incrementToxicity(double amount) => toxicity = toxicity + amount;

  bool hasToxicity() => _toxicity != null;

  // "relevance" field.
  double? _relevance;
  double get relevance => _relevance ?? 0.0;
  set relevance(double? val) => _relevance = val;

  void incrementRelevance(double amount) => relevance = relevance + amount;

  bool hasRelevance() => _relevance != null;

  static UserAlgorithmPreferencesStruct fromMap(Map<String, dynamic> data) =>
      UserAlgorithmPreferencesStruct(
        vulgarity: castToType<double>(data['vulgarity']),
        politicalView: castToType<double>(data['politicalView']),
        informativeness: castToType<double>(data['informativeness']),
        toxicity: castToType<double>(data['toxicity']),
        relevance: castToType<double>(data['relevance']),
      );

  static UserAlgorithmPreferencesStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? UserAlgorithmPreferencesStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'vulgarity': _vulgarity,
        'politicalView': _politicalView,
        'informativeness': _informativeness,
        'toxicity': _toxicity,
        'relevance': _relevance,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'vulgarity': serializeParam(
          _vulgarity,
          ParamType.double,
        ),
        'politicalView': serializeParam(
          _politicalView,
          ParamType.double,
        ),
        'informativeness': serializeParam(
          _informativeness,
          ParamType.double,
        ),
        'toxicity': serializeParam(
          _toxicity,
          ParamType.double,
        ),
        'relevance': serializeParam(
          _relevance,
          ParamType.double,
        ),
      }.withoutNulls;

  static UserAlgorithmPreferencesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserAlgorithmPreferencesStruct(
        vulgarity: deserializeParam(
          data['vulgarity'],
          ParamType.double,
          false,
        ),
        politicalView: deserializeParam(
          data['politicalView'],
          ParamType.double,
          false,
        ),
        informativeness: deserializeParam(
          data['informativeness'],
          ParamType.double,
          false,
        ),
        toxicity: deserializeParam(
          data['toxicity'],
          ParamType.double,
          false,
        ),
        relevance: deserializeParam(
          data['relevance'],
          ParamType.double,
          false,
        ),
      );

  static UserAlgorithmPreferencesStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      UserAlgorithmPreferencesStruct(
        vulgarity: convertAlgoliaParam(
          data['vulgarity'],
          ParamType.double,
          false,
        ),
        politicalView: convertAlgoliaParam(
          data['politicalView'],
          ParamType.double,
          false,
        ),
        informativeness: convertAlgoliaParam(
          data['informativeness'],
          ParamType.double,
          false,
        ),
        toxicity: convertAlgoliaParam(
          data['toxicity'],
          ParamType.double,
          false,
        ),
        relevance: convertAlgoliaParam(
          data['relevance'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserAlgorithmPreferencesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserAlgorithmPreferencesStruct &&
        vulgarity == other.vulgarity &&
        politicalView == other.politicalView &&
        informativeness == other.informativeness &&
        toxicity == other.toxicity &&
        relevance == other.relevance;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([vulgarity, politicalView, informativeness, toxicity, relevance]);
}

UserAlgorithmPreferencesStruct createUserAlgorithmPreferencesStruct({
  double? vulgarity,
  double? politicalView,
  double? informativeness,
  double? toxicity,
  double? relevance,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserAlgorithmPreferencesStruct(
      vulgarity: vulgarity,
      politicalView: politicalView,
      informativeness: informativeness,
      toxicity: toxicity,
      relevance: relevance,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserAlgorithmPreferencesStruct? updateUserAlgorithmPreferencesStruct(
  UserAlgorithmPreferencesStruct? userAlgorithmPreferences, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userAlgorithmPreferences
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserAlgorithmPreferencesStructData(
  Map<String, dynamic> firestoreData,
  UserAlgorithmPreferencesStruct? userAlgorithmPreferences,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userAlgorithmPreferences == null) {
    return;
  }
  if (userAlgorithmPreferences.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      userAlgorithmPreferences.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userAlgorithmPreferencesData = getUserAlgorithmPreferencesFirestoreData(
      userAlgorithmPreferences, forFieldValue);
  final nestedData =
      userAlgorithmPreferencesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      userAlgorithmPreferences.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserAlgorithmPreferencesFirestoreData(
  UserAlgorithmPreferencesStruct? userAlgorithmPreferences, [
  bool forFieldValue = false,
]) {
  if (userAlgorithmPreferences == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userAlgorithmPreferences.toMap());

  // Add any Firestore field values
  userAlgorithmPreferences.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserAlgorithmPreferencesListFirestoreData(
  List<UserAlgorithmPreferencesStruct>? userAlgorithmPreferencess,
) =>
    userAlgorithmPreferencess
        ?.map((e) => getUserAlgorithmPreferencesFirestoreData(e, true))
        .toList() ??
    [];
