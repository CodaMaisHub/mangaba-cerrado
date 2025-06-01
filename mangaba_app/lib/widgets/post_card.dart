// lib/widgets/post_card.dart

import 'package:flutter/material.dart';
import '../models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: nome e localização
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 20,
            ),
            title: Text(post.userName,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(post.userLocation),
          ),

          // Imagem
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              post.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(child: Text("Imagem não carregada"));
              },
            ),
          ),

          // Ações (curtidas, comentários, favorito)
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                const Icon(Icons.thumb_up, color: Colors.red),
                const SizedBox(width: 4),
                Text('${post.likes} Likes'),
                const SizedBox(width: 16),
                const Icon(Icons.comment, color: Colors.pink),
                const SizedBox(width: 4),
                Text('${post.comments} Comentários'),
                const Spacer(),
                Icon(
                  post.isFavorited ? Icons.star : Icons.star_border,
                  color: Colors.deepPurple,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
