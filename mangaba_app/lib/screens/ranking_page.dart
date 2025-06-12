import 'package:flutter/material.dart';

class RankingPage extends StatelessWidget {
  final List<Map<String, dynamic>> rankingData = [
    {
      'name': 'Aline Silva',
      'points': 1200,
      'avatarUrl': 'https://randomuser.me/api/portraits/women/1.jpg',
    },
    {
      'name': 'Bruno Santos',
      'points': 980,
      'avatarUrl': 'https://randomuser.me/api/portraits/men/2.jpg',
    },
    {
      'name': 'Camila Rocha',
      'points': 870,
      'avatarUrl': 'https://randomuser.me/api/portraits/women/3.jpg',
    },
    {
      'name': 'Diego Nunes',
      'points': 850,
      'avatarUrl': 'https://randomuser.me/api/portraits/men/4.jpg',
    },
    {
      'name': 'Elaine Costa',
      'points': 800,
      'avatarUrl': 'https://randomuser.me/api/portraits/women/5.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ranking'),
        backgroundColor: Colors.red[100],
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: rankingData.length,
        itemBuilder: (context, index) {
          final user = rankingData[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user['avatarUrl']),
              radius: 24,
            ),
            title: Text(
              user['name'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${user['points']} pontos'),
            trailing: Text(
              '#${index + 1}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
