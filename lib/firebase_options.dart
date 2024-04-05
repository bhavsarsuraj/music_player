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
    apiKey: 'AIzaSyDH3lPEpk5UpOjw1ST8YuPLTUxsLqQK7n0',
    appId: '1:803206253026:web:ae49df16031f1d434911bb',
    messagingSenderId: '803206253026',
    projectId: 'musicplayer-38efa',
    authDomain: 'musicplayer-38efa.firebaseapp.com',
    storageBucket: 'musicplayer-38efa.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC9xCTrp3pvplxDrSZrQMDDYIXGrus3wIQ',
    appId: '1:803206253026:android:cd6a42fe66ee9cbc4911bb',
    messagingSenderId: '803206253026',
    projectId: 'musicplayer-38efa',
    storageBucket: 'musicplayer-38efa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkfSPNYA3MvHTmrKYIqylwA8dbHv1UEFg',
    appId: '1:803206253026:ios:7c573cfc56610e844911bb',
    messagingSenderId: '803206253026',
    projectId: 'musicplayer-38efa',
    storageBucket: 'musicplayer-38efa.appspot.com',
    iosBundleId: 'com.musicplayer.in.musicPlayer',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDkfSPNYA3MvHTmrKYIqylwA8dbHv1UEFg',
    appId: '1:803206253026:ios:b6354fb9cd8b01d54911bb',
    messagingSenderId: '803206253026',
    projectId: 'musicplayer-38efa',
    storageBucket: 'musicplayer-38efa.appspot.com',
    iosBundleId: 'com.musicplayer.in.musicPlayer.RunnerTests',
  );
}
