// lib/app_routes.dart
import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/map_page.dart';
import 'screens/upload_page.dart';
import 'screens/ranking_page.dart';
<<<<<<< HEAD
import 'screens/search_page.dart';

=======
<<<<<<< HEAD
=======
import 'screens/search_page.dart';

>>>>>>> 53c1804 (Pagina de perfil esclusiva do usuario)
>>>>>>> ae7df06 (Pagina de perfil esclusiva do usuario)


Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomePage(),
  '/map': (context) => const MapPage(),
  '/upload': (context) => const UploadPage(), // novo
  '/ranking': (context) => RankingPage(),
<<<<<<< HEAD
  '/search': (context) => const SearchPage(),
=======
<<<<<<< HEAD
=======
  '/search': (context) => const SearchPage(),
>>>>>>> 53c1804 (Pagina de perfil esclusiva do usuario)
>>>>>>> ae7df06 (Pagina de perfil esclusiva do usuario)
};
