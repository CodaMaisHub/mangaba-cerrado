class Post {
  final String id;
  final String imageUrl;
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

  Post({
    required this.id,
    required this.imageUrl,
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
  });
}
