import 'package:flutter/material.dart';
import '../data/dummy_posts.dart';
import '../widgets/post_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String currentUser = 'João Pedro'; // Nome do usuário logado (mock)

  @override
  Widget build(BuildContext context) {
    // Filtra os posts apenas do usuário atual
    final userPosts = dummyPosts
        .where((post) => post.userName.toLowerCase() == currentUser.toLowerCase())
        .toList();

    return SafeArea(
      child: Column(
        children: [
          // Topo: Título e ícone de engrenagem
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Perfil',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.settings, color: Colors.pink),
              ],
            ),
          ),

          // Avatar, nome, função e pontos (mockado por enquanto)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/men/32.jpg',
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'João Pedro',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Estudante',
                      style: TextStyle(fontSize: 14, color: Colors.pink),
                    ),
                  ],
                ),
                const Spacer(),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: '100',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(2, -10),
                          child: const Text(
                            'M',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.pink,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const TextSpan(
                        text: ' Points',
                        style: TextStyle(fontSize: 16, color: Colors.pink),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Lista de postagens do usuário
          Expanded(
            child: userPosts.isEmpty
                ? const Center(child: Text('Nenhuma postagem ainda.'))
                : ListView.builder(
                    itemCount: userPosts.length,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: PostCard(post: userPosts[index]),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
