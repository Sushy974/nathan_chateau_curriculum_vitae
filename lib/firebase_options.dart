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
    apiKey: 'AIzaSyDK9GkgkwbKD6XLZSfkrK9h-SdkHQjyiNs',
    appId: '1:460679561375:web:d37c73008eec6d1bc1e2aa',
    messagingSenderId: '460679561375',
    projectId: 'nathan-chateau-cv',
    authDomain: 'nathan-chateau-cv.firebaseapp.com',
    storageBucket: 'nathan-chateau-cv.appspot.com',
    measurementId: 'G-8ZZFRDEQXL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHN9rXSwQcos1otRxLdXa30_0uNiF50Hk',
    appId: '1:460679561375:android:33cdac62fadcd397c1e2aa',
    messagingSenderId: '460679561375',
    projectId: 'nathan-chateau-cv',
    storageBucket: 'nathan-chateau-cv.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBj3UjjXGz0sMZLxKIdd-D-F2uoWWF9iug',
    appId: '1:460679561375:ios:9f054fccaa494748c1e2aa',
    messagingSenderId: '460679561375',
    projectId: 'nathan-chateau-cv',
    storageBucket: 'nathan-chateau-cv.appspot.com',
    iosClientId: '460679561375-apbjq2f2n45cao9uphi2pkgst6dsnspe.apps.googleusercontent.com',
    iosBundleId: 'com.example.nathanChateauCurriculumVitae',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBj3UjjXGz0sMZLxKIdd-D-F2uoWWF9iug',
    appId: '1:460679561375:ios:d88a7bf650fb7317c1e2aa',
    messagingSenderId: '460679561375',
    projectId: 'nathan-chateau-cv',
    storageBucket: 'nathan-chateau-cv.appspot.com',
    iosClientId: '460679561375-j94pba68t530qfa46l5rcoel0pu9vhcc.apps.googleusercontent.com',
    iosBundleId: 'com.example.nathanChateauCurriculumVitae.RunnerTests',
  );
}
