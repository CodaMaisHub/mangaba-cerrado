// lib/screens/post_detail_page.dart

import 'package:flutter/material.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes da Postagem')),
      body: const Center(
        child: Text('Em breve: Detalhes completos da postagem'),
      ),
    );
  }
}