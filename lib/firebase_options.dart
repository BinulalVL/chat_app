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
    apiKey: 'AIzaSyA2csImF6pX1i3gWScd_5e3u9iW-tqYj5w',
    appId: '1:42101943039:web:229105022970f66e8dbaca',
    messagingSenderId: '42101943039',
    projectId: 'testapp-2f3dc',
    authDomain: 'testapp-2f3dc.firebaseapp.com',
    storageBucket: 'testapp-2f3dc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAfsBfwpbWS4536NvjaF0npZ-GZf-mJsts',
    appId: '1:42101943039:android:9a62fa110a66f0918dbaca',
    messagingSenderId: '42101943039',
    projectId: 'testapp-2f3dc',
    storageBucket: 'testapp-2f3dc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDu9rtKcqooFBE1X-gKVRQAQQ_1UzwaTFI',
    appId: '1:42101943039:ios:a6a706f37ce856a28dbaca',
    messagingSenderId: '42101943039',
    projectId: 'testapp-2f3dc',
    storageBucket: 'testapp-2f3dc.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDu9rtKcqooFBE1X-gKVRQAQQ_1UzwaTFI',
    appId: '1:42101943039:ios:a03339652ecd47ca8dbaca',
    messagingSenderId: '42101943039',
    projectId: 'testapp-2f3dc',
    storageBucket: 'testapp-2f3dc.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}