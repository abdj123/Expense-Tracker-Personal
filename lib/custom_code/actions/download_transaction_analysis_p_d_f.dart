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

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

Future<String> downloadTransactionAnalysisPDF(
    String jwt, String email, String uid, String range) async {
  try {
    final url =
        Uri.parse('https://gc-financial-analysis-2.onrender.com/api/analysis');

    final response = await http.post(
      url,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $jwt',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'uid': uid,
        'range': range,
      }),
    );

    if (response.statusCode == 200 &&
        response.headers['content-type'] == 'application/pdf') {
      final Uint8List bytes = response.bodyBytes;

      final directory = Directory('/storage/emulated/0/Download');
      final filePath =
          '${directory.path}/transaction_analysis_${DateTime.now().millisecondsSinceEpoch}.pdf';

      final file = File(filePath);
      await file.writeAsBytes(bytes);

      return '200';
    } else {
      return response.statusCode.toString();
    }
  } catch (e) {
    print('Error downloading PDF file: $e');
    return '500';
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
