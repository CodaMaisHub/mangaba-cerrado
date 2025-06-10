// lib/screens/map_page.dart

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'mobile_map_widget.dart';
import 'web_map_widget.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: kIsWeb ? const WebMapWidget() : const MobileMapWidget(),
    );
  }
}
