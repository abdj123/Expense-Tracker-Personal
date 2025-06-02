// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IntegrationsStruct extends FFFirebaseStruct {
  IntegrationsStruct({
    List<BanksStruct>? banks,
    BinanceStruct? binance,
    PaypalStruct? paypal,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _banks = banks,
        _binance = binance,
        _paypal = paypal,
        super(firestoreUtilData);

  // "banks" field.
  List<BanksStruct>? _banks;
  List<BanksStruct> get banks => _banks ?? const [];
  set banks(List<BanksStruct>? val) => _banks = val;

  void updateBanks(Function(List<BanksStruct>) updateFn) {
    updateFn(_banks ??= []);
  }

  bool hasBanks() => _banks != null;

  // "binance" field.
  BinanceStruct? _binance;
  BinanceStruct get binance => _binance ?? BinanceStruct();
  set binance(BinanceStruct? val) => _binance = val;

  void updateBinance(Function(BinanceStruct) updateFn) {
    updateFn(_binance ??= BinanceStruct());
  }

  bool hasBinance() => _binance != null;

  // "paypal" field.
  PaypalStruct? _paypal;
  PaypalStruct get paypal => _paypal ?? PaypalStruct();
  set paypal(PaypalStruct? val) => _paypal = val;

  void updatePaypal(Function(PaypalStruct) updateFn) {
    updateFn(_paypal ??= PaypalStruct());
  }

  bool hasPaypal() => _paypal != null;

  static IntegrationsStruct fromMap(Map<String, dynamic> data) =>
      IntegrationsStruct(
        banks: getStructList(
          data['banks'],
          BanksStruct.fromMap,
        ),
        binance: data['binance'] is BinanceStruct
            ? data['binance']
            : BinanceStruct.maybeFromMap(data['binance']),
        paypal: data['paypal'] is PaypalStruct
            ? data['paypal']
            : PaypalStruct.maybeFromMap(data['paypal']),
      );

  static IntegrationsStruct? maybeFromMap(dynamic data) => data is Map
      ? IntegrationsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'banks': _banks?.map((e) => e.toMap()).toList(),
        'binance': _binance?.toMap(),
        'paypal': _paypal?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'banks': serializeParam(
          _banks,
          ParamType.DataStruct,
          isList: true,
        ),
        'binance': serializeParam(
          _binance,
          ParamType.DataStruct,
        ),
        'paypal': serializeParam(
          _paypal,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static IntegrationsStruct fromSerializableMap(Map<String, dynamic> data) =>
      IntegrationsStruct(
        banks: deserializeStructParam<BanksStruct>(
          data['banks'],
          ParamType.DataStruct,
          true,
          structBuilder: BanksStruct.fromSerializableMap,
        ),
        binance: deserializeStructParam(
          data['binance'],
          ParamType.DataStruct,
          false,
          structBuilder: BinanceStruct.fromSerializableMap,
        ),
        paypal: deserializeStructParam(
          data['paypal'],
          ParamType.DataStruct,
          false,
          structBuilder: PaypalStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'IntegrationsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is IntegrationsStruct &&
        listEquality.equals(banks, other.banks) &&
        binance == other.binance &&
        paypal == other.paypal;
  }

  @override
  int get hashCode => const ListEquality().hash([banks, binance, paypal]);
}

IntegrationsStruct createIntegrationsStruct({
  BinanceStruct? binance,
  PaypalStruct? paypal,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IntegrationsStruct(
      binance: binance ?? (clearUnsetFields ? BinanceStruct() : null),
      paypal: paypal ?? (clearUnsetFields ? PaypalStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IntegrationsStruct? updateIntegrationsStruct(
  IntegrationsStruct? integrations, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    integrations
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIntegrationsStructData(
  Map<String, dynamic> firestoreData,
  IntegrationsStruct? integrations,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (integrations == null) {
    return;
  }
  if (integrations.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && integrations.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final integrationsData =
      getIntegrationsFirestoreData(integrations, forFieldValue);
  final nestedData =
      integrationsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = integrations.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIntegrationsFirestoreData(
  IntegrationsStruct? integrations, [
  bool forFieldValue = false,
]) {
  if (integrations == null) {
    return {};
  }
  final firestoreData = mapToFirestore(integrations.toMap());

  // Handle nested data for "binance" field.
  addBinanceStructData(
    firestoreData,
    integrations.hasBinance() ? integrations.binance : null,
    'binance',
    forFieldValue,
  );

  // Handle nested data for "paypal" field.
  addPaypalStructData(
    firestoreData,
    integrations.hasPaypal() ? integrations.paypal : null,
    'paypal',
    forFieldValue,
  );

  // Add any Firestore field values
  integrations.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIntegrationsListFirestoreData(
  List<IntegrationsStruct>? integrationss,
) =>
    integrationss?.map((e) => getIntegrationsFirestoreData(e, true)).toList() ??
    [];
