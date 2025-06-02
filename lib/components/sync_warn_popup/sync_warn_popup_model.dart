import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/components/plan_warning/plan_warning_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import 'sync_warn_popup_widget.dart' show SyncWarnPopupWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SyncWarnPopupModel extends FlutterFlowModel<SyncWarnPopupWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (sync accounts)] action in Button widget.
  ApiCallResponse? apiResult0hv;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
