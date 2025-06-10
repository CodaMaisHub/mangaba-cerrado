// lib/data/dummy_posts.dart
import '../models/post.dart';

final List<Post> dummyPosts = [
  Post(
    userName: 'Usuário 1',
    userLocation: 'Plano Piloto',
    imageUrl: 'https://picsum.photos/seed/0/400/300',
    likes: 48,
    comments: 1,
    isFavorited: true,
    latitude: -15.793889,
    longitude: -47.882778,
  ),
  // outros posts aqui
];
