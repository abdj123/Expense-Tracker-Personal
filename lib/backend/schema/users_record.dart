import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "profile_image" field.
  String? _profileImage;
  String get profileImage => _profileImage ?? '';
  bool hasProfileImage() => _profileImage != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "integrations" field.
  IntegrationsStruct? _integrations;
  IntegrationsStruct get integrations => _integrations ?? IntegrationsStruct();
  bool hasIntegrations() => _integrations != null;

  // "totalBalance" field.
  TotalBalanceStruct? _totalBalance;
  TotalBalanceStruct get totalBalance => _totalBalance ?? TotalBalanceStruct();
  bool hasTotalBalance() => _totalBalance != null;

  // "emailNotification" field.
  bool? _emailNotification;
  bool get emailNotification => _emailNotification ?? false;
  bool hasEmailNotification() => _emailNotification != null;

  // "mobileNotification" field.
  bool? _mobileNotification;
  bool get mobileNotification => _mobileNotification ?? false;
  bool hasMobileNotification() => _mobileNotification != null;

  // "bankBalance" field.
  double? _bankBalance;
  double get bankBalance => _bankBalance ?? 0.0;
  bool hasBankBalance() => _bankBalance != null;

  // "cashInHand" field.
  double? _cashInHand;
  double get cashInHand => _cashInHand ?? 0.0;
  bool hasCashInHand() => _cashInHand != null;

  // "cryptoBalance" field.
  double? _cryptoBalance;
  double get cryptoBalance => _cryptoBalance ?? 0.0;
  bool hasCryptoBalance() => _cryptoBalance != null;

  // "synced" field.
  bool? _synced;
  bool get synced => _synced ?? false;
  bool hasSynced() => _synced != null;

  // "previousBalance" field.
  double? _previousBalance;
  double get previousBalance => _previousBalance ?? 0.0;
  bool hasPreviousBalance() => _previousBalance != null;

  // "currentBalance" field.
  double? _currentBalance;
  double get currentBalance => _currentBalance ?? 0.0;
  bool hasCurrentBalance() => _currentBalance != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _profileImage = snapshotData['profile_image'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _integrations = snapshotData['integrations'] is IntegrationsStruct
        ? snapshotData['integrations']
        : IntegrationsStruct.maybeFromMap(snapshotData['integrations']);
    _totalBalance = snapshotData['totalBalance'] is TotalBalanceStruct
        ? snapshotData['totalBalance']
        : TotalBalanceStruct.maybeFromMap(snapshotData['totalBalance']);
    _emailNotification = snapshotData['emailNotification'] as bool?;
    _mobileNotification = snapshotData['mobileNotification'] as bool?;
    _bankBalance = castToType<double>(snapshotData['bankBalance']);
    _cashInHand = castToType<double>(snapshotData['cashInHand']);
    _cryptoBalance = castToType<double>(snapshotData['cryptoBalance']);
    _synced = snapshotData['synced'] as bool?;
    _previousBalance = castToType<double>(snapshotData['previousBalance']);
    _currentBalance = castToType<double>(snapshotData['currentBalance']);
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
  String? profileImage,
  String? photoUrl,
  IntegrationsStruct? integrations,
  TotalBalanceStruct? totalBalance,
  bool? emailNotification,
  bool? mobileNotification,
  double? bankBalance,
  double? cashInHand,
  double? cryptoBalance,
  bool? synced,
  double? previousBalance,
  double? currentBalance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'profile_image': profileImage,
      'photo_url': photoUrl,
      'integrations': IntegrationsStruct().toMap(),
      'totalBalance': TotalBalanceStruct().toMap(),
      'emailNotification': emailNotification,
      'mobileNotification': mobileNotification,
      'bankBalance': bankBalance,
      'cashInHand': cashInHand,
      'cryptoBalance': cryptoBalance,
      'synced': synced,
      'previousBalance': previousBalance,
      'currentBalance': currentBalance,
    }.withoutNulls,
  );

  // Handle nested data for "integrations" field.
  addIntegrationsStructData(firestoreData, integrations, 'integrations');

  // Handle nested data for "totalBalance" field.
  addTotalBalanceStructData(firestoreData, totalBalance, 'totalBalance');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.profileImage == e2?.profileImage &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.integrations == e2?.integrations &&
        e1?.totalBalance == e2?.totalBalance &&
        e1?.emailNotification == e2?.emailNotification &&
        e1?.mobileNotification == e2?.mobileNotification &&
        e1?.bankBalance == e2?.bankBalance &&
        e1?.cashInHand == e2?.cashInHand &&
        e1?.cryptoBalance == e2?.cryptoBalance &&
        e1?.synced == e2?.synced &&
        e1?.previousBalance == e2?.previousBalance &&
        e1?.currentBalance == e2?.currentBalance;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.profileImage,
        e?.photoUrl,
        e?.integrations,
        e?.totalBalance,
        e?.emailNotification,
        e?.mobileNotification,
        e?.bankBalance,
        e?.cashInHand,
        e?.cryptoBalance,
        e?.synced,
        e?.previousBalance,
        e?.currentBalance
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
