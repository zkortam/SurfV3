// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FollowerGroupStruct extends FFFirebaseStruct {
  FollowerGroupStruct({
    String? name,
    Color? color,
    List<DocumentReference>? people,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _color = color,
        _people = people,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  // "people" field.
  List<DocumentReference>? _people;
  List<DocumentReference> get people => _people ?? const [];
  set people(List<DocumentReference>? val) => _people = val;

  void updatePeople(Function(List<DocumentReference>) updateFn) {
    updateFn(_people ??= []);
  }

  bool hasPeople() => _people != null;

  static FollowerGroupStruct fromMap(Map<String, dynamic> data) =>
      FollowerGroupStruct(
        name: data['name'] as String?,
        color: getSchemaColor(data['color']),
        people: getDataList(data['people']),
      );

  static FollowerGroupStruct? maybeFromMap(dynamic data) => data is Map
      ? FollowerGroupStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'color': _color,
        'people': _people,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'people': serializeParam(
          _people,
          ParamType.DocumentReference,
          isList: true,
        ),
      }.withoutNulls;

  static FollowerGroupStruct fromSerializableMap(Map<String, dynamic> data) =>
      FollowerGroupStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        people: deserializeParam<DocumentReference>(
          data['people'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['users'],
        ),
      );

  static FollowerGroupStruct fromAlgoliaData(Map<String, dynamic> data) =>
      FollowerGroupStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        color: convertAlgoliaParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        people: convertAlgoliaParam<DocumentReference>(
          data['people'],
          ParamType.DocumentReference,
          true,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'FollowerGroupStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FollowerGroupStruct &&
        name == other.name &&
        color == other.color &&
        listEquality.equals(people, other.people);
  }

  @override
  int get hashCode => const ListEquality().hash([name, color, people]);
}

FollowerGroupStruct createFollowerGroupStruct({
  String? name,
  Color? color,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FollowerGroupStruct(
      name: name,
      color: color,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FollowerGroupStruct? updateFollowerGroupStruct(
  FollowerGroupStruct? followerGroup, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    followerGroup
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFollowerGroupStructData(
  Map<String, dynamic> firestoreData,
  FollowerGroupStruct? followerGroup,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (followerGroup == null) {
    return;
  }
  if (followerGroup.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && followerGroup.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final followerGroupData =
      getFollowerGroupFirestoreData(followerGroup, forFieldValue);
  final nestedData =
      followerGroupData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = followerGroup.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFollowerGroupFirestoreData(
  FollowerGroupStruct? followerGroup, [
  bool forFieldValue = false,
]) {
  if (followerGroup == null) {
    return {};
  }
  final firestoreData = mapToFirestore(followerGroup.toMap());

  // Add any Firestore field values
  followerGroup.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFollowerGroupListFirestoreData(
  List<FollowerGroupStruct>? followerGroups,
) =>
    followerGroups
        ?.map((e) => getFollowerGroupFirestoreData(e, true))
        .toList() ??
    [];
