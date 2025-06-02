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
import 'package:path_provider/path_provider.dart';

Future<String> downloadAndSaveExcelFile(
    String range, String uid, String firebaseIdToken) async {
  try {
    final url = Uri.parse(
        'https://gc-financial-analysis-2.onrender.com/api/export/transactions');
    final response = await http.post(
      url,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $firebaseIdToken',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode({
        'range': range,
        'uid': uid,
      }),
    );

    if (response.statusCode == 200 &&
        response.headers['content-type'] ==
            'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet') {
      final Uint8List bytes = response.bodyBytes;

      final directory = Directory('/storage/emulated/0/Download');

      final filePath =
          '${directory.path}/transactions_${DateTime.now().millisecondsSinceEpoch}.xlsx';

      final file = File(filePath);
      await file.writeAsBytes(bytes);

      // print("this is my file:---- ${filePath}");

      return '200';
    } else {
      print('Export failed: ${response.statusCode} ${response.body}');
      return response.statusCode.toString();
    }
  } catch (e) {
    print('Error downloading Excel file: $e');
    return '500';
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
