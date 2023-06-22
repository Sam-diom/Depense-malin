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
    apiKey: 'AIzaSyCMcu7seb4edXUsb6P13G4kNH4l-fphaYg',
    appId: '1:1077784382759:web:71cd7fd785f6af3706ad02',
    messagingSenderId: '1077784382759',
    projectId: 'authentificationdepensemalin',
    authDomain: 'authentificationdepensemalin.firebaseapp.com',
    storageBucket: 'authentificationdepensemalin.appspot.com',
    measurementId: 'G-JP6SFHF8KK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDVXEnOC1o2CNsmST3MKGWvKvu7Xjy79Mw',
    appId: '1:1077784382759:android:f628e8c113b13a0906ad02',
    messagingSenderId: '1077784382759',
    projectId: 'authentificationdepensemalin',
    storageBucket: 'authentificationdepensemalin.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyByAbqS5YzzAKDnuTiXnG8S9f-hJRHt_ZI',
    appId: '1:1077784382759:ios:60fbbad1f8abd88806ad02',
    messagingSenderId: '1077784382759',
    projectId: 'authentificationdepensemalin',
    storageBucket: 'authentificationdepensemalin.appspot.com',
    iosClientId: '1077784382759-frmk14eknmmcdufcmlpfmh43p8boiiog.apps.googleusercontent.com',
    iosBundleId: 'com.example.depenseMalin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyByAbqS5YzzAKDnuTiXnG8S9f-hJRHt_ZI',
    appId: '1:1077784382759:ios:0ec9daa0e321feb106ad02',
    messagingSenderId: '1077784382759',
    projectId: 'authentificationdepensemalin',
    storageBucket: 'authentificationdepensemalin.appspot.com',
    iosClientId: '1077784382759-csu6qji7005gtcngd92ot47cg4hntuq3.apps.googleusercontent.com',
    iosBundleId: 'com.example.depenseMalin.RunnerTests',
  );
}
