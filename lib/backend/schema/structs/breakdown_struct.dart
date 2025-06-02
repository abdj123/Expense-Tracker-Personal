// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BreakdownStruct extends FFFirebaseStruct {
  BreakdownStruct({
    double? usdValue,
    String? source,
    String? name,
    String? currency,
    String? asset,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _usdValue = usdValue,
        _source = source,
        _name = name,
        _currency = currency,
        _asset = asset,
        super(firestoreUtilData);

  // "usdValue" field.
  double? _usdValue;
  double get usdValue => _usdValue ?? 0.0;
  set usdValue(double? val) => _usdValue = val;

  void incrementUsdValue(double amount) => usdValue = usdValue + amount;

  bool hasUsdValue() => _usdValue != null;

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  set source(String? val) => _source = val;

  bool hasSource() => _source != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  set currency(String? val) => _currency = val;

  bool hasCurrency() => _currency != null;

  // "asset" field.
  String? _asset;
  String get asset => _asset ?? '';
  set asset(String? val) => _asset = val;

  bool hasAsset() => _asset != null;

  static BreakdownStruct fromMap(Map<String, dynamic> data) => BreakdownStruct(
        usdValue: castToType<double>(data['usdValue']),
        source: data['source'] as String?,
        name: data['name'] as String?,
        currency: data['currency'] as String?,
        asset: data['asset'] as String?,
      );

  static BreakdownStruct? maybeFromMap(dynamic data) => data is Map
      ? BreakdownStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'usdValue': _usdValue,
        'source': _source,
        'name': _name,
        'currency': _currency,
        'asset': _asset,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'usdValue': serializeParam(
          _usdValue,
          ParamType.double,
        ),
        'source': serializeParam(
          _source,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'currency': serializeParam(
          _currency,
          ParamType.String,
        ),
        'asset': serializeParam(
          _asset,
          ParamType.String,
        ),
      }.withoutNulls;

  static BreakdownStruct fromSerializableMap(Map<String, dynamic> data) =>
      BreakdownStruct(
        usdValue: deserializeParam(
          data['usdValue'],
          ParamType.double,
          false,
        ),
        source: deserializeParam(
          data['source'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        currency: deserializeParam(
          data['currency'],
          ParamType.String,
          false,
        ),
        asset: deserializeParam(
          data['asset'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BreakdownStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BreakdownStruct &&
        usdValue == other.usdValue &&
        source == other.source &&
        name == other.name &&
        currency == other.currency &&
        asset == other.asset;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([usdValue, source, name, currency, asset]);
}

BreakdownStruct createBreakdownStruct({
  double? usdValue,
  String? source,
  String? name,
  String? currency,
  String? asset,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BreakdownStruct(
      usdValue: usdValue,
      source: source,
      name: name,
      currency: currency,
      asset: asset,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BreakdownStruct? updateBreakdownStruct(
  BreakdownStruct? breakdown, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    breakdown
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBreakdownStructData(
  Map<String, dynamic> firestoreData,
  BreakdownStruct? breakdown,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (breakdown == null) {
    return;
  }
  if (breakdown.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && breakdown.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final breakdownData = getBreakdownFirestoreData(breakdown, forFieldValue);
  final nestedData = breakdownData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = breakdown.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBreakdownFirestoreData(
  BreakdownStruct? breakdown, [
  bool forFieldValue = false,
]) {
  if (breakdown == null) {
    return {};
  }
  final firestoreData = mapToFirestore(breakdown.toMap());

  // Add any Firestore field values
  breakdown.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBreakdownListFirestoreData(
  List<BreakdownStruct>? breakdowns,
) =>
    breakdowns?.map((e) => getBreakdownFirestoreData(e, true)).toList() ?? [];
