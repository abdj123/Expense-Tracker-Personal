// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BanksStruct extends FFFirebaseStruct {
  BanksStruct({
    String? apiKey,
    String? apiSecret,
    String? platform,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _apiKey = apiKey,
        _apiSecret = apiSecret,
        _platform = platform,
        super(firestoreUtilData);

  // "apiKey" field.
  String? _apiKey;
  String get apiKey => _apiKey ?? '';
  set apiKey(String? val) => _apiKey = val;

  bool hasApiKey() => _apiKey != null;

  // "apiSecret" field.
  String? _apiSecret;
  String get apiSecret => _apiSecret ?? '';
  set apiSecret(String? val) => _apiSecret = val;

  bool hasApiSecret() => _apiSecret != null;

  // "platform" field.
  String? _platform;
  String get platform => _platform ?? '';
  set platform(String? val) => _platform = val;

  bool hasPlatform() => _platform != null;

  static BanksStruct fromMap(Map<String, dynamic> data) => BanksStruct(
        apiKey: data['apiKey'] as String?,
        apiSecret: data['apiSecret'] as String?,
        platform: data['platform'] as String?,
      );

  static BanksStruct? maybeFromMap(dynamic data) =>
      data is Map ? BanksStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'apiKey': _apiKey,
        'apiSecret': _apiSecret,
        'platform': _platform,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'apiKey': serializeParam(
          _apiKey,
          ParamType.String,
        ),
        'apiSecret': serializeParam(
          _apiSecret,
          ParamType.String,
        ),
        'platform': serializeParam(
          _platform,
          ParamType.String,
        ),
      }.withoutNulls;

  static BanksStruct fromSerializableMap(Map<String, dynamic> data) =>
      BanksStruct(
        apiKey: deserializeParam(
          data['apiKey'],
          ParamType.String,
          false,
        ),
        apiSecret: deserializeParam(
          data['apiSecret'],
          ParamType.String,
          false,
        ),
        platform: deserializeParam(
          data['platform'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BanksStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BanksStruct &&
        apiKey == other.apiKey &&
        apiSecret == other.apiSecret &&
        platform == other.platform;
  }

  @override
  int get hashCode => const ListEquality().hash([apiKey, apiSecret, platform]);
}

BanksStruct createBanksStruct({
  String? apiKey,
  String? apiSecret,
  String? platform,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BanksStruct(
      apiKey: apiKey,
      apiSecret: apiSecret,
      platform: platform,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BanksStruct? updateBanksStruct(
  BanksStruct? banks, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    banks
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBanksStructData(
  Map<String, dynamic> firestoreData,
  BanksStruct? banks,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (banks == null) {
    return;
  }
  if (banks.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && banks.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final banksData = getBanksFirestoreData(banks, forFieldValue);
  final nestedData = banksData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = banks.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBanksFirestoreData(
  BanksStruct? banks, [
  bool forFieldValue = false,
]) {
  if (banks == null) {
    return {};
  }
  final firestoreData = mapToFirestore(banks.toMap());

  // Add any Firestore field values
  banks.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBanksListFirestoreData(
  List<BanksStruct>? bankss,
) =>
    bankss?.map((e) => getBanksFirestoreData(e, true)).toList() ?? [];
