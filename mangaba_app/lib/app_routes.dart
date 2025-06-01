// lib/app_routes.dart

import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/map_page.dart';
import 'screens/post_detail_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (ctx) => const HomePage(),
  '/map': (ctx) => const MapPage(),
  '/detail': (ctx) => const PostDetailPage(),
};
