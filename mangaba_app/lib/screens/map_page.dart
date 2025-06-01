// lib/screens/map_page.dart

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../data/dummy_posts.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(-15.77972, -47.92972), // Exemplo: Brasília
          zoom: 5.5,
        ),
        markers: dummyPosts.map((post) {
          return Marker(
            markerId: MarkerId(post.userName),
            position: LatLng(-15.78 + dummyPosts.indexOf(post), -47.93),
            infoWindow: InfoWindow(title: post.userName),
          );
        }).toSet(),
      ),
    );
  }
}