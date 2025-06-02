import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

String returnImage(String image) {
  return image;
}

double getSavingProgress(
  double currentAmount,
  double goalAmount,
) {
  if (goalAmount == 0) return 0.0;
  return (currentAmount / goalAmount);
}

DateTime getDateRange(String filter) {
  final now = DateTime.now();
  late DateTime previousDate;

  switch (filter.toLowerCase()) {
    case 'weekly':
      // Return date from 7 days ago
      previousDate = now.subtract(Duration(days: 7));
      previousDate = DateTime(previousDate.year, previousDate.month,
          previousDate.day); // Set to midnight
      break;
    case 'monthly':
      // Return first day of previous month
      previousDate = DateTime(now.year, now.month - 1, 1);
      break;
    case 'annual':
      // Return first day of previous year
      previousDate = DateTime(now.year - 1, 1, 1);
      break;
    default:
      throw ArgumentError('Invalid filter: $filter');
  }

  return previousDate;
}
