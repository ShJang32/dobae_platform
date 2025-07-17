// firestore에서 게시글 읽기
// lib/post_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String id;
  final String title;
  final String content;
  final List<String> imageUrls;
  final DateTime createdAt;
  final List<String> emoji;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrls,
    required this.createdAt,
    required this.emoji,
  });

  factory Post.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return Post(
      id: doc.id,
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      imageUrls: List<String>.from(data['imageUrls'] ?? []),
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      emoji: List<String>.from(data['emoji'] ?? []),
    );
  }
}

class PostRepository {
  final FirebaseFirestore _firestore;

  PostRepository(this._firestore);

  Stream<List<Post>> getPostsStream() {
    return _firestore
        .collection('posts')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Post.fromDocument(doc)).toList());
  }
}
