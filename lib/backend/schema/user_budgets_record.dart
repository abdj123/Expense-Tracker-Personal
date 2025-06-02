import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserBudgetsRecord extends FirestoreRecord {
  UserBudgetsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "period" field.
  String? _period;
  String get period => _period ?? '';
  bool hasPeriod() => _period != null;

  // "month" field.
  String? _month;
  String get month => _month ?? '';
  bool hasMonth() => _month != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "currentAmount" field.
  double? _currentAmount;
  double get currentAmount => _currentAmount ?? 0.0;
  bool hasCurrentAmount() => _currentAmount != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _category = snapshotData['category'] as String?;
    _period = snapshotData['period'] as String?;
    _month = snapshotData['month'] as String?;
    _startDate = snapshotData['startDate'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
    _currentAmount = castToType<double>(snapshotData['currentAmount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_budgets');

  static Stream<UserBudgetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserBudgetsRecord.fromSnapshot(s));

  static Future<UserBudgetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserBudgetsRecord.fromSnapshot(s));

  static UserBudgetsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserBudgetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserBudgetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserBudgetsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserBudgetsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserBudgetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserBudgetsRecordData({
  String? title,
  double? amount,
  String? category,
  String? period,
  String? month,
  DateTime? startDate,
  String? uid,
  double? currentAmount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'amount': amount,
      'category': category,
      'period': period,
      'month': month,
      'startDate': startDate,
      'uid': uid,
      'currentAmount': currentAmount,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserBudgetsRecordDocumentEquality implements Equality<UserBudgetsRecord> {
  const UserBudgetsRecordDocumentEquality();

  @override
  bool equals(UserBudgetsRecord? e1, UserBudgetsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.amount == e2?.amount &&
        e1?.category == e2?.category &&
        e1?.period == e2?.period &&
        e1?.month == e2?.month &&
        e1?.startDate == e2?.startDate &&
        e1?.uid == e2?.uid &&
        e1?.currentAmount == e2?.currentAmount;
  }

  @override
  int hash(UserBudgetsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.amount,
        e?.category,
        e?.period,
        e?.month,
        e?.startDate,
        e?.uid,
        e?.currentAmount
      ]);

  @override
  bool isValidKey(Object? o) => o is UserBudgetsRecord;
}
