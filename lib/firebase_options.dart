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
    apiKey: 'AIzaSyBbSaaAH0yqJk-p4v3CUUhOhUuNv1krr8Q',
    appId: '1:660688921378:android:8659b900302fa6f47e7b7b',
    messagingSenderId: '660688921378',
    projectId: 'bookingdive-8888',
    storageBucket: 'bookingdive-8888.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBelBuq4L1g1dfweWyVWSwslinsgn7OIL4',
    appId: '1:660688921378:ios:b72f4ed9703f3b1e7e7b7b',
    messagingSenderId: '660688921378',
    projectId: 'bookingdive-8888',
    storageBucket: 'bookingdive-8888.appspot.com',
    androidClientId: '660688921378-h177l5961ir74bjaeitrg2hsqrgd65oq.apps.googleusercontent.com',
    iosClientId: '660688921378-mla0d6t5u9f88pmciba0imllp1ssts3i.apps.googleusercontent.com',
    iosBundleId: 'com.nilevia.bookingdive',
  );
}
