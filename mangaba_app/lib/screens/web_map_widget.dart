import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mangaba_app/data/dummy_posts.dart';
import 'package:mangaba_app/models/post.dart';

class WebMapWidget extends StatelessWidget {
  const WebMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final markers = dummyPosts.map((post) {
      final p = post as Post;
      return Marker(
        point: LatLng(p.latitude, p.longitude),
        child: Tooltip(
          message:
              '${p.userName}\n📍 ${p.userLocation}\n❤️ ${p.likes}   💬 ${p.comments}',
          child: Icon(Icons.location_on, color: Colors.red, size: 30),
        ),
        width: 30,
        height: 30,
        rotate: true,
      );
    }).toList();

    return FlutterMap(
      options: MapOptions(
        center: const LatLng(-15.77972, -47.92972), // Brasília
        zoom: 10.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: const ['a', 'b', 'c'],
        ),
        MarkerLayer(markers: markers),
      ],
=======
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
>>>>>>> 19e6728b10a41a1dd9c23e3e8b94b83ba495dee8
    );
  }
}
