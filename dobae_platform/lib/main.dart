import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/home_page.dart';
import 'screens/upload_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // 예시용 관리자 여부 (실제 구현 시 Firestore에서 읽어오기)
    const bool isAdmin = true;

    return MaterialApp(
      title: 'Interior Review',
      home: HomePage(isAdmin: isAdmin),
       routes: {
        '/upload': (context) => const UploadPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final bool isAdmin;
  const HomePage({super.key, required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('홈'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: '글쓰기',
            onPressed: () {
              Navigator.pushNamed(context, '/upload');
            },
          ),
        ],
      ),
      body: const Center(child: Text('홈 화면 콘텐츠')),
    );
  }
}