import 'package:flutter/material.dart';
import '../data/dummy_posts.dart';
import '../widgets/post_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String currentUser = 'João Pedro'; // Nome do usuário logado (mock)
<<<<<<< HEAD

  @override
  Widget build(BuildContext context) {
    // Filtra os posts apenas do usuário atual
    final userPosts = dummyPosts
        .where((post) => post.userName.toLowerCase() == currentUser.toLowerCase())
        .toList();

=======

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    // Filtra os posts pelo userName e ordena alfabeticamente
    final filtered = dummyPosts
        .where((post) =>
            post.userName.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    filtered.sort(
        (a, b) => a.userName.toLowerCase().compareTo(b.userName.toLowerCase()));

=======
    // Filtra os posts apenas do usuário atual
    final userPosts = dummyPosts
        .where((post) => post.userName.toLowerCase() == currentUser.toLowerCase())
        .toList();

>>>>>>> 53c1804 (Pagina de perfil esclusiva do usuario)
>>>>>>> ae7df06 (Pagina de perfil esclusiva do usuario)
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

<<<<<<< HEAD
          // Avatar, nome, função e pontos (mockado por enquanto)
=======
<<<<<<< HEAD
          // Caixa de busca
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Buscar por usuário',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          const SizedBox(height: 16),

          // Avatar, nome, função e pontos (fixo, pode ajustar se quiser dinamizar)
=======
          // Avatar, nome, função e pontos (mockado por enquanto)
>>>>>>> 53c1804 (Pagina de perfil esclusiva do usuario)
>>>>>>> ae7df06 (Pagina de perfil esclusiva do usuario)
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
<<<<<<< HEAD
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
=======
<<<<<<< HEAD
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
=======
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
>>>>>>> 53c1804 (Pagina de perfil esclusiva do usuario)
>>>>>>> ae7df06 (Pagina de perfil esclusiva do usuario)
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

<<<<<<< HEAD
          // Lista de postagens do usuário
          Expanded(
=======
<<<<<<< HEAD
          // Lista de postagens filtradas e ordenadas
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: PostCard(post: filtered[index]),
                );
              },
            ),
=======
          // Lista de postagens do usuário
          Expanded(
>>>>>>> ae7df06 (Pagina de perfil esclusiva do usuario)
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
<<<<<<< HEAD
=======
>>>>>>> 53c1804 (Pagina de perfil esclusiva do usuario)
>>>>>>> ae7df06 (Pagina de perfil esclusiva do usuario)
          ),
        ],
      ),
    );
  }
}
