import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('인테리어 리뷰 홈'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: '글쓰기',
            onPressed: () {
              Navigator.pushNamed(context, '/upload'); // 글쓰기 페이지로 이동
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('홈 화면 콘텐츠: 후기 리스트, 키워드 검색 등'),
      ),
    );
  }
}
