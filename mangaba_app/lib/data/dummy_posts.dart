// lib/data/dummy_posts.dart
import '../models/post.dart';

final List<Post> dummyPosts = [
  Post(
    id: '1',
    imageUrl: 'https://source.unsplash.com/600x400/?cerrado,nature',
    location: 'Chapada dos Veadeiros, GO',
    hashtags: ['#CerradoVivo', '#FloraNativa'],
    description: 'Flor do cerrado encontrada durante uma trilha encantadora! 🌺',
    likes: 128,
    comments: 12,
  ),
  Post(
    id: '2',
    imageUrl: 'https://source.unsplash.com/600x400/?cerrado,tree',
    location: 'Parque Nacional Grande Sertão Veredas, MG',
    hashtags: ['#Veredas', '#Natureza'],
    description: 'Árvore típica do cerrado com copa linda e imponente.',
    likes: 90,
    comments: 8,
  ),
];

