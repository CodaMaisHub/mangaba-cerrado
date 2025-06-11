import 'package:flutter/material.dart';
import '../models/post.dart';

class PostCard extends StatefulWidget {
  final Post post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late Post post;

  @override
  void initState() {
    super.initState();
    post = widget.post;
  }

  void toggleFavorite() {
    setState(() {
      post.isFavorited = !post.isFavorited;
    });
  }

  void toggleLike() {
    setState(() {
      post.isLiked = !post.isLiked;
      post.likes += post.isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // imagem
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(post.imageUrl, width: double.infinity, height: 200, fit: BoxFit.cover),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
<<<<<<< HEAD
                GestureDetector(
                  onTap: toggleLike,
                  child: Icon(
                    post.isLiked ? Icons.thumb_up : Icons.thumb_up_off_alt,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(width: 4),
                Text('${post.likes} Likes'),
                const SizedBox(width: 16),
                const Icon(Icons.comment, color: Colors.pink),
                const SizedBox(width: 4),
                Text('${post.comments} Comentários'),
                const Spacer(),
                GestureDetector(
                  onTap: toggleFavorite,
                  child: Icon(
                    post.isFavorited ? Icons.star : Icons.star_border,
                    color: Colors.deepPurple,
                  ),
=======
                // localização
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(post.location, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 6),

                // descrição
                Text(
                  post.description.length > 255 ? post.description.substring(0, 255) + '...' : post.description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 6),

                // hashtags
                Wrap(
                  spacing: 6,
                  children: post.hashtags.map((tag) => Chip(label: Text(tag))).toList(),
                ),

                const SizedBox(height: 8),

                // curtidas e comentários
                Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.pink[300]),
                    const SizedBox(width: 4),
                    Text('${post.likes}'),
                    const SizedBox(width: 16),
                    const Icon(Icons.comment, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text('${post.comments}'),
                  ],
>>>>>>> 19e6728b10a41a1dd9c23e3e8b94b83ba495dee8
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}