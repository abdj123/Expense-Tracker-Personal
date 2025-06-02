// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaypalStruct extends FFFirebaseStruct {
  PaypalStruct({
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

  static PaypalStruct fromMap(Map<String, dynamic> data) => PaypalStruct(
        apiKey: data['apiKey'] as String?,
        apiSecret: data['apiSecret'] as String?,
      );

  static PaypalStruct? maybeFromMap(dynamic data) =>
      data is Map ? PaypalStruct.fromMap(data.cast<String, dynamic>()) : null;

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

  static PaypalStruct fromSerializableMap(Map<String, dynamic> data) =>
      PaypalStruct(
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
  String toString() => 'PaypalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PaypalStruct &&
        apiKey == other.apiKey &&
        apiSecret == other.apiSecret;
  }

  @override
  int get hashCode => const ListEquality().hash([apiKey, apiSecret]);
}

PaypalStruct createPaypalStruct({
  String? apiKey,
  String? apiSecret,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PaypalStruct(
      apiKey: apiKey,
      apiSecret: apiSecret,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PaypalStruct? updatePaypalStruct(
  PaypalStruct? paypal, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    paypal
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPaypalStructData(
  Map<String, dynamic> firestoreData,
  PaypalStruct? paypal,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (paypal == null) {
    return;
  }
  if (paypal.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && paypal.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final paypalData = getPaypalFirestoreData(paypal, forFieldValue);
  final nestedData = paypalData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = paypal.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPaypalFirestoreData(
  PaypalStruct? paypal, [
  bool forFieldValue = false,
]) {
  if (paypal == null) {
    return {};
  }
  final firestoreData = mapToFirestore(paypal.toMap());

  // Add any Firestore field values
  paypal.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPaypalListFirestoreData(
  List<PaypalStruct>? paypals,
) =>
    paypals?.map((e) => getPaypalFirestoreData(e, true)).toList() ?? [];
