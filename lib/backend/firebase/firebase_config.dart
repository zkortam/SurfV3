import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAH9i_iQbSQkTS__guo-Xuu1Sctzua_zwo",
            authDomain: "surfversion3.firebaseapp.com",
            projectId: "surfversion3",
            storageBucket: "surfversion3.appspot.com",
            messagingSenderId: "588737506675",
            appId: "1:588737506675:web:7b975752dd1fb64097e906",
            measurementId: "G-PTPKDKWRX3"));
  } else {
    await Firebase.initializeApp();
  }
}
