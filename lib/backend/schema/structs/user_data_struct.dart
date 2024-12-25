// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDataStruct extends FFFirebaseStruct {
  UserDataStruct({
    PostInteractionsStruct? postInteractions,
    ShortInteractionsStruct? shortInteractions,
    ThreadInteractionsStruct? threadInteractions,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _postInteractions = postInteractions,
        _shortInteractions = shortInteractions,
        _threadInteractions = threadInteractions,
        super(firestoreUtilData);

  // "postInteractions" field.
  PostInteractionsStruct? _postInteractions;
  PostInteractionsStruct get postInteractions =>
      _postInteractions ?? PostInteractionsStruct();
  set postInteractions(PostInteractionsStruct? val) => _postInteractions = val;

  void updatePostInteractions(Function(PostInteractionsStruct) updateFn) {
    updateFn(_postInteractions ??= PostInteractionsStruct());
  }

  bool hasPostInteractions() => _postInteractions != null;

  // "shortInteractions" field.
  ShortInteractionsStruct? _shortInteractions;
  ShortInteractionsStruct get shortInteractions =>
      _shortInteractions ?? ShortInteractionsStruct();
  set shortInteractions(ShortInteractionsStruct? val) =>
      _shortInteractions = val;

  void updateShortInteractions(Function(ShortInteractionsStruct) updateFn) {
    updateFn(_shortInteractions ??= ShortInteractionsStruct());
  }

  bool hasShortInteractions() => _shortInteractions != null;

  // "threadInteractions" field.
  ThreadInteractionsStruct? _threadInteractions;
  ThreadInteractionsStruct get threadInteractions =>
      _threadInteractions ?? ThreadInteractionsStruct();
  set threadInteractions(ThreadInteractionsStruct? val) =>
      _threadInteractions = val;

  void updateThreadInteractions(Function(ThreadInteractionsStruct) updateFn) {
    updateFn(_threadInteractions ??= ThreadInteractionsStruct());
  }

  bool hasThreadInteractions() => _threadInteractions != null;

  static UserDataStruct fromMap(Map<String, dynamic> data) => UserDataStruct(
        postInteractions: data['postInteractions'] is PostInteractionsStruct
            ? data['postInteractions']
            : PostInteractionsStruct.maybeFromMap(data['postInteractions']),
        shortInteractions: data['shortInteractions'] is ShortInteractionsStruct
            ? data['shortInteractions']
            : ShortInteractionsStruct.maybeFromMap(data['shortInteractions']),
        threadInteractions: data['threadInteractions']
                is ThreadInteractionsStruct
            ? data['threadInteractions']
            : ThreadInteractionsStruct.maybeFromMap(data['threadInteractions']),
      );

  static UserDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'postInteractions': _postInteractions?.toMap(),
        'shortInteractions': _shortInteractions?.toMap(),
        'threadInteractions': _threadInteractions?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'postInteractions': serializeParam(
          _postInteractions,
          ParamType.DataStruct,
        ),
        'shortInteractions': serializeParam(
          _shortInteractions,
          ParamType.DataStruct,
        ),
        'threadInteractions': serializeParam(
          _threadInteractions,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static UserDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserDataStruct(
        postInteractions: deserializeStructParam(
          data['postInteractions'],
          ParamType.DataStruct,
          false,
          structBuilder: PostInteractionsStruct.fromSerializableMap,
        ),
        shortInteractions: deserializeStructParam(
          data['shortInteractions'],
          ParamType.DataStruct,
          false,
          structBuilder: ShortInteractionsStruct.fromSerializableMap,
        ),
        threadInteractions: deserializeStructParam(
          data['threadInteractions'],
          ParamType.DataStruct,
          false,
          structBuilder: ThreadInteractionsStruct.fromSerializableMap,
        ),
      );

  static UserDataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserDataStruct(
        postInteractions: convertAlgoliaParam(
          data['postInteractions'],
          ParamType.DataStruct,
          false,
          structBuilder: PostInteractionsStruct.fromAlgoliaData,
        ),
        shortInteractions: convertAlgoliaParam(
          data['shortInteractions'],
          ParamType.DataStruct,
          false,
          structBuilder: ShortInteractionsStruct.fromAlgoliaData,
        ),
        threadInteractions: convertAlgoliaParam(
          data['threadInteractions'],
          ParamType.DataStruct,
          false,
          structBuilder: ThreadInteractionsStruct.fromAlgoliaData,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserDataStruct &&
        postInteractions == other.postInteractions &&
        shortInteractions == other.shortInteractions &&
        threadInteractions == other.threadInteractions;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([postInteractions, shortInteractions, threadInteractions]);
}

UserDataStruct createUserDataStruct({
  PostInteractionsStruct? postInteractions,
  ShortInteractionsStruct? shortInteractions,
  ThreadInteractionsStruct? threadInteractions,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserDataStruct(
      postInteractions: postInteractions ??
          (clearUnsetFields ? PostInteractionsStruct() : null),
      shortInteractions: shortInteractions ??
          (clearUnsetFields ? ShortInteractionsStruct() : null),
      threadInteractions: threadInteractions ??
          (clearUnsetFields ? ThreadInteractionsStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserDataStruct? updateUserDataStruct(
  UserDataStruct? userData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserDataStructData(
  Map<String, dynamic> firestoreData,
  UserDataStruct? userData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userData == null) {
    return;
  }
  if (userData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userDataData = getUserDataFirestoreData(userData, forFieldValue);
  final nestedData = userDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserDataFirestoreData(
  UserDataStruct? userData, [
  bool forFieldValue = false,
]) {
  if (userData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userData.toMap());

  // Handle nested data for "postInteractions" field.
  addPostInteractionsStructData(
    firestoreData,
    userData.hasPostInteractions() ? userData.postInteractions : null,
    'postInteractions',
    forFieldValue,
  );

  // Handle nested data for "shortInteractions" field.
  addShortInteractionsStructData(
    firestoreData,
    userData.hasShortInteractions() ? userData.shortInteractions : null,
    'shortInteractions',
    forFieldValue,
  );

  // Handle nested data for "threadInteractions" field.
  addThreadInteractionsStructData(
    firestoreData,
    userData.hasThreadInteractions() ? userData.threadInteractions : null,
    'threadInteractions',
    forFieldValue,
  );

  // Add any Firestore field values
  userData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserDataListFirestoreData(
  List<UserDataStruct>? userDatas,
) =>
    userDatas?.map((e) => getUserDataFirestoreData(e, true)).toList() ?? [];
