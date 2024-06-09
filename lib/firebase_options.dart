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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBmuq7MBgD3apumovwh-FEtMeX9N0WbHj8',
    appId: '1:966605832549:web:80c09393da8cfef9abe18c',
    messagingSenderId: '966605832549',
    projectId: 'flutter-note-app-45a62',
    authDomain: 'flutter-note-app-45a62.firebaseapp.com',
    storageBucket: 'flutter-note-app-45a62.appspot.com',
    measurementId: 'G-40X99RB4WK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBfMLLFtRw7nVjXamc1TA8IxYiu-q4dU_Q',
    appId: '1:966605832549:android:0e9d5a7cca17643eabe18c',
    messagingSenderId: '966605832549',
    projectId: 'flutter-note-app-45a62',
    storageBucket: 'flutter-note-app-45a62.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCMQfV__f6HDJ9OqHGIlfNLU3K2ZjyrSbc',
    appId: '1:966605832549:ios:685ece0c94713d65abe18c',
    messagingSenderId: '966605832549',
    projectId: 'flutter-note-app-45a62',
    storageBucket: 'flutter-note-app-45a62.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );
}
