import 'package:mangaba_app/models/post.dart';

final List<Post> dummyPosts = [
  Post(
    userName: 'João Pedro',
    userLocation: 'Plano Piloto',
    imageUrl: 'https://picsum.photos/200/300?random=1',
    likes: 50,
    comments: 10,
    isFavorited: true,
    date: DateTime(2025, 6, 10),
    text: 'Minha primeira postagem no Cerrado!',
    location: 'Setor norte - Brasília',
    latitude: -15.77972,
    longitude: -47.92972,
    hashtags: ['#Cerrado', '#Flora'],
  ),
  Post(
    userName: 'Ana Beatriz Oliveira',
    userLocation: 'Planaltina',
    imageUrl: 'https://picsum.photos/200/300?random=2',
    likes: 124,
    comments: 37,
    isFavorited: false,
    date: DateTime(2025, 1, 14),
    text: 'Alguém sabe o nome?',
    location: 'Planaltina - Brasília',
    latitude: -15.6188,
    longitude: -47.6786,
    hashtags: ['#Cerrado'],
  ),
];