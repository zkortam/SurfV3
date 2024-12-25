// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserSettingsStruct extends FFFirebaseStruct {
  UserSettingsStruct({
    bool? isPushNotif,
    bool? isEmailNotif,
    bool? isSilent,
    bool? isSwipeFeed,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isPushNotif = isPushNotif,
        _isEmailNotif = isEmailNotif,
        _isSilent = isSilent,
        _isSwipeFeed = isSwipeFeed,
        super(firestoreUtilData);

  // "isPushNotif" field.
  bool? _isPushNotif;
  bool get isPushNotif => _isPushNotif ?? false;
  set isPushNotif(bool? val) => _isPushNotif = val;

  bool hasIsPushNotif() => _isPushNotif != null;

  // "isEmailNotif" field.
  bool? _isEmailNotif;
  bool get isEmailNotif => _isEmailNotif ?? false;
  set isEmailNotif(bool? val) => _isEmailNotif = val;

  bool hasIsEmailNotif() => _isEmailNotif != null;

  // "isSilent" field.
  bool? _isSilent;
  bool get isSilent => _isSilent ?? false;
  set isSilent(bool? val) => _isSilent = val;

  bool hasIsSilent() => _isSilent != null;

  // "isSwipeFeed" field.
  bool? _isSwipeFeed;
  bool get isSwipeFeed => _isSwipeFeed ?? false;
  set isSwipeFeed(bool? val) => _isSwipeFeed = val;

  bool hasIsSwipeFeed() => _isSwipeFeed != null;

  static UserSettingsStruct fromMap(Map<String, dynamic> data) =>
      UserSettingsStruct(
        isPushNotif: data['isPushNotif'] as bool?,
        isEmailNotif: data['isEmailNotif'] as bool?,
        isSilent: data['isSilent'] as bool?,
        isSwipeFeed: data['isSwipeFeed'] as bool?,
      );

  static UserSettingsStruct? maybeFromMap(dynamic data) => data is Map
      ? UserSettingsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'isPushNotif': _isPushNotif,
        'isEmailNotif': _isEmailNotif,
        'isSilent': _isSilent,
        'isSwipeFeed': _isSwipeFeed,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isPushNotif': serializeParam(
          _isPushNotif,
          ParamType.bool,
        ),
        'isEmailNotif': serializeParam(
          _isEmailNotif,
          ParamType.bool,
        ),
        'isSilent': serializeParam(
          _isSilent,
          ParamType.bool,
        ),
        'isSwipeFeed': serializeParam(
          _isSwipeFeed,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UserSettingsStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserSettingsStruct(
        isPushNotif: deserializeParam(
          data['isPushNotif'],
          ParamType.bool,
          false,
        ),
        isEmailNotif: deserializeParam(
          data['isEmailNotif'],
          ParamType.bool,
          false,
        ),
        isSilent: deserializeParam(
          data['isSilent'],
          ParamType.bool,
          false,
        ),
        isSwipeFeed: deserializeParam(
          data['isSwipeFeed'],
          ParamType.bool,
          false,
        ),
      );

  static UserSettingsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserSettingsStruct(
        isPushNotif: convertAlgoliaParam(
          data['isPushNotif'],
          ParamType.bool,
          false,
        ),
        isEmailNotif: convertAlgoliaParam(
          data['isEmailNotif'],
          ParamType.bool,
          false,
        ),
        isSilent: convertAlgoliaParam(
          data['isSilent'],
          ParamType.bool,
          false,
        ),
        isSwipeFeed: convertAlgoliaParam(
          data['isSwipeFeed'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserSettingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserSettingsStruct &&
        isPushNotif == other.isPushNotif &&
        isEmailNotif == other.isEmailNotif &&
        isSilent == other.isSilent &&
        isSwipeFeed == other.isSwipeFeed;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([isPushNotif, isEmailNotif, isSilent, isSwipeFeed]);
}

UserSettingsStruct createUserSettingsStruct({
  bool? isPushNotif,
  bool? isEmailNotif,
  bool? isSilent,
  bool? isSwipeFeed,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserSettingsStruct(
      isPushNotif: isPushNotif,
      isEmailNotif: isEmailNotif,
      isSilent: isSilent,
      isSwipeFeed: isSwipeFeed,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserSettingsStruct? updateUserSettingsStruct(
  UserSettingsStruct? userSettings, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userSettings
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserSettingsStructData(
  Map<String, dynamic> firestoreData,
  UserSettingsStruct? userSettings,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userSettings == null) {
    return;
  }
  if (userSettings.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userSettings.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userSettingsData =
      getUserSettingsFirestoreData(userSettings, forFieldValue);
  final nestedData =
      userSettingsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userSettings.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserSettingsFirestoreData(
  UserSettingsStruct? userSettings, [
  bool forFieldValue = false,
]) {
  if (userSettings == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userSettings.toMap());

  // Add any Firestore field values
  userSettings.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserSettingsListFirestoreData(
  List<UserSettingsStruct>? userSettingss,
) =>
    userSettingss?.map((e) => getUserSettingsFirestoreData(e, true)).toList() ??
    [];
