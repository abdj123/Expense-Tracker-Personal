import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlanTransactionsRecord extends FirestoreRecord {
  PlanTransactionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "isDeposit" field.
  bool? _isDeposit;
  bool get isDeposit => _isDeposit ?? false;
  bool hasIsDeposit() => _isDeposit != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "planId" field.
  String? _planId;
  String get planId => _planId ?? '';
  bool hasPlanId() => _planId != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _isDeposit = snapshotData['isDeposit'] as bool?;
    _amount = castToType<double>(snapshotData['amount']);
    _planId = snapshotData['planId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('planTransactions');

  static Stream<PlanTransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlanTransactionsRecord.fromSnapshot(s));

  static Future<PlanTransactionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PlanTransactionsRecord.fromSnapshot(s));

  static PlanTransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlanTransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlanTransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlanTransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlanTransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlanTransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlanTransactionsRecordData({
  DateTime? date,
  bool? isDeposit,
  double? amount,
  String? planId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'isDeposit': isDeposit,
      'amount': amount,
      'planId': planId,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlanTransactionsRecordDocumentEquality
    implements Equality<PlanTransactionsRecord> {
  const PlanTransactionsRecordDocumentEquality();

  @override
  bool equals(PlanTransactionsRecord? e1, PlanTransactionsRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.isDeposit == e2?.isDeposit &&
        e1?.amount == e2?.amount &&
        e1?.planId == e2?.planId;
  }

  @override
  int hash(PlanTransactionsRecord? e) =>
      const ListEquality().hash([e?.date, e?.isDeposit, e?.amount, e?.planId]);

  @override
  bool isValidKey(Object? o) => o is PlanTransactionsRecord;
}
