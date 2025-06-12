class Post {
  final String userName;
  final String userLocation;
  final String imageUrl;
  int likes;
  int comments;
  bool isFavorited;
  bool isLiked;
  final DateTime date;
  final String text;
  final String location;
  final double latitude;
  final double longitude;
  final List<String> hashtags;

  Post({
    required this.userName,
    required this.userLocation,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    this.isFavorited = false,
    this.isLiked = false,
    required this.date,
    required this.text,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.hashtags,
  });
}
