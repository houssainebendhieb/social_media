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
    apiKey: 'AIzaSyCCLxz45XbQYTErpxUVpyCVD3MItaxB61g',
    appId: '1:217369637030:web:864a80eebb8bc312428467',
    messagingSenderId: '217369637030',
    projectId: 'useradd-ef05d',
    authDomain: 'useradd-ef05d.firebaseapp.com',
    storageBucket: 'useradd-ef05d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6tEWg3_BZtlvOn1VGbU8PMusPRUzhFDM',
    appId: '1:217369637030:android:3415b3e8fddaa9a8428467',
    messagingSenderId: '217369637030',
    projectId: 'useradd-ef05d',
    storageBucket: 'useradd-ef05d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAfih0-LTkW074Z_-SVo-qZuic5F353tGk',
    appId: '1:217369637030:ios:6346fcdaec1dfc72428467',
    messagingSenderId: '217369637030',
    projectId: 'useradd-ef05d',
    storageBucket: 'useradd-ef05d.appspot.com',
    iosBundleId: 'com.example.socialMedia',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAfih0-LTkW074Z_-SVo-qZuic5F353tGk',
    appId: '1:217369637030:ios:6346fcdaec1dfc72428467',
    messagingSenderId: '217369637030',
    projectId: 'useradd-ef05d',
    storageBucket: 'useradd-ef05d.appspot.com',
    iosBundleId: 'com.example.socialMedia',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBx9aENh9ghJZUR8aLeC8Wk4VKyJJKlMQ0',
    appId: '1:217369637030:web:f7eaa5e1fa959299428467',
    messagingSenderId: '217369637030',
    projectId: 'useradd-ef05d',
    authDomain: 'useradd-ef05d.firebaseapp.com',
    storageBucket: 'useradd-ef05d.appspot.com',
  );
}
