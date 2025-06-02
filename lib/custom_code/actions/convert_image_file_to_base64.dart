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
import 'dart:typed_data'; // For Uint8List

// Define the custom action
Future<String> convertImageFileToBase64(
    FFUploadedFile? uploadedImageFile) async {
  // Check if the uploadedImageFile or its bytes are null
  if (uploadedImageFile == null || uploadedImageFile.bytes == null) {
    // You can log an error or return an empty string or throw an exception
    // FF.logger.warning('No image file provided or bytes are null.');
    return ''; // Return empty string if no file or bytes
  }

  // Get the bytes from the FFUploadedFile
  Uint8List imageBytes = uploadedImageFile.bytes!;

  // Encode the bytes to Base64
  String base64String = base64Encode(imageBytes);

  // Determine the MIME type from the file extension
  // FFUploadedFile has a 'name' property which includes the extension
  String? fileName = uploadedImageFile.name;
  String mimeType = 'image/png'; // Default MIME type

  if (fileName != null && fileName.contains('.')) {
    String extension = fileName.split('.').last.toLowerCase();
    if (extension == 'jpg' || extension == 'jpeg') {
      mimeType = 'image/jpeg';
    } else if (extension == 'png') {
      mimeType = 'image/png';
    } else if (extension == 'gif') {
      mimeType = 'image/gif';
    } else if (extension == 'webp') {
      mimeType = 'image/webp';
    }
    // Add more MIME types if you expect other formats
  }

  // Prepend the
  //  Data URI scheme
  return "data:$mimeType;base64,$base64String";
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
