import 'package:flutter/material.dart';
import '../data/dummy_posts.dart';
import '../widgets/post_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String currentUser = 'João Pedro'; // mock

  @override
  Widget build(BuildContext context) {
    final userPosts = dummyPosts
        .where((post) => post.userName.toLowerCase() == currentUser.toLowerCase())
        .toList();

    // 👇 Aqui fica tudo dentro do build
    final List<String> favoritedImageUrls = [
      'https://images.unsplash.com/photo-1682686581740-b093fdd0b3a4?auto=format&fit=crop&q=80&w=800',
      'https://images.unsplash.com/photo-1606788075761-17c4e83848c3?auto=format&fit=crop&q=80&w=800'
    ];

    final favoritePosts = dummyPosts
        .where((post) => favoritedImageUrls.contains(post.imageUrl))
        .toList();

    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Column(
          children: [
            // Topo
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

            // Avatar + nome + pontos
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

            const SizedBox(height: 20),

            // Abas
            const TabBar(
              indicatorColor: Colors.pink,
              labelColor: Colors.pink,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(icon: Icon(Icons.grid_on_rounded)),
                Tab(icon: Icon(Icons.star_border_rounded)),
              ],
            ),

            // Conteúdo das abas
            Expanded(
              child: TabBarView(
                children: [
                  // Aba 1
                  userPosts.isEmpty
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

                  // Aba 2
                  favoritePosts.isEmpty
                      ? const Center(child: Text('Nenhum favorito ainda.'))
                      : ListView.builder(
                          itemCount: favoritePosts.length,
                          itemBuilder: (ctx, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: PostCard(post: favoritePosts[index]),
                            );
                          },
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
