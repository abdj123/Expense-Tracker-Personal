// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:local_auth/local_auth.dart';

Future<bool> authenticateUser() async {
  final auth = LocalAuthentication();
  final canCheckBiometrics = await auth.canCheckBiometrics;
  final isDeviceSupported = await auth.isDeviceSupported();

  if (!canCheckBiometrics || !isDeviceSupported) {
    return false;
  }

  try {
    final authenticated = await auth.authenticate(
      localizedReason: 'Please authenticate to continue',
      options: const AuthenticationOptions(
        stickyAuth: true,
        biometricOnly: false,
      ),
    );
    return authenticated;
  } catch (e) {
    return false;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
