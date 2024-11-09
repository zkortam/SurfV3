import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpacesRecord extends FirestoreRecord {
  SpacesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "rules" field.
  String? _rules;
  String get rules => _rules ?? '';
  bool hasRules() => _rules != null;

  // "banner" field.
  String? _banner;
  String get banner => _banner ?? '';
  bool hasBanner() => _banner != null;

  // "threads" field.
  List<DocumentReference>? _threads;
  List<DocumentReference> get threads => _threads ?? const [];
  bool hasThreads() => _threads != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _rules = snapshotData['rules'] as String?;
    _banner = snapshotData['banner'] as String?;
    _threads = getDataList(snapshotData['threads']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('spaces');

  static Stream<SpacesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SpacesRecord.fromSnapshot(s));

  static Future<SpacesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SpacesRecord.fromSnapshot(s));

  static SpacesRecord fromSnapshot(DocumentSnapshot snapshot) => SpacesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SpacesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SpacesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SpacesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SpacesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSpacesRecordData({
  String? name,
  String? rules,
  String? banner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'rules': rules,
      'banner': banner,
    }.withoutNulls,
  );

  return firestoreData;
}

class SpacesRecordDocumentEquality implements Equality<SpacesRecord> {
  const SpacesRecordDocumentEquality();

  @override
  bool equals(SpacesRecord? e1, SpacesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.rules == e2?.rules &&
        e1?.banner == e2?.banner &&
        listEquality.equals(e1?.threads, e2?.threads);
  }

  @override
  int hash(SpacesRecord? e) =>
      const ListEquality().hash([e?.name, e?.rules, e?.banner, e?.threads]);

  @override
  bool isValidKey(Object? o) => o is SpacesRecord;
}
