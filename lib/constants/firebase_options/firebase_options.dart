import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS) {
      return const FirebaseOptions(
        appId: '1:201683354793:ios:fe94e62bcb576e17cf55b8',
        apiKey: 'AIzaSyBxc3zXjLKmLzpDO9c5UL-xuIFZ0hBzV1Y',
        projectId: 'belkis-market',
        messagingSenderId: '201683354793',
        iosBundleId: 'com.example.belkisMarketplace',
      );
    } else if (Platform.isAndroid) {
      return const FirebaseOptions(
        appId: '1:201683354793:android:abb551107c5c2b28cf55b8',
        apiKey: 'AIzaSyB6fzAntXZ_vn3520m5sqtrd76IRb-q6HM',
        projectId: 'belkis-market',
        messagingSenderId: '201683354793',
      );
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
