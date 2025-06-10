import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../data/dummy_posts.dart';

class MobileMapWidget extends StatelessWidget {
  const MobileMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: LatLng(-15.77972, -47.92972),
        zoom: 5.5,
      ),
      markers: dummyPosts.map((post) {
        return Marker(
          markerId: MarkerId(post.userName),
          position: LatLng(post.latitude, post.longitude),
          infoWindow: InfoWindow(title: post.userName),
        );
      }).toSet(),
    );
  }
}
