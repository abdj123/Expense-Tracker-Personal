// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BinanceStruct extends FFFirebaseStruct {
  BinanceStruct({
    String? apiKey,
    String? apiSecret,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _apiKey = apiKey,
        _apiSecret = apiSecret,
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

  static BinanceStruct fromMap(Map<String, dynamic> data) => BinanceStruct(
        apiKey: data['apiKey'] as String?,
        apiSecret: data['apiSecret'] as String?,
      );

  static BinanceStruct? maybeFromMap(dynamic data) =>
      data is Map ? BinanceStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'apiKey': _apiKey,
        'apiSecret': _apiSecret,
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
      }.withoutNulls;

  static BinanceStruct fromSerializableMap(Map<String, dynamic> data) =>
      BinanceStruct(
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
      );

  @override
  String toString() => 'BinanceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BinanceStruct &&
        apiKey == other.apiKey &&
        apiSecret == other.apiSecret;
  }

  @override
  int get hashCode => const ListEquality().hash([apiKey, apiSecret]);
}

BinanceStruct createBinanceStruct({
  String? apiKey,
  String? apiSecret,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BinanceStruct(
      apiKey: apiKey,
      apiSecret: apiSecret,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BinanceStruct? updateBinanceStruct(
  BinanceStruct? binance, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    binance
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBinanceStructData(
  Map<String, dynamic> firestoreData,
  BinanceStruct? binance,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (binance == null) {
    return;
  }
  if (binance.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && binance.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final binanceData = getBinanceFirestoreData(binance, forFieldValue);
  final nestedData = binanceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = binance.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBinanceFirestoreData(
  BinanceStruct? binance, [
  bool forFieldValue = false,
]) {
  if (binance == null) {
    return {};
  }
  final firestoreData = mapToFirestore(binance.toMap());

  // Add any Firestore field values
  binance.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBinanceListFirestoreData(
  List<BinanceStruct>? binances,
) =>
    binances?.map((e) => getBinanceFirestoreData(e, true)).toList() ?? [];
