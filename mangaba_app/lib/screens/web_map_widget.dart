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
  String? selectedCategory; // Null for all categories

  // Define categories and their icons/colors
  final Map<String, ({IconData icon, Color color})> categoryIcons = {
    'Flora': (icon: Icons.local_florist, color: Colors.green),
    'Fauna': (icon: Icons.pets, color: Colors.brown), // Changed from Icons.paw to Icons.pets
    'Animais': (icon: Icons.pets, color: Colors.orange), // Adjusted to use pets icon
    'Todos': (icon: Icons.map, color: Colors.blue), // Default for all
  };

  // Get unique categories from hashtags
  List<String> get categories {
    final allCategories = <String>{'Todos'}; // Start with 'Todos'
    for (var post in dummyPosts) {
      for (var hashtag in post.hashtags) {
        if (hashtag.contains('#Flora')) allCategories.add('Flora');
        if (hashtag.contains('#Fauna')) allCategories.add('Fauna');
        if (hashtag.contains('#Animais')) allCategories.add('Animais');
      }
    }
    return allCategories.toList();
  }

  // Filter posts based on selected category
  List<Post> get filteredPosts {
    if (selectedCategory == null || selectedCategory == 'Todos') return dummyPosts;
    return dummyPosts.where((post) {
      return post.hashtags.any((hashtag) =>
          hashtag.contains('#$selectedCategory') ||
          (selectedCategory == 'Animais' && hashtag.contains('#Fauna')));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row of category icons
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: categories.map((category) {
              final iconData = categoryIcons[category]?.icon ?? Icons.error;
              final color = categoryIcons[category]?.color ?? Colors.grey;
              return IconButton(
                icon: Icon(iconData, color: color, size: 30),
                onPressed: () {
                  setState(() {
                    selectedCategory = category == selectedCategory ? null : category;
                  });
                },
                isSelected: selectedCategory == category,
                selectedIcon: Icon(iconData, color: color.withOpacity(0.7), size: 30),
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: FlutterMap(
            options: MapOptions(
              initialCenter: const LatLng(-15.7801, -47.9292), // Brasília
              initialZoom: 5,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: filteredPosts.map((p) {
                  // Determine category and color for the marker
                  String? markerCategory;
                  if (p.hashtags.any((h) => h.contains('#Flora'))) markerCategory = 'Flora';
                  else if (p.hashtags.any((h) => h.contains('#Fauna') || h.contains('#Animais'))) markerCategory = 'Fauna';
                  else markerCategory = 'Todos';
                  final color = categoryIcons[markerCategory]?.color ?? Colors.grey;

                  return Marker(
                    point: LatLng(p.latitude, p.longitude),
                    width: 30,
                    height: 30,
                    child: Tooltip(
                      message:
                          '${p.userName}\n📍 ${p.location}\n❤️ ${p.likes}   💬 ${p.comments}',
                      child: Icon(Icons.location_on, color: color, size: 30),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}