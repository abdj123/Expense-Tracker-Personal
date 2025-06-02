import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_bank_account/add_bank_account_widget.dart';
import '/components/add_crypto_account/add_crypto_account_widget.dart';
import '/components/bottomsheet/bottomsheet_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/empty_list_copy/empty_list_copy_widget.dart';
import '/components/expense_detail/expense_detail_widget.dart';
import '/components/verify_email/verify_email_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  bool colapes = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
