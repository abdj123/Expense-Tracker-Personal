// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TotalBalanceStruct extends FFFirebaseStruct {
  TotalBalanceStruct({
    double? totalBalanceUSD,
    List<BreakdownStruct>? breakdown,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _totalBalanceUSD = totalBalanceUSD,
        _breakdown = breakdown,
        super(firestoreUtilData);

  // "totalBalanceUSD" field.
  double? _totalBalanceUSD;
  double get totalBalanceUSD => _totalBalanceUSD ?? 0.0;
  set totalBalanceUSD(double? val) => _totalBalanceUSD = val;

  void incrementTotalBalanceUSD(double amount) =>
      totalBalanceUSD = totalBalanceUSD + amount;

  bool hasTotalBalanceUSD() => _totalBalanceUSD != null;

  // "breakdown" field.
  List<BreakdownStruct>? _breakdown;
  List<BreakdownStruct> get breakdown => _breakdown ?? const [];
  set breakdown(List<BreakdownStruct>? val) => _breakdown = val;

  void updateBreakdown(Function(List<BreakdownStruct>) updateFn) {
    updateFn(_breakdown ??= []);
  }

  bool hasBreakdown() => _breakdown != null;

  static TotalBalanceStruct fromMap(Map<String, dynamic> data) =>
      TotalBalanceStruct(
        totalBalanceUSD: castToType<double>(data['totalBalanceUSD']),
        breakdown: getStructList(
          data['breakdown'],
          BreakdownStruct.fromMap,
        ),
      );

  static TotalBalanceStruct? maybeFromMap(dynamic data) => data is Map
      ? TotalBalanceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'totalBalanceUSD': _totalBalanceUSD,
        'breakdown': _breakdown?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'totalBalanceUSD': serializeParam(
          _totalBalanceUSD,
          ParamType.double,
        ),
        'breakdown': serializeParam(
          _breakdown,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static TotalBalanceStruct fromSerializableMap(Map<String, dynamic> data) =>
      TotalBalanceStruct(
        totalBalanceUSD: deserializeParam(
          data['totalBalanceUSD'],
          ParamType.double,
          false,
        ),
        breakdown: deserializeStructParam<BreakdownStruct>(
          data['breakdown'],
          ParamType.DataStruct,
          true,
          structBuilder: BreakdownStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TotalBalanceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TotalBalanceStruct &&
        totalBalanceUSD == other.totalBalanceUSD &&
        listEquality.equals(breakdown, other.breakdown);
  }

  @override
  int get hashCode => const ListEquality().hash([totalBalanceUSD, breakdown]);
}

TotalBalanceStruct createTotalBalanceStruct({
  double? totalBalanceUSD,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TotalBalanceStruct(
      totalBalanceUSD: totalBalanceUSD,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TotalBalanceStruct? updateTotalBalanceStruct(
  TotalBalanceStruct? totalBalance, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    totalBalance
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTotalBalanceStructData(
  Map<String, dynamic> firestoreData,
  TotalBalanceStruct? totalBalance,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (totalBalance == null) {
    return;
  }
  if (totalBalance.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && totalBalance.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final totalBalanceData =
      getTotalBalanceFirestoreData(totalBalance, forFieldValue);
  final nestedData =
      totalBalanceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = totalBalance.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTotalBalanceFirestoreData(
  TotalBalanceStruct? totalBalance, [
  bool forFieldValue = false,
]) {
  if (totalBalance == null) {
    return {};
  }
  final firestoreData = mapToFirestore(totalBalance.toMap());

  // Add any Firestore field values
  totalBalance.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTotalBalanceListFirestoreData(
  List<TotalBalanceStruct>? totalBalances,
) =>
    totalBalances?.map((e) => getTotalBalanceFirestoreData(e, true)).toList() ??
    [];
