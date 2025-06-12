import 'package:flutter/material.dart';
import '../data/dummy_users.dart';
import '../data/dummy_posts.dart';
import '../models/post.dart';
import '../widgets/post_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredUsers = dummyUsers
        .where((user) =>
            user.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    final filteredPosts = dummyPosts
        .where((post) =>
            post.userName.toLowerCase().contains(searchQuery.toLowerCase()) ||
            post.text.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) => setState(() => searchQuery = value),
              decoration: InputDecoration(
                hintText: 'Buscar estudantes ou postagens...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          // Resultados
          Expanded(
            child: searchQuery.isEmpty
                ? const Center(child: Text('Digite algo para buscar.'))
                : ListView(
                    children: [
                      if (filteredUsers.isNotEmpty) ...[
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text('Estudantes',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                        ...filteredUsers.map((user) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(user.avatarUrl),
                              ),
                              title: Text(user.name),
                            )),
                      ],

                      if (filteredPosts.isNotEmpty) ...[
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text('Postagens',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                        ...filteredPosts.map((post) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: PostCard(post: post),
                            )),
                      ],
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
