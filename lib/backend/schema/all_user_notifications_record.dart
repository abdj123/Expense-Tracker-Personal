import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AllUserNotificationsRecord extends FirestoreRecord {
  AllUserNotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "isRead" field.
  bool? _isRead;
  bool get isRead => _isRead ?? false;
  bool hasIsRead() => _isRead != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "createdAt" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _isRead = snapshotData['isRead'] as bool?;
    _title = snapshotData['title'] as String?;
    _type = snapshotData['type'] as String?;
    _userId = snapshotData['userId'] as String?;
    _createdAt = snapshotData['createdAt'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('allUserNotifications');

  static Stream<AllUserNotificationsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => AllUserNotificationsRecord.fromSnapshot(s));

  static Future<AllUserNotificationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AllUserNotificationsRecord.fromSnapshot(s));

  static AllUserNotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AllUserNotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AllUserNotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AllUserNotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AllUserNotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AllUserNotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAllUserNotificationsRecordData({
  String? message,
  bool? isRead,
  String? title,
  String? type,
  String? userId,
  String? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'isRead': isRead,
      'title': title,
      'type': type,
      'userId': userId,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class AllUserNotificationsRecordDocumentEquality
    implements Equality<AllUserNotificationsRecord> {
  const AllUserNotificationsRecordDocumentEquality();

  @override
  bool equals(AllUserNotificationsRecord? e1, AllUserNotificationsRecord? e2) {
    return e1?.message == e2?.message &&
        e1?.isRead == e2?.isRead &&
        e1?.title == e2?.title &&
        e1?.type == e2?.type &&
        e1?.userId == e2?.userId &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(AllUserNotificationsRecord? e) => const ListEquality().hash(
      [e?.message, e?.isRead, e?.title, e?.type, e?.userId, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is AllUserNotificationsRecord;
}
