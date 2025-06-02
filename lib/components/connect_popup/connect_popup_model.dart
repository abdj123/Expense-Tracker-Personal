import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/components/connect_sucess_popup/connect_sucess_popup_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import 'connect_popup_widget.dart' show ConnectPopupWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConnectPopupModel extends FlutterFlowModel<ConnectPopupWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for api_key widget.
  FocusNode? apiKeyFocusNode;
  TextEditingController? apiKeyTextController;
  String? Function(BuildContext, String?)? apiKeyTextControllerValidator;
  // State field(s) for secretKey widget.
  FocusNode? secretKeyFocusNode;
  TextEditingController? secretKeyTextController;
  String? Function(BuildContext, String?)? secretKeyTextControllerValidator;
  // State field(s) for walletAddress widget.
  FocusNode? walletAddressFocusNode;
  TextEditingController? walletAddressTextController;
  String? Function(BuildContext, String?)? walletAddressTextControllerValidator;
  // Stores action output result for [Backend Call - API (connect accounts)] action in Button widget.
  ApiCallResponse? apiResultxul;
  // Stores action output result for [Backend Call - API (connect wallet)] action in Button widget.
  ApiCallResponse? apiResultxulBinance;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    apiKeyFocusNode?.dispose();
    apiKeyTextController?.dispose();

    secretKeyFocusNode?.dispose();
    secretKeyTextController?.dispose();

    walletAddressFocusNode?.dispose();
    walletAddressTextController?.dispose();
  }
}
