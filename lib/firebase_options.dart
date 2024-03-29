// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDd_7DhjxdwXOjxbABM3AlQ6HFwG-08ZtY',
    appId: '1:779243678883:web:76cd88188a4d88f9bca316',
    messagingSenderId: '779243678883',
    projectId: 'chat-app-4e202',
    authDomain: 'chat-app-4e202.firebaseapp.com',
    storageBucket: 'chat-app-4e202.appspot.com',
    measurementId: 'G-NYX2RSCSFY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAWf1c7_o9EHH9kIi-mQ5kNJYiydWVlGWY',
    appId: '1:779243678883:android:178c8a96bfd4a17dbca316',
    messagingSenderId: '779243678883',
    projectId: 'chat-app-4e202',
    storageBucket: 'chat-app-4e202.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDVhrM5xerP60uzJ5W0uoh2_IDGuIsvI_g',
    appId: '1:779243678883:ios:6cd532ef5c1d3f3bbca316',
    messagingSenderId: '779243678883',
    projectId: 'chat-app-4e202',
    storageBucket: 'chat-app-4e202.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDVhrM5xerP60uzJ5W0uoh2_IDGuIsvI_g',
    appId: '1:779243678883:ios:3abf7336a3ac01cbbca316',
    messagingSenderId: '779243678883',
    projectId: 'chat-app-4e202',
    storageBucket: 'chat-app-4e202.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
