// lib/main.dart

import 'package:flutter/material.dart';
import 'app_routes.dart';

void main() {
  runApp(const MangabaApp());
}

class MangabaApp extends StatelessWidget {
  const MangabaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mangaba',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFDF5FF),
        fontFamily: 'Arial',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
      ),
      routes: appRoutes,
      initialRoute: '/',
    );
  }
}
