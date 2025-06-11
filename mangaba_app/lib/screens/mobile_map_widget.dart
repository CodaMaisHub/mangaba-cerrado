import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mangaba_app/data/dummy_posts.dart';
import 'package:mangaba_app/models/post.dart';

class MobileMapWidget extends StatefulWidget {
  const MobileMapWidget({super.key});

  @override
  State<MobileMapWidget> createState() => _MobileMapWidgetState();
}

class _MobileMapWidgetState extends State<MobileMapWidget> {
  late GoogleMapController mapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _loadMarkers();
  }

  void _loadMarkers() {
    markers = dummyPosts.map((post) {
      return Marker(
        markerId: MarkerId((post as Post).userName),
        position: LatLng((post as Post).latitude, (post as Post).longitude),
        infoWindow: InfoWindow(title: (post as Post).userName),
        onTap: () {
          // Adicione lógica de clique se necessário
        },
      );
    }).toSet() as Set<Marker>; // Explicit cast to Set<Marker>
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: const CameraPosition(
        target: LatLng(-15.77972, -47.92972), // Brasília
        zoom: 10.0,
      ),
      markers: markers,
      mapType: MapType.normal,
      zoomControlsEnabled: true,
    );
  }
}