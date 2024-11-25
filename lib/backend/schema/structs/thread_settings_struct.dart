// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThreadSettingsStruct extends FFFirebaseStruct {
  ThreadSettingsStruct({
    bool? isStealth,
    bool? isAutoBeautification,
    bool? isComments,
    bool? isPrivate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isStealth = isStealth,
        _isAutoBeautification = isAutoBeautification,
        _isComments = isComments,
        _isPrivate = isPrivate,
        super(firestoreUtilData);

  // "isStealth" field.
  bool? _isStealth;
  bool get isStealth => _isStealth ?? false;
  set isStealth(bool? val) => _isStealth = val;

  bool hasIsStealth() => _isStealth != null;

  // "isAutoBeautification" field.
  bool? _isAutoBeautification;
  bool get isAutoBeautification => _isAutoBeautification ?? false;
  set isAutoBeautification(bool? val) => _isAutoBeautification = val;

  bool hasIsAutoBeautification() => _isAutoBeautification != null;

  // "isComments" field.
  bool? _isComments;
  bool get isComments => _isComments ?? false;
  set isComments(bool? val) => _isComments = val;

  bool hasIsComments() => _isComments != null;

  // "isPrivate" field.
  bool? _isPrivate;
  bool get isPrivate => _isPrivate ?? false;
  set isPrivate(bool? val) => _isPrivate = val;

  bool hasIsPrivate() => _isPrivate != null;

  static ThreadSettingsStruct fromMap(Map<String, dynamic> data) =>
      ThreadSettingsStruct(
        isStealth: data['isStealth'] as bool?,
        isAutoBeautification: data['isAutoBeautification'] as bool?,
        isComments: data['isComments'] as bool?,
        isPrivate: data['isPrivate'] as bool?,
      );

  static ThreadSettingsStruct? maybeFromMap(dynamic data) => data is Map
      ? ThreadSettingsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'isStealth': _isStealth,
        'isAutoBeautification': _isAutoBeautification,
        'isComments': _isComments,
        'isPrivate': _isPrivate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isStealth': serializeParam(
          _isStealth,
          ParamType.bool,
        ),
        'isAutoBeautification': serializeParam(
          _isAutoBeautification,
          ParamType.bool,
        ),
        'isComments': serializeParam(
          _isComments,
          ParamType.bool,
        ),
        'isPrivate': serializeParam(
          _isPrivate,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ThreadSettingsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ThreadSettingsStruct(
        isStealth: deserializeParam(
          data['isStealth'],
          ParamType.bool,
          false,
        ),
        isAutoBeautification: deserializeParam(
          data['isAutoBeautification'],
          ParamType.bool,
          false,
        ),
        isComments: deserializeParam(
          data['isComments'],
          ParamType.bool,
          false,
        ),
        isPrivate: deserializeParam(
          data['isPrivate'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ThreadSettingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ThreadSettingsStruct &&
        isStealth == other.isStealth &&
        isAutoBeautification == other.isAutoBeautification &&
        isComments == other.isComments &&
        isPrivate == other.isPrivate;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([isStealth, isAutoBeautification, isComments, isPrivate]);
}

ThreadSettingsStruct createThreadSettingsStruct({
  bool? isStealth,
  bool? isAutoBeautification,
  bool? isComments,
  bool? isPrivate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ThreadSettingsStruct(
      isStealth: isStealth,
      isAutoBeautification: isAutoBeautification,
      isComments: isComments,
      isPrivate: isPrivate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ThreadSettingsStruct? updateThreadSettingsStruct(
  ThreadSettingsStruct? threadSettings, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    threadSettings
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addThreadSettingsStructData(
  Map<String, dynamic> firestoreData,
  ThreadSettingsStruct? threadSettings,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (threadSettings == null) {
    return;
  }
  if (threadSettings.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && threadSettings.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final threadSettingsData =
      getThreadSettingsFirestoreData(threadSettings, forFieldValue);
  final nestedData =
      threadSettingsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = threadSettings.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getThreadSettingsFirestoreData(
  ThreadSettingsStruct? threadSettings, [
  bool forFieldValue = false,
]) {
  if (threadSettings == null) {
    return {};
  }
  final firestoreData = mapToFirestore(threadSettings.toMap());

  // Add any Firestore field values
  threadSettings.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getThreadSettingsListFirestoreData(
  List<ThreadSettingsStruct>? threadSettingss,
) =>
    threadSettingss
        ?.map((e) => getThreadSettingsFirestoreData(e, true))
        .toList() ??
    [];
