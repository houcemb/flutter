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
    apiKey: 'AIzaSyA4TRoYCCqNOs6kepZf6T-QmPH0uIZDAcA',
    appId: '1:897511750108:web:b4725641563db39228b719',
    messagingSenderId: '897511750108',
    projectId: 'todoapp-1c789',
    authDomain: 'todoapp-1c789.firebaseapp.com',
    storageBucket: 'todoapp-1c789.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAIZ9feBMleX57-PLf7QNHoTFJv6F8Pzrc',
    appId: '1:897511750108:android:c3adb62f14ccd41328b719',
    messagingSenderId: '897511750108',
    projectId: 'todoapp-1c789',
    storageBucket: 'todoapp-1c789.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADU2FkFRGk19uD_YkFpC78FlO6Cev4zgA',
    appId: '1:897511750108:ios:2af3a5b7b839d2ed28b719',
    messagingSenderId: '897511750108',
    projectId: 'todoapp-1c789',
    storageBucket: 'todoapp-1c789.appspot.com',
    iosClientId: '897511750108-hj6bioob94rj74s2alcorts9g2cq807k.apps.googleusercontent.com',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyADU2FkFRGk19uD_YkFpC78FlO6Cev4zgA',
    appId: '1:897511750108:ios:2af3a5b7b839d2ed28b719',
    messagingSenderId: '897511750108',
    projectId: 'todoapp-1c789',
    storageBucket: 'todoapp-1c789.appspot.com',
    iosClientId: '897511750108-hj6bioob94rj74s2alcorts9g2cq807k.apps.googleusercontent.com',
    iosBundleId: 'com.example.todo',
  );
}
