import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AllUserBalancesRecord extends FirestoreRecord {
  AllUserBalancesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "retrievedAt" field.
  DateTime? _retrievedAt;
  DateTime? get retrievedAt => _retrievedAt;
  bool hasRetrievedAt() => _retrievedAt != null;

  // "totalBalanceUSD" field.
  double? _totalBalanceUSD;
  double get totalBalanceUSD => _totalBalanceUSD ?? 0.0;
  bool hasTotalBalanceUSD() => _totalBalanceUSD != null;

  // "updatedBy" field.
  String? _updatedBy;
  String get updatedBy => _updatedBy ?? '';
  bool hasUpdatedBy() => _updatedBy != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _retrievedAt = snapshotData['retrievedAt'] as DateTime?;
    _totalBalanceUSD = castToType<double>(snapshotData['totalBalanceUSD']);
    _updatedBy = snapshotData['updatedBy'] as String?;
    _userId = snapshotData['userId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('allUserBalances');

  static Stream<AllUserBalancesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AllUserBalancesRecord.fromSnapshot(s));

  static Future<AllUserBalancesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AllUserBalancesRecord.fromSnapshot(s));

  static AllUserBalancesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AllUserBalancesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AllUserBalancesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AllUserBalancesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AllUserBalancesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AllUserBalancesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAllUserBalancesRecordData({
  DateTime? retrievedAt,
  double? totalBalanceUSD,
  String? updatedBy,
  String? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'retrievedAt': retrievedAt,
      'totalBalanceUSD': totalBalanceUSD,
      'updatedBy': updatedBy,
      'userId': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class AllUserBalancesRecordDocumentEquality
    implements Equality<AllUserBalancesRecord> {
  const AllUserBalancesRecordDocumentEquality();

  @override
  bool equals(AllUserBalancesRecord? e1, AllUserBalancesRecord? e2) {
    return e1?.retrievedAt == e2?.retrievedAt &&
        e1?.totalBalanceUSD == e2?.totalBalanceUSD &&
        e1?.updatedBy == e2?.updatedBy &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(AllUserBalancesRecord? e) => const ListEquality()
      .hash([e?.retrievedAt, e?.totalBalanceUSD, e?.updatedBy, e?.userId]);

  @override
  bool isValidKey(Object? o) => o is AllUserBalancesRecord;
}
