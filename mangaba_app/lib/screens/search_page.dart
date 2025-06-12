import 'package:flutter/material.dart';
import '../data/dummy_posts.dart';
import '../models/post.dart';
import '../widgets/post_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final usersFound = dummyPosts
        .where((post) => post.userName
            .toLowerCase()
            .contains(_searchQuery.toLowerCase()))
        .toSet()
        .toList();

    final itemsFound = dummyPosts
        .where((post) =>
            post.text.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            post.location.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar'),
        backgroundColor: Colors.pink[100],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Buscar usuários ou itens',
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
          Expanded(
            child: _searchQuery.isEmpty
                ? const Center(
                    child: Text(
                      'Digite algo para buscar',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (usersFound.isNotEmpty) ...[
                          const Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Text(
                              'Usuários encontrados',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: usersFound.length,
                            itemBuilder: (ctx, index) {
                              final user = usersFound[index];
                              return ListTile(
                                leading: const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://randomuser.me/api/portraits/women/30.jpg'),
                                ),
                                title: Text(user.userName),
                                subtitle: const Text('Ver perfil'),
                                onTap: () {
                                  // Adicione navegação para perfil se quiser
                                },
                              );
                            },
                          ),
                        ],
                        if (itemsFound.isNotEmpty) ...[
                          const Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Text(
                              'Itens encontrados no Cerrado',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: itemsFound.length,
                            itemBuilder: (ctx, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: PostCard(post: itemsFound[index]),
                              );
                            },
                          ),
                        ],
                        if (usersFound.isEmpty && itemsFound.isEmpty)
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Center(
                              child: Text(
                                'Nenhum resultado encontrado.',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
