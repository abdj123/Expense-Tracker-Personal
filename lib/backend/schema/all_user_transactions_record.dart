import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AllUserTransactionsRecord extends FirestoreRecord {
  AllUserTransactionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "tax" field.
  double? _tax;
  double get tax => _tax ?? 0.0;
  bool hasTax() => _tax != null;

  // "asset" field.
  String? _asset;
  String get asset => _asset ?? '';
  bool hasAsset() => _asset != null;

  // "fee" field.
  double? _fee;
  double get fee => _fee ?? 0.0;
  bool hasFee() => _fee != null;

  // "fromAddress" field.
  String? _fromAddress;
  String get fromAddress => _fromAddress ?? '';
  bool hasFromAddress() => _fromAddress != null;

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  bool hasSource() => _source != null;

  // "toAddress" field.
  String? _toAddress;
  String get toAddress => _toAddress ?? '';
  bool hasToAddress() => _toAddress != null;

  // "txId" field.
  String? _txId;
  String get txId => _txId ?? '';
  bool hasTxId() => _txId != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "firebaseDate" field.
  DateTime? _firebaseDate;
  DateTime? get firebaseDate => _firebaseDate;
  bool hasFirebaseDate() => _firebaseDate != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _status = snapshotData['status'] as String?;
    _tax = castToType<double>(snapshotData['tax']);
    _asset = snapshotData['asset'] as String?;
    _fee = castToType<double>(snapshotData['fee']);
    _fromAddress = snapshotData['fromAddress'] as String?;
    _source = snapshotData['source'] as String?;
    _toAddress = snapshotData['toAddress'] as String?;
    _txId = snapshotData['txId'] as String?;
    _type = snapshotData['type'] as String?;
    _userId = snapshotData['userId'] as String?;
    _date = snapshotData['date'] as String?;
    _firebaseDate = snapshotData['firebaseDate'] as DateTime?;
    _category = snapshotData['category'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('allUserTransactions');

  static Stream<AllUserTransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AllUserTransactionsRecord.fromSnapshot(s));

  static Future<AllUserTransactionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AllUserTransactionsRecord.fromSnapshot(s));

  static AllUserTransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AllUserTransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AllUserTransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AllUserTransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AllUserTransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AllUserTransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAllUserTransactionsRecordData({
  String? name,
  double? amount,
  String? status,
  double? tax,
  String? asset,
  double? fee,
  String? fromAddress,
  String? source,
  String? toAddress,
  String? txId,
  String? type,
  String? userId,
  String? date,
  DateTime? firebaseDate,
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'amount': amount,
      'status': status,
      'tax': tax,
      'asset': asset,
      'fee': fee,
      'fromAddress': fromAddress,
      'source': source,
      'toAddress': toAddress,
      'txId': txId,
      'type': type,
      'userId': userId,
      'date': date,
      'firebaseDate': firebaseDate,
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class AllUserTransactionsRecordDocumentEquality
    implements Equality<AllUserTransactionsRecord> {
  const AllUserTransactionsRecordDocumentEquality();

  @override
  bool equals(AllUserTransactionsRecord? e1, AllUserTransactionsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.amount == e2?.amount &&
        e1?.status == e2?.status &&
        e1?.tax == e2?.tax &&
        e1?.asset == e2?.asset &&
        e1?.fee == e2?.fee &&
        e1?.fromAddress == e2?.fromAddress &&
        e1?.source == e2?.source &&
        e1?.toAddress == e2?.toAddress &&
        e1?.txId == e2?.txId &&
        e1?.type == e2?.type &&
        e1?.userId == e2?.userId &&
        e1?.date == e2?.date &&
        e1?.firebaseDate == e2?.firebaseDate &&
        e1?.category == e2?.category;
  }

  @override
  int hash(AllUserTransactionsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.amount,
        e?.status,
        e?.tax,
        e?.asset,
        e?.fee,
        e?.fromAddress,
        e?.source,
        e?.toAddress,
        e?.txId,
        e?.type,
        e?.userId,
        e?.date,
        e?.firebaseDate,
        e?.category
      ]);

  @override
  bool isValidKey(Object? o) => o is AllUserTransactionsRecord;
}
