// lib/firebase_config.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseConfig {
  static Future<FirebaseApp> init() async {
    return await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform, // 나중에 자동 생성된 옵션 쓰면 됨
    );
  }

  static FirebaseFirestore get firestore => FirebaseFirestore.instance;
}
