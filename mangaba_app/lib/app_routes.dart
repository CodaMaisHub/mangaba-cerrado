// lib/app_routes.dart
import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/map_page.dart';
import 'screens/upload_page.dart';
import 'screens/ranking_page.dart';


Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomePage(),
  '/map': (context) => const MapPage(),
  '/upload': (context) => const UploadPage(), // novo
  '/ranking': (context) => RankingPage(),
};
