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
    apiKey: 'AIzaSyD3L4FZbQhPvmYUtvkBs36-0QSBv2oE37U',
    appId: '1:742898791793:web:ffa83c24d6e9aa4942f2d0',
    messagingSenderId: '742898791793',
    projectId: 'clone-5b386',
    authDomain: 'clone-5b386.firebaseapp.com',
    storageBucket: 'clone-5b386.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBd720y6-Scincrdwm3R1sCN9zVz7o0A4A',
    appId: '1:742898791793:android:a8582512da4487a542f2d0',
    messagingSenderId: '742898791793',
    projectId: 'clone-5b386',
    storageBucket: 'clone-5b386.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC9UPtGzF3Iu_DZYzMoGyDDtxcJefs6svs',
    appId: '1:742898791793:ios:1fd3f5d8245822d742f2d0',
    messagingSenderId: '742898791793',
    projectId: 'clone-5b386',
    storageBucket: 'clone-5b386.appspot.com',
    iosClientId: '742898791793-fsgj6chd6o1jbkapfhoqoqb8go566tck.apps.googleusercontent.com',
    iosBundleId: 'demetdemir.app.amazonClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC9UPtGzF3Iu_DZYzMoGyDDtxcJefs6svs',
    appId: '1:742898791793:ios:1fd3f5d8245822d742f2d0',
    messagingSenderId: '742898791793',
    projectId: 'clone-5b386',
    storageBucket: 'clone-5b386.appspot.com',
    iosClientId: '742898791793-fsgj6chd6o1jbkapfhoqoqb8go566tck.apps.googleusercontent.com',
    iosBundleId: 'demetdemir.app.amazonClone',
  );
}