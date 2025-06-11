import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../models/post.dart';
import '../data/dummy_posts.dart';

class WebMapWidget extends StatefulWidget {
  const WebMapWidget({super.key});

  @override
  State<WebMapWidget> createState() => _WebMapWidgetState();
}

class _WebMapWidgetState extends State<WebMapWidget> {
  String selectedUser = 'Todos';

  List<String> get userNames {
    final names = dummyPosts.map((post) => post.userName).toSet().toList();
    names.sort();
    return ['Todos', ...names];
  }

  List<Post> get filteredPosts {
    if (selectedUser == 'Todos') return dummyPosts;
    return dummyPosts.where((post) => post.userName == selectedUser).toList();
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final markers = filteredPosts.map((p) {
=======
<<<<<<< HEAD
    final markers = dummyPosts.map((post) {
      final p = post as Post;
>>>>>>> 6d9b87e4fe3a5bd1a9701e9b2ebe296ab0126e56
      return Marker(
        point: LatLng(p.latitude, p.longitude),
        width: 30,
        height: 30,
        child: Tooltip(
          message:
              '${p.userName}\n📍 ${p.userLocation}\n❤️ ${p.likes}   💬 ${p.comments}',
          child: const Icon(Icons.location_on, color: Colors.red, size: 30),
        ),
      );
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: DropdownButton<String>(
            value: selectedUser,
            items: userNames
                .map((name) => DropdownMenuItem(value: name, child: Text(name)))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedUser = value!;
              });
            },
          ),
        ),
        Expanded(
          child: FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(-15.7801, -47.9292), // Brasília
              initialZoom: 5,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: markers,
              ),
            ],
          ),
        ),
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
