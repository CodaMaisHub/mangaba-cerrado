// lib/models/post.dart

class Post {
  final String userName;
  final String userLocation;
  final String imageUrl;
  final int likes;
  final int comments;
  final bool isFavorited;

  Post({
    required this.userName,
    required this.userLocation,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.isFavorited,
  });
}
