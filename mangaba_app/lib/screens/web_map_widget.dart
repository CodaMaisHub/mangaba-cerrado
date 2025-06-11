import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mangaba_app/data/dummy_posts.dart';
import 'package:mangaba_app/models/post.dart';

class WebMapWidget extends StatelessWidget {
  const WebMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mapa das Postagens"),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(-15.793889, -47.882778), // Brasília
          initialZoom: 10.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: dummyPosts.map((Post post) {
              return Marker(
                point: LatLng(post.latitude!, post.longitude!),
                width: 200,
                height: 80,
                child: Tooltip(
                  message:
                      '${post.userName!}\n📍 ${post.userLocation!}\n❤️ ${post.likes}   💬 ${post.comments}',
                  child: const Icon(Icons.location_on, color: Colors.red, size: 40),
                ),
              );
            }).toList().cast<Marker>(), // <- força tipo correto
          ),
        ],
      ),
    );
  }
}
