import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "banner" field.
  String? _banner;
  String get banner => _banner ?? '';
  bool hasBanner() => _banner != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "pin" field.
  String? _pin;
  String get pin => _pin ?? '';
  bool hasPin() => _pin != null;

  // "isBiometric" field.
  bool? _isBiometric;
  bool get isBiometric => _isBiometric ?? false;
  bool hasIsBiometric() => _isBiometric != null;

  // "isAnon" field.
  bool? _isAnon;
  bool get isAnon => _isAnon ?? false;
  bool hasIsAnon() => _isAnon != null;

  // "dob" field.
  DateTime? _dob;
  DateTime? get dob => _dob;
  bool hasDob() => _dob != null;

  // "isStealth" field.
  bool? _isStealth;
  bool get isStealth => _isStealth ?? false;
  bool hasIsStealth() => _isStealth != null;

  // "ip_address" field.
  String? _ipAddress;
  String get ipAddress => _ipAddress ?? '';
  bool hasIpAddress() => _ipAddress != null;

  // "dir_feedback" field.
  List<String>? _dirFeedback;
  List<String> get dirFeedback => _dirFeedback ?? const [];
  bool hasDirFeedback() => _dirFeedback != null;

  // "device_type" field.
  bool? _deviceType;
  bool get deviceType => _deviceType ?? false;
  bool hasDeviceType() => _deviceType != null;

  // "threadSettings" field.
  ThreadSettingsStruct? _threadSettings;
  ThreadSettingsStruct get threadSettings =>
      _threadSettings ?? ThreadSettingsStruct();
  bool hasThreadSettings() => _threadSettings != null;

  // "followers" field.
  List<DocumentReference>? _followers;
  List<DocumentReference> get followers => _followers ?? const [];
  bool hasFollowers() => _followers != null;

  // "following" field.
  List<DocumentReference>? _following;
  List<DocumentReference> get following => _following ?? const [];
  bool hasFollowing() => _following != null;

  // "algorithmPreferences" field.
  UserAlgorithmPreferencesStruct? _algorithmPreferences;
  UserAlgorithmPreferencesStruct get algorithmPreferences =>
      _algorithmPreferences ?? UserAlgorithmPreferencesStruct();
  bool hasAlgorithmPreferences() => _algorithmPreferences != null;

  // "vibe" field.
  int? _vibe;
  int get vibe => _vibe ?? 0;
  bool hasVibe() => _vibe != null;

  // "latestSnippetTime" field.
  DateTime? _latestSnippetTime;
  DateTime? get latestSnippetTime => _latestSnippetTime;
  bool hasLatestSnippetTime() => _latestSnippetTime != null;

  // "groups" field.
  List<FollowerGroupStruct>? _groups;
  List<FollowerGroupStruct> get groups => _groups ?? const [];
  bool hasGroups() => _groups != null;

  // "userSettings" field.
  UserSettingsStruct? _userSettings;
  UserSettingsStruct get userSettings => _userSettings ?? UserSettingsStruct();
  bool hasUserSettings() => _userSettings != null;

  // "blocked" field.
  List<DocumentReference>? _blocked;
  List<DocumentReference> get blocked => _blocked ?? const [];
  bool hasBlocked() => _blocked != null;

  // "userData" field.
  UserDataStruct? _userData;
  UserDataStruct get userData => _userData ?? UserDataStruct();
  bool hasUserData() => _userData != null;

  // "postInteractions" field.
  PostInteractionsStruct? _postInteractions;
  PostInteractionsStruct get postInteractions =>
      _postInteractions ?? PostInteractionsStruct();
  bool hasPostInteractions() => _postInteractions != null;

  // "threadInteractions" field.
  ThreadInteractionsStruct? _threadInteractions;
  ThreadInteractionsStruct get threadInteractions =>
      _threadInteractions ?? ThreadInteractionsStruct();
  bool hasThreadInteractions() => _threadInteractions != null;

  // "shortInteractions" field.
  ShortInteractionsStruct? _shortInteractions;
  ShortInteractionsStruct get shortInteractions =>
      _shortInteractions ?? ShortInteractionsStruct();
  bool hasShortInteractions() => _shortInteractions != null;

  // "notifications" field.
  List<NotificationStruct>? _notifications;
  List<NotificationStruct> get notifications => _notifications ?? const [];
  bool hasNotifications() => _notifications != null;

  // "notificationsReferences" field.
  List<DocumentReference>? _notificationsReferences;
  List<DocumentReference> get notificationsReferences =>
      _notificationsReferences ?? const [];
  bool hasNotificationsReferences() => _notificationsReferences != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _name = snapshotData['name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _banner = snapshotData['banner'] as String?;
    _bio = snapshotData['bio'] as String?;
    _pin = snapshotData['pin'] as String?;
    _isBiometric = snapshotData['isBiometric'] as bool?;
    _isAnon = snapshotData['isAnon'] as bool?;
    _dob = snapshotData['dob'] as DateTime?;
    _isStealth = snapshotData['isStealth'] as bool?;
    _ipAddress = snapshotData['ip_address'] as String?;
    _dirFeedback = getDataList(snapshotData['dir_feedback']);
    _deviceType = snapshotData['device_type'] as bool?;
    _threadSettings = snapshotData['threadSettings'] is ThreadSettingsStruct
        ? snapshotData['threadSettings']
        : ThreadSettingsStruct.maybeFromMap(snapshotData['threadSettings']);
    _followers = getDataList(snapshotData['followers']);
    _following = getDataList(snapshotData['following']);
    _algorithmPreferences =
        snapshotData['algorithmPreferences'] is UserAlgorithmPreferencesStruct
            ? snapshotData['algorithmPreferences']
            : UserAlgorithmPreferencesStruct.maybeFromMap(
                snapshotData['algorithmPreferences']);
    _vibe = castToType<int>(snapshotData['vibe']);
    _latestSnippetTime = snapshotData['latestSnippetTime'] as DateTime?;
    _groups = getStructList(
      snapshotData['groups'],
      FollowerGroupStruct.fromMap,
    );
    _userSettings = snapshotData['userSettings'] is UserSettingsStruct
        ? snapshotData['userSettings']
        : UserSettingsStruct.maybeFromMap(snapshotData['userSettings']);
    _blocked = getDataList(snapshotData['blocked']);
    _userData = snapshotData['userData'] is UserDataStruct
        ? snapshotData['userData']
        : UserDataStruct.maybeFromMap(snapshotData['userData']);
    _postInteractions = snapshotData['postInteractions']
            is PostInteractionsStruct
        ? snapshotData['postInteractions']
        : PostInteractionsStruct.maybeFromMap(snapshotData['postInteractions']);
    _threadInteractions =
        snapshotData['threadInteractions'] is ThreadInteractionsStruct
            ? snapshotData['threadInteractions']
            : ThreadInteractionsStruct.maybeFromMap(
                snapshotData['threadInteractions']);
    _shortInteractions =
        snapshotData['shortInteractions'] is ShortInteractionsStruct
            ? snapshotData['shortInteractions']
            : ShortInteractionsStruct.maybeFromMap(
                snapshotData['shortInteractions']);
    _notifications = getStructList(
      snapshotData['notifications'],
      NotificationStruct.fromMap,
    );
    _notificationsReferences =
        getDataList(snapshotData['notificationsReferences']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UsersRecord.getDocumentFromData(
        {
          'email': snapshot.data['email'],
          'display_name': snapshot.data['display_name'],
          'uid': snapshot.data['uid'],
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'phone_number': snapshot.data['phone_number'],
          'name': snapshot.data['name'],
          'photo_url': snapshot.data['photo_url'],
          'banner': snapshot.data['banner'],
          'bio': snapshot.data['bio'],
          'pin': snapshot.data['pin'],
          'isBiometric': snapshot.data['isBiometric'],
          'isAnon': snapshot.data['isAnon'],
          'dob': convertAlgoliaParam(
            snapshot.data['dob'],
            ParamType.DateTime,
            false,
          ),
          'isStealth': snapshot.data['isStealth'],
          'ip_address': snapshot.data['ip_address'],
          'dir_feedback': safeGet(
            () => snapshot.data['dir_feedback'].toList(),
          ),
          'device_type': snapshot.data['device_type'],
          'threadSettings': ThreadSettingsStruct.fromAlgoliaData(
                  snapshot.data['threadSettings'] ?? {})
              .toMap(),
          'followers': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['followers'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'following': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['following'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'algorithmPreferences':
              UserAlgorithmPreferencesStruct.fromAlgoliaData(
                      snapshot.data['algorithmPreferences'] ?? {})
                  .toMap(),
          'vibe': convertAlgoliaParam(
            snapshot.data['vibe'],
            ParamType.int,
            false,
          ),
          'latestSnippetTime': convertAlgoliaParam(
            snapshot.data['latestSnippetTime'],
            ParamType.DateTime,
            false,
          ),
          'groups': safeGet(
            () => (snapshot.data['groups'] as Iterable)
                .map((d) => FollowerGroupStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'userSettings': UserSettingsStruct.fromAlgoliaData(
                  snapshot.data['userSettings'] ?? {})
              .toMap(),
          'blocked': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['blocked'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'userData':
              UserDataStruct.fromAlgoliaData(snapshot.data['userData'] ?? {})
                  .toMap(),
          'postInteractions': PostInteractionsStruct.fromAlgoliaData(
                  snapshot.data['postInteractions'] ?? {})
              .toMap(),
          'threadInteractions': ThreadInteractionsStruct.fromAlgoliaData(
                  snapshot.data['threadInteractions'] ?? {})
              .toMap(),
          'shortInteractions': ShortInteractionsStruct.fromAlgoliaData(
                  snapshot.data['shortInteractions'] ?? {})
              .toMap(),
          'notifications': safeGet(
            () => (snapshot.data['notifications'] as Iterable)
                .map((d) => NotificationStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'notificationsReferences': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['notificationsReferences'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
        },
        UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? name,
  String? photoUrl,
  String? banner,
  String? bio,
  String? pin,
  bool? isBiometric,
  bool? isAnon,
  DateTime? dob,
  bool? isStealth,
  String? ipAddress,
  bool? deviceType,
  ThreadSettingsStruct? threadSettings,
  UserAlgorithmPreferencesStruct? algorithmPreferences,
  int? vibe,
  DateTime? latestSnippetTime,
  UserSettingsStruct? userSettings,
  UserDataStruct? userData,
  PostInteractionsStruct? postInteractions,
  ThreadInteractionsStruct? threadInteractions,
  ShortInteractionsStruct? shortInteractions,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'name': name,
      'photo_url': photoUrl,
      'banner': banner,
      'bio': bio,
      'pin': pin,
      'isBiometric': isBiometric,
      'isAnon': isAnon,
      'dob': dob,
      'isStealth': isStealth,
      'ip_address': ipAddress,
      'device_type': deviceType,
      'threadSettings': ThreadSettingsStruct().toMap(),
      'algorithmPreferences': UserAlgorithmPreferencesStruct().toMap(),
      'vibe': vibe,
      'latestSnippetTime': latestSnippetTime,
      'userSettings': UserSettingsStruct().toMap(),
      'userData': UserDataStruct().toMap(),
      'postInteractions': PostInteractionsStruct().toMap(),
      'threadInteractions': ThreadInteractionsStruct().toMap(),
      'shortInteractions': ShortInteractionsStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "threadSettings" field.
  addThreadSettingsStructData(firestoreData, threadSettings, 'threadSettings');

  // Handle nested data for "algorithmPreferences" field.
  addUserAlgorithmPreferencesStructData(
      firestoreData, algorithmPreferences, 'algorithmPreferences');

  // Handle nested data for "userSettings" field.
  addUserSettingsStructData(firestoreData, userSettings, 'userSettings');

  // Handle nested data for "userData" field.
  addUserDataStructData(firestoreData, userData, 'userData');

  // Handle nested data for "postInteractions" field.
  addPostInteractionsStructData(
      firestoreData, postInteractions, 'postInteractions');

  // Handle nested data for "threadInteractions" field.
  addThreadInteractionsStructData(
      firestoreData, threadInteractions, 'threadInteractions');

  // Handle nested data for "shortInteractions" field.
  addShortInteractionsStructData(
      firestoreData, shortInteractions, 'shortInteractions');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.name == e2?.name &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.banner == e2?.banner &&
        e1?.bio == e2?.bio &&
        e1?.pin == e2?.pin &&
        e1?.isBiometric == e2?.isBiometric &&
        e1?.isAnon == e2?.isAnon &&
        e1?.dob == e2?.dob &&
        e1?.isStealth == e2?.isStealth &&
        e1?.ipAddress == e2?.ipAddress &&
        listEquality.equals(e1?.dirFeedback, e2?.dirFeedback) &&
        e1?.deviceType == e2?.deviceType &&
        e1?.threadSettings == e2?.threadSettings &&
        listEquality.equals(e1?.followers, e2?.followers) &&
        listEquality.equals(e1?.following, e2?.following) &&
        e1?.algorithmPreferences == e2?.algorithmPreferences &&
        e1?.vibe == e2?.vibe &&
        e1?.latestSnippetTime == e2?.latestSnippetTime &&
        listEquality.equals(e1?.groups, e2?.groups) &&
        e1?.userSettings == e2?.userSettings &&
        listEquality.equals(e1?.blocked, e2?.blocked) &&
        e1?.userData == e2?.userData &&
        e1?.postInteractions == e2?.postInteractions &&
        e1?.threadInteractions == e2?.threadInteractions &&
        e1?.shortInteractions == e2?.shortInteractions &&
        listEquality.equals(e1?.notifications, e2?.notifications) &&
        listEquality.equals(
            e1?.notificationsReferences, e2?.notificationsReferences);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.name,
        e?.photoUrl,
        e?.banner,
        e?.bio,
        e?.pin,
        e?.isBiometric,
        e?.isAnon,
        e?.dob,
        e?.isStealth,
        e?.ipAddress,
        e?.dirFeedback,
        e?.deviceType,
        e?.threadSettings,
        e?.followers,
        e?.following,
        e?.algorithmPreferences,
        e?.vibe,
        e?.latestSnippetTime,
        e?.groups,
        e?.userSettings,
        e?.blocked,
        e?.userData,
        e?.postInteractions,
        e?.threadInteractions,
        e?.shortInteractions,
        e?.notifications,
        e?.notificationsReferences
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
