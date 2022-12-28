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
    apiKey: 'AIzaSyA0HFfwOmpCCuZ1r5OPgtXCoSHxN83APK0',
    appId: '1:522033726888:web:89b1de30de1e7607d8099d',
    messagingSenderId: '522033726888',
    projectId: 'biblio-rdb-app',
    authDomain: 'biblio-rdb-app.firebaseapp.com',
    databaseURL: 'https://biblio-rdb-app.firebaseio.com',
    storageBucket: 'biblio-rdb-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3FP7JLk7UAZiunFIzsQHybnZadAY4Gpc',
    appId: '1:522033726888:android:304a7fdccfa9951ed8099d',
    messagingSenderId: '522033726888',
    projectId: 'biblio-rdb-app',
    databaseURL: 'https://biblio-rdb-app.firebaseio.com',
    storageBucket: 'biblio-rdb-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDXuxX5O1I8TAcLBEfr6MbwECYIO-pDMUw',
    appId: '1:522033726888:ios:59b0d33709353f1fd8099d',
    messagingSenderId: '522033726888',
    projectId: 'biblio-rdb-app',
    databaseURL: 'https://biblio-rdb-app.firebaseio.com',
    storageBucket: 'biblio-rdb-app.appspot.com',
    iosClientId:
        '522033726888-m2edbeoo4el8mdf0r8rtav34bhcs0b8b.apps.googleusercontent.com',
    iosBundleId: 'com.example.appFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDXuxX5O1I8TAcLBEfr6MbwECYIO-pDMUw',
    appId: '1:522033726888:ios:59b0d33709353f1fd8099d',
    messagingSenderId: '522033726888',
    projectId: 'biblio-rdb-app',
    databaseURL: 'https://biblio-rdb-app.firebaseio.com',
    storageBucket: 'biblio-rdb-app.appspot.com',
    iosClientId:
        '522033726888-m2edbeoo4el8mdf0r8rtav34bhcs0b8b.apps.googleusercontent.com',
    iosBundleId: 'com.example.appFirebase',
  );
}
