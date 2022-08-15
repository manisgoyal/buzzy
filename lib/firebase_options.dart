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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDYnHjHvQH0b5996EgikkcNT78zcF2YJF8',
    appId: '1:145982551528:android:e2f9d7557cce7fdddba05d',
    messagingSenderId: '145982551528',
    projectId: 'buzzy-siam',
    databaseURL: 'https://buzzy-siam-default-rtdb.firebaseio.com',
    storageBucket: 'buzzy-siam.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCBT_d7TKxmmpWtuZPyFGNnk-ECeI9d0X4',
    appId: '1:145982551528:ios:a89e047b77704e2ddba05d',
    messagingSenderId: '145982551528',
    projectId: 'buzzy-siam',
    databaseURL: 'https://buzzy-siam-default-rtdb.firebaseio.com',
    storageBucket: 'buzzy-siam.appspot.com',
    iosClientId: '145982551528-l14fumeg12m1vnbuirkndu4uj1eafs2c.apps.googleusercontent.com',
    iosBundleId: 'com.example.buzzy',
  );
}