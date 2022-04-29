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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCGR2kXb0kczfAy8FhibgJQ_cvFVHhApko',
    appId: '1:293997197792:web:107783046b41593a8d9385',
    messagingSenderId: '293997197792',
    projectId: 'golaundry-application',
    authDomain: 'golaundry-application.firebaseapp.com',
    databaseURL: 'https://golaundry-application-default-rtdb.firebaseio.com',
    storageBucket: 'golaundry-application.appspot.com',
    measurementId: 'G-65EX9DHYFG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC1mLeCTXF5j-Qs5b3oBevODbSa5xV9ViU',
    appId: '1:293997197792:android:54ee696c439215968d9385',
    messagingSenderId: '293997197792',
    projectId: 'golaundry-application',
    databaseURL: 'https://golaundry-application-default-rtdb.firebaseio.com',
    storageBucket: 'golaundry-application.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDzZRzXpHv-AaxI1HMLp4yskwsD9-wFNUo',
    appId: '1:293997197792:ios:f50fb672ab1717628d9385',
    messagingSenderId: '293997197792',
    projectId: 'golaundry-application',
    databaseURL: 'https://golaundry-application-default-rtdb.firebaseio.com',
    storageBucket: 'golaundry-application.appspot.com',
    iosClientId: '293997197792-p88hbejalq4kmqq87jlmu294rbalmj0d.apps.googleusercontent.com',
    iosBundleId: 'com.safira.golaundry',
  );
}