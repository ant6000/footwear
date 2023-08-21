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
    apiKey: 'AIzaSyAUOaHOV4RqdJeDEQ_3Gm2ty5AxUlRr8RY',
    appId: '1:455166254173:web:aa981528914cd6bd6e41b4',
    messagingSenderId: '455166254173',
    projectId: 'test-flutter-a0656',
    authDomain: 'test-flutter-a0656.firebaseapp.com',
    storageBucket: 'test-flutter-a0656.appspot.com',
    measurementId: 'G-7TNW0X8N4H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyChFm7h4xhIKLgC5Yblpafgd-UW2fxgDtw',
    appId: '1:455166254173:android:b42cc19116621a566e41b4',
    messagingSenderId: '455166254173',
    projectId: 'test-flutter-a0656',
    storageBucket: 'test-flutter-a0656.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB9PL3E2OFbqGt0UW9Az1e5rKXhtwl0wfg',
    appId: '1:455166254173:ios:ac1bc84eac58403a6e41b4',
    messagingSenderId: '455166254173',
    projectId: 'test-flutter-a0656',
    storageBucket: 'test-flutter-a0656.appspot.com',
    iosClientId: '455166254173-hubvdklgf6gsadn0cr75k40c3akp0r6l.apps.googleusercontent.com',
    iosBundleId: 'com.example.footwear',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB9PL3E2OFbqGt0UW9Az1e5rKXhtwl0wfg',
    appId: '1:455166254173:ios:69ddef19567492496e41b4',
    messagingSenderId: '455166254173',
    projectId: 'test-flutter-a0656',
    storageBucket: 'test-flutter-a0656.appspot.com',
    iosClientId: '455166254173-h5u6c8emdjk0pb503qjbirts8p33pv8q.apps.googleusercontent.com',
    iosBundleId: 'com.example.footwear.RunnerTests',
  );
}