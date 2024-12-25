import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MusicRecord extends FirestoreRecord {
  MusicRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "cover" field.
  String? _cover;
  String get cover => _cover ?? '';
  bool hasCover() => _cover != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "authorRealName" field.
  String? _authorRealName;
  String get authorRealName => _authorRealName ?? '';
  bool hasAuthorRealName() => _authorRealName != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _author = snapshotData['author'] as DocumentReference?;
    _audio = snapshotData['audio'] as String?;
    _cover = snapshotData['cover'] as String?;
    _category = snapshotData['category'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _authorRealName = snapshotData['authorRealName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('music');

  static Stream<MusicRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MusicRecord.fromSnapshot(s));

  static Future<MusicRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MusicRecord.fromSnapshot(s));

  static MusicRecord fromSnapshot(DocumentSnapshot snapshot) => MusicRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MusicRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MusicRecord._(reference, mapFromFirestore(data));

  static MusicRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      MusicRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'author': convertAlgoliaParam(
            snapshot.data['author'],
            ParamType.DocumentReference,
            false,
          ),
          'audio': snapshot.data['audio'],
          'cover': snapshot.data['cover'],
          'category': snapshot.data['category'],
          'time': convertAlgoliaParam(
            snapshot.data['time'],
            ParamType.DateTime,
            false,
          ),
          'authorRealName': snapshot.data['authorRealName'],
        },
        MusicRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<MusicRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'music',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'MusicRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MusicRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMusicRecordData({
  String? name,
  DocumentReference? author,
  String? audio,
  String? cover,
  String? category,
  DateTime? time,
  String? authorRealName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'author': author,
      'audio': audio,
      'cover': cover,
      'category': category,
      'time': time,
      'authorRealName': authorRealName,
    }.withoutNulls,
  );

  return firestoreData;
}

class MusicRecordDocumentEquality implements Equality<MusicRecord> {
  const MusicRecordDocumentEquality();

  @override
  bool equals(MusicRecord? e1, MusicRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.author == e2?.author &&
        e1?.audio == e2?.audio &&
        e1?.cover == e2?.cover &&
        e1?.category == e2?.category &&
        e1?.time == e2?.time &&
        e1?.authorRealName == e2?.authorRealName;
  }

  @override
  int hash(MusicRecord? e) => const ListEquality().hash([
        e?.name,
        e?.author,
        e?.audio,
        e?.cover,
        e?.category,
        e?.time,
        e?.authorRealName
      ]);

  @override
  bool isValidKey(Object? o) => o is MusicRecord;
}
