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
    apiKey: 'AIzaSyCcgm6GFjX-tfkQRiRVI9pKoDCjX_c3DCI',
    appId: '1:273860035660:web:0b1cd035251f18802ae0e9',
    messagingSenderId: '273860035660',
    projectId: 'authentication-6eacf',
    authDomain: 'authentication-6eacf.firebaseapp.com',
    storageBucket: 'authentication-6eacf.firebasestorage.app',
    measurementId: 'G-LF595MBY3Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCSQ6URIS9PTyTXbzsZznLOyQ7kSYmcgJ4',
    appId: '1:273860035660:android:fd26c7f1f32fb6702ae0e9',
    messagingSenderId: '273860035660',
    projectId: 'authentication-6eacf',
    storageBucket: 'authentication-6eacf.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD_9JY8ncvoorS-BLqLgks351oKpUlwnTc',
    appId: '1:273860035660:ios:75a9734d432761492ae0e9',
    messagingSenderId: '273860035660',
    projectId: 'authentication-6eacf',
    storageBucket: 'authentication-6eacf.firebasestorage.app',
    iosBundleId: 'com.example.firebaseNewProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD_9JY8ncvoorS-BLqLgks351oKpUlwnTc',
    appId: '1:273860035660:ios:75a9734d432761492ae0e9',
    messagingSenderId: '273860035660',
    projectId: 'authentication-6eacf',
    storageBucket: 'authentication-6eacf.firebasestorage.app',
    iosBundleId: 'com.example.firebaseNewProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCcgm6GFjX-tfkQRiRVI9pKoDCjX_c3DCI',
    appId: '1:273860035660:web:0ce8bfe795e20fa22ae0e9',
    messagingSenderId: '273860035660',
    projectId: 'authentication-6eacf',
    authDomain: 'authentication-6eacf.firebaseapp.com',
    storageBucket: 'authentication-6eacf.firebasestorage.app',
    measurementId: 'G-405VF49CM8',
  );
}
