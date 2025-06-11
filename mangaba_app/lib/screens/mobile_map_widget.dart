import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mangaba_app/data/dummy_posts.dart';
import 'package:mangaba_app/models/post.dart';

class MobileMapWidget extends StatelessWidget {
  const MobileMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Set<Marker> markers = dummyPosts.map((Post post) {
      return Marker(
        markerId: MarkerId(post.userName!),
        position: LatLng(post.latitude!, post.longitude!),
        infoWindow: InfoWindow(title: post.userName!),
      );
    }).toSet();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mapa das Postagens"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-15.793889, -47.882778), // Brasília como ponto inicial
          zoom: 10,
        ),
        markers: markers,
      ),
    );
  }
}
