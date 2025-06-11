// lib/screens/upload_page.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? _image;
  Position? _currentPosition;
  final ImagePicker _picker = ImagePicker();

  Future<void> _getCurrentLocation() async {
    final hasPermission = await Geolocator.checkPermission();
    if (hasPermission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }

    final pos = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = pos;
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      await _getCurrentLocation();
    }
  }

  void _postImage() {
    if (_image != null && _currentPosition != null) {
      // Aqui você pode salvar o post no dummy_posts.dart
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Post enviado com sucesso!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nova Postagem')),
      body: Column(
        children: [
          if (_image != null)
            Image.file(_image!, height: 200, width: double.infinity, fit: BoxFit.cover),
          if (_currentPosition != null)
            SizedBox(
              height: 200,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
                  zoom: 15,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId('local'),
                    position: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
                  ),
                },
              ),
            ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                icon: Icon(Icons.camera_alt),
                label: Text('Tirar Foto'),
                onPressed: () => _pickImage(ImageSource.camera),
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.photo_library),
                label: Text('Galeria'),
                onPressed: () => _pickImage(ImageSource.gallery),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            icon: Icon(Icons.send),
            label: Text('Postar com mapa'),
            onPressed: _postImage,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
