// lib/data/dummy_posts.dart

import '../models/post.dart';

final List<Post> dummyPosts = [
  Post(
    userName: 'Ana Beatriz Oliveira',
    userLocation: 'Plano Piloto',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/62/Ip%C3%AA-amarelo_Cerrado.jpg',
    likes: 124,
    comments: 37,
    isFavorited: false,
  ),
  Post(
    userName: 'Lucas Pereira Santos',
    userLocation: 'Planaltina',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/e/ef/Flor_Cerrado.jpg',
    likes: 89,
    comments: 12,
    isFavorited: true,
  ),
  Post(
    userName: 'Carla Mendes',
    userLocation: 'Ceilândia',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/8/89/Cerrado_%2816692047335%29.jpg',
    likes: 67,
    comments: 8,
    isFavorited: false,
  ),
];
