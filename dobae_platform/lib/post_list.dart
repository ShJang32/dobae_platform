// lib/post_list.dart
import 'package:flutter/material.dart';
import 'package:your_app_name/firebase_config.dart';
import 'package:your_app_name/post_repository.dart';

class PostListPage extends StatelessWidget {
  final PostRepository repository = PostRepository(FirebaseConfig.firestore);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('게시글 목록')),
      body: StreamBuilder<List<Post>>(
        stream: repository.getPostsStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          final posts = snapshot.data!;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.content, maxLines: 2, overflow: TextOverflow.ellipsis),
                  trailing: Text('${post.createdAt.toLocal()}'.split(' ')[0]),
                  onTap: () {
                    // TODO: 상세 페이지 이동 구현
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
