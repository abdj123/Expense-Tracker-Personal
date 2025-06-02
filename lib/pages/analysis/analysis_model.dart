import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/get_report_p_d_f/get_report_p_d_f_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'analysis_widget.dart' show AnalysisWidget;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AnalysisModel extends FlutterFlowModel<AnalysisWidget> {
  ///  Local state fields for this page.

  List<double> categories = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
  void addToCategories(double item) => categories.add(item);
  void removeFromCategories(double item) => categories.remove(item);
  void removeAtIndexFromCategories(int index) => categories.removeAt(index);
  void insertAtIndexInCategories(int index, double item) =>
      categories.insert(index, item);
  void updateCategoriesAtIndex(int index, Function(double) updateFn) =>
      categories[index] = updateFn(categories[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future callAnalysis(BuildContext context) async {
    List<AllUserTransactionsRecord>? others;
    List<AllUserTransactionsRecord>? income;
    List<AllUserTransactionsRecord>? food;
    List<AllUserTransactionsRecord>? shopping;
    List<AllUserTransactionsRecord>? transport;
    List<AllUserTransactionsRecord>? health;
    List<AllUserTransactionsRecord>? house;
    List<AllUserTransactionsRecord>? transfer;

    await Future.wait([
      Future(() async {
        others = await queryAllUserTransactionsRecordOnce(
          queryBuilder: (allUserTransactionsRecord) => allUserTransactionsRecord
              .where(
                'userId',
                isEqualTo: currentUserUid,
              )
              .where(
                'category',
                isEqualTo: 'Other Expenses',
              )
              .where(
                'firebaseDate',
                isGreaterThanOrEqualTo:
                    functions.getDateRange(choiceChipsValue!),
              ),
        );
        updateCategoriesAtIndex(
          7,
          (_) => others!.length.toDouble(),
        );
      }),
      Future(() async {
        income = await queryAllUserTransactionsRecordOnce(
          queryBuilder: (allUserTransactionsRecord) => allUserTransactionsRecord
              .where(
                'userId',
                isEqualTo: currentUserUid,
              )
              .where(
                'category',
                isEqualTo: 'Income',
              )
              .where(
                'firebaseDate',
                isGreaterThanOrEqualTo:
                    functions.getDateRange(choiceChipsValue!),
              ),
        );
        updateCategoriesAtIndex(
          6,
          (_) => income!.length.toDouble(),
        );
      }),
      Future(() async {
        food = await queryAllUserTransactionsRecordOnce(
          queryBuilder: (allUserTransactionsRecord) => allUserTransactionsRecord
              .where(
                'userId',
                isEqualTo: currentUserUid,
              )
              .where(
                'category',
                isEqualTo: 'Food & Groceries',
              )
              .where(
                'firebaseDate',
                isGreaterThanOrEqualTo:
                    functions.getDateRange(choiceChipsValue!),
              ),
        );
        updateCategoriesAtIndex(
          0,
          (_) => food!.length.toDouble(),
        );
      }),
      Future(() async {
        shopping = await queryAllUserTransactionsRecordOnce(
          queryBuilder: (allUserTransactionsRecord) => allUserTransactionsRecord
              .where(
                'userId',
                isEqualTo: currentUserUid,
              )
              .where(
                'category',
                isEqualTo: 'Shopping & Entertainment',
              )
              .where(
                'firebaseDate',
                isGreaterThanOrEqualTo:
                    functions.getDateRange(choiceChipsValue!),
              ),
        );
        updateCategoriesAtIndex(
          1,
          (_) => shopping!.length.toDouble(),
        );
      }),
      Future(() async {
        transport = await queryAllUserTransactionsRecordOnce(
          queryBuilder: (allUserTransactionsRecord) => allUserTransactionsRecord
              .where(
                'userId',
                isEqualTo: currentUserUid,
              )
              .where(
                'category',
                isEqualTo: 'Transportation',
              )
              .where(
                'firebaseDate',
                isGreaterThanOrEqualTo:
                    functions.getDateRange(choiceChipsValue!),
              ),
        );
        updateCategoriesAtIndex(
          4,
          (_) => transport!.length.toDouble(),
        );
      }),
      Future(() async {
        health = await queryAllUserTransactionsRecordOnce(
          queryBuilder: (allUserTransactionsRecord) => allUserTransactionsRecord
              .where(
                'userId',
                isEqualTo: currentUserUid,
              )
              .where(
                'category',
                isEqualTo: 'Healthcare',
              )
              .where(
                'firebaseDate',
                isGreaterThanOrEqualTo:
                    functions.getDateRange(choiceChipsValue!),
              ),
        );
        updateCategoriesAtIndex(
          5,
          (_) => health!.length.toDouble(),
        );
      }),
      Future(() async {
        house = await queryAllUserTransactionsRecordOnce(
          queryBuilder: (allUserTransactionsRecord) => allUserTransactionsRecord
              .where(
                'userId',
                isEqualTo: currentUserUid,
              )
              .where(
                'category',
                isEqualTo: 'Housing & Utilities',
              )
              .where(
                'firebaseDate',
                isGreaterThanOrEqualTo:
                    functions.getDateRange(choiceChipsValue!),
              ),
        );
        updateCategoriesAtIndex(
          3,
          (_) => house!.length.toDouble(),
        );
      }),
      Future(() async {
        transfer = await queryAllUserTransactionsRecordOnce(
          queryBuilder: (allUserTransactionsRecord) => allUserTransactionsRecord
              .where(
                'userId',
                isEqualTo: currentUserUid,
              )
              .where(
                'category',
                isEqualTo: 'Transfers & Payments',
              )
              .where(
                'firebaseDate',
                isGreaterThanOrEqualTo:
                    functions.getDateRange(choiceChipsValue!),
              ),
        );
        updateCategoriesAtIndex(
          2,
          (_) => transfer!.length.toDouble(),
        );
      }),
    ]);
  }
}
