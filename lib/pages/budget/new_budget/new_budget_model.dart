import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/plan_categories/plan_categories_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'new_budget_widget.dart' show NewBudgetWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewBudgetModel extends FlutterFlowModel<NewBudgetWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for planTitle widget.
  FocusNode? planTitleFocusNode;
  TextEditingController? planTitleTextController;
  String? Function(BuildContext, String?)? planTitleTextControllerValidator;
  String? _planTitleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rt2k67pa' /* eg. Study Materials is require... */,
      );
    }

    return null;
  }

  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  String? _amountTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'z3micq7i' /* Enter API key is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Bottom Sheet - plan_categories] action in Container widget.
  String? category;
  // State field(s) for period widget.
  FocusNode? periodFocusNode;
  TextEditingController? periodTextController;
  String? Function(BuildContext, String?)? periodTextControllerValidator;
  String? _periodTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'c2sn4g1u' /* period is required */,
      );
    }

    return null;
  }

  // State field(s) for MonthsDropDown widget.
  String? monthsDropDownValue;
  FormFieldController<String>? monthsDropDownValueController;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    planTitleTextControllerValidator = _planTitleTextControllerValidator;
    amountTextControllerValidator = _amountTextControllerValidator;
    periodTextControllerValidator = _periodTextControllerValidator;
  }

  @override
  void dispose() {
    planTitleFocusNode?.dispose();
    planTitleTextController?.dispose();

    amountFocusNode?.dispose();
    amountTextController?.dispose();

    periodFocusNode?.dispose();
    periodTextController?.dispose();
  }
}
