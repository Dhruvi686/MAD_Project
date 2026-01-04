import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return const FirebaseOptions(
      apiKey: 'abcd1234random',
      appId: '1:592045169426:android:fecf22010ab0fb2f59b1b',
      messagingSenderId: '789456123098',
      projectId: 'fir-2a526',
    );
  }
}
