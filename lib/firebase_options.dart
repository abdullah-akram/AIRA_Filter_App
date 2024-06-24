// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCmfxwXTPAcNVH8C1cb-cWIDpQQ_e0e46c',
    appId: '1:361625590936:web:7ee941d00217a5122b04ed',
    messagingSenderId: '361625590936',
    projectId: 'aira-filter-app',
    authDomain: 'aira-filter-app.firebaseapp.com',
    storageBucket: 'aira-filter-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAF5ekhGdG3_4DxvJDgNANn032R3oiwGQA',
    appId: '1:361625590936:android:daa3f35c33fb0a992b04ed',
    messagingSenderId: '361625590936',
    projectId: 'aira-filter-app',
    storageBucket: 'aira-filter-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA0JfUe0O_sWz8N41UZd-BromLlBtiXWa4',
    appId: '1:361625590936:ios:fa400f95acbf06902b04ed',
    messagingSenderId: '361625590936',
    projectId: 'aira-filter-app',
    storageBucket: 'aira-filter-app.appspot.com',
    iosBundleId: 'com.example.airaFilterApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA0JfUe0O_sWz8N41UZd-BromLlBtiXWa4',
    appId: '1:361625590936:ios:fa400f95acbf06902b04ed',
    messagingSenderId: '361625590936',
    projectId: 'aira-filter-app',
    storageBucket: 'aira-filter-app.appspot.com',
    iosBundleId: 'com.example.airaFilterApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCmfxwXTPAcNVH8C1cb-cWIDpQQ_e0e46c',
    appId: '1:361625590936:web:7f454848a9a6d6832b04ed',
    messagingSenderId: '361625590936',
    projectId: 'aira-filter-app',
    authDomain: 'aira-filter-app.firebaseapp.com',
    storageBucket: 'aira-filter-app.appspot.com',
  );
}