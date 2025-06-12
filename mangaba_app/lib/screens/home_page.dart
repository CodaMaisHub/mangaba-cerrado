import 'package:flutter/material.dart';
import '../data/dummy_posts.dart';
import '../widgets/post_card.dart';
import 'map_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    const Center(child: Text('Buscar')),
    const HomeFeed(),
    const MapPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      floatingActionButton: _selectedIndex == 1
    ? FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/upload'),
        backgroundColor: Colors.white,
        elevation: 6,
        splashColor: Colors.purpleAccent.withOpacity(0.3), // efeito de toque
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.deepPurple, width: 2), // borda roxa
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(
          Icons.add_a_photo,
          color: Colors.pinkAccent, // ícone rosa escuro
          size: 28,
        ),
      )
          : null,
    );
  }
}

class HomeFeed extends StatelessWidget {
  const HomeFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Botão de Ranking
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/ranking');
              },
              icon: const Icon(
                Icons.emoji_events_rounded,
                color: Colors.amber, // ícone amarelo
              ),
              label: const Text('Ver Ranking'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // botão vermelho
                foregroundColor: Colors.white, // texto branco
                minimumSize: const Size(double.infinity, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
              ),
            ),
          ),
          // Lista de postagens
          Expanded(
            child: ListView.builder(
              itemCount: dummyPosts.length,
              itemBuilder: (ctx, index) {
                return PostCard(post: dummyPosts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
