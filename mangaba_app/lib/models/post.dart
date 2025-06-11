class Post {
  final String id;
  final String imageUrl;
<<<<<<< HEAD
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
=======
  final String location;
  final List<String> hashtags;
  final String description;
  final double? latitude;     // ADICIONADO
  final double? longitude;    // ADICIONADO
  final String? userName;     // ADICIONADO
  final String? userLocation; // ADICIONADO
  final int likes;
  final int comments;
  final bool isFavorite;
>>>>>>> 19e6728b10a41a1dd9c23e3e8b94b83ba495dee8

  Post({
    required this.id,
    required this.imageUrl,
<<<<<<< HEAD
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
=======
    required this.location,
    required this.hashtags,
    required this.description,
    this.latitude,
    this.longitude,
    this.userName,
    this.userLocation,
    this.likes = 0,
    this.comments = 0,
    this.isFavorite = false,
>>>>>>> 19e6728b10a41a1dd9c23e3e8b94b83ba495dee8
  });
}
