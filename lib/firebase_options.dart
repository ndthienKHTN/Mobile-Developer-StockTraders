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
    apiKey: 'AIzaSyB5GD1OPub0taGJe_DW0j7zcc45XWV9okc',
    appId: '1:1089493407939:web:226773010a8373e2cb2a76',
    messagingSenderId: '1089493407939',
    projectId: 'stock-1d671',
    authDomain: 'stock-1d671.firebaseapp.com',
    storageBucket: 'stock-1d671.appspot.com',
    measurementId: 'G-V1PJHX87FD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvHwbVh-fxHMNkWn1yQes-2Hw6I4HXIsA',
    appId: '1:1089493407939:android:927b543c456dc3f7cb2a76',
    messagingSenderId: '1089493407939',
    projectId: 'stock-1d671',
    storageBucket: 'stock-1d671.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAiVcnnZ--jHytg4CdvTLsnGbQq3opH0zk',
    appId: '1:1089493407939:ios:6ee528b4a3c1dd0fcb2a76',
    messagingSenderId: '1089493407939',
    projectId: 'stock-1d671',
    storageBucket: 'stock-1d671.appspot.com',
    iosBundleId: 'com.example.projectLogin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAiVcnnZ--jHytg4CdvTLsnGbQq3opH0zk',
    appId: '1:1089493407939:ios:6ee528b4a3c1dd0fcb2a76',
    messagingSenderId: '1089493407939',
    projectId: 'stock-1d671',
    storageBucket: 'stock-1d671.appspot.com',
    iosBundleId: 'com.example.projectLogin',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB5GD1OPub0taGJe_DW0j7zcc45XWV9okc',
    appId: '1:1089493407939:web:7eab0e8a1a9e4c04cb2a76',
    messagingSenderId: '1089493407939',
    projectId: 'stock-1d671',
    authDomain: 'stock-1d671.firebaseapp.com',
    storageBucket: 'stock-1d671.appspot.com',
    measurementId: 'G-06MX5R9GFB',
  );
}
