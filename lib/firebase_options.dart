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
    apiKey: 'AIzaSyDLjCQt3-kFot_Zv8SkDvlhoGX0EBvP9CE',
    appId: '1:498128936884:web:272b153b95bbd8edcfdce1',
    messagingSenderId: '498128936884',
    projectId: 'solutionchallenge2024-fcb4d',
    authDomain: 'solutionchallenge2024-fcb4d.firebaseapp.com',
    storageBucket: 'solutionchallenge2024-fcb4d.appspot.com',
    measurementId: 'G-DC5N3KPZ6C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDlQtYTNMGfiGW8A2kR28BNBMNgcX-w5Fg',
    appId: '1:498128936884:android:c688ebe1b89cdd90cfdce1',
    messagingSenderId: '498128936884',
    projectId: 'solutionchallenge2024-fcb4d',
    storageBucket: 'solutionchallenge2024-fcb4d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA72QhF3Rhzahh5AYYt8PUhFv4MUZwSVMY',
    appId: '1:498128936884:ios:e912b1d6a2706f8acfdce1',
    messagingSenderId: '498128936884',
    projectId: 'solutionchallenge2024-fcb4d',
    storageBucket: 'solutionchallenge2024-fcb4d.appspot.com',
    iosBundleId: 'com.example.googleSolutionChallenge2024',
  );
}