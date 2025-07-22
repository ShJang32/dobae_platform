// widgets/post_card.dart
import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  final Map<String, dynamic> data;
  final String docId;

  const PostCard({required this.data, required this.docId, super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool liked = false;
  bool saved = false;

  @override
  Widget build(BuildContext context) {
    final post = widget.data;
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (post['imageUrl'] != null)
              Image.network(post['imageUrl'], fit: BoxFit.cover),
            const SizedBox(height: 8),
            Text(post['text'] ?? '', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  icon: Icon(liked ? Icons.favorite : Icons.favorite_border),
                  onPressed: () {
                    setState(() => liked = !liked);
                    // TODO: Firestore 좋아요 count 반영
                  },
                ),
                IconButton(
                  icon: Icon(saved ? Icons.bookmark : Icons.bookmark_border),
                  onPressed: () {
                    setState(() => saved = !saved);
                    // TODO: 스크랩 DB 반영
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.comment),
                  onPressed: () {
                    // TODO: 댓글 다이얼로그 또는 페이지로 이동
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
