import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBJNGqED8aMX-ktWZSyGHelZ3wegiOzVc0",
            authDomain: "expense-tracker-9d205.firebaseapp.com",
            projectId: "expense-tracker-9d205",
            storageBucket: "expense-tracker-9d205.firebasestorage.app",
            messagingSenderId: "469656757991",
            appId: "1:469656757991:web:d24d64065b477462d5e442",
            measurementId: "G-DBREDNGMKW"));
  } else {
    await Firebase.initializeApp();
  }
}
