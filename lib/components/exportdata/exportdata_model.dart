import '/auth/firebase_auth/auth_util.dart';
import '/components/plan_warning/plan_warning_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'exportdata_widget.dart' show ExportdataWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExportdataModel extends FlutterFlowModel<ExportdataWidget> {
  ///  Local state fields for this component.

  int? indx;

  String? range;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - downloadAndSaveExcelFile] action in Button widget.
  String? exportTransactionApi;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
