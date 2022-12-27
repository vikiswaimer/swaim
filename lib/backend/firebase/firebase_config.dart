import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCdECalWlQobOrJ8nXsY8yVtSW1V1PTRn8",
            authDomain: "swaim-test-2.firebaseapp.com",
            projectId: "swaim-test-2",
            storageBucket: "swaim-test-2.appspot.com",
            messagingSenderId: "473471426747",
            appId: "1:473471426747:web:4c77a9019a850d2b4a499e"));
  } else {
    await Firebase.initializeApp();
  }
}
