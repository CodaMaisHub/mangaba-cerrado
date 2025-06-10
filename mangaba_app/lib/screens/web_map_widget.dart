// lib/screens/web_map_widget.dart

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../data/dummy_posts.dart';

class WebMapWidget extends StatelessWidget {
  const WebMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return FlutterMap(
          options: MapOptions(
            center: LatLng(-15.77972, -47.92972),
            zoom: 5.5,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
              userAgentPackageName: 'com.example.mangaba_app',
            ),
            MarkerLayer(
              markers: dummyPosts.map((post) {
                return Marker(
                  width: 40,
                  height: 40,
                  point: LatLng(post.latitude, post.longitude),
                  child: Tooltip(
                    message:
                        '${post.userName}\n📍 ${post.userLocation}\n❤️ ${post.likes}   💬 ${post.comments}',
                    child: const Icon(Icons.location_on, color: Colors.red),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
