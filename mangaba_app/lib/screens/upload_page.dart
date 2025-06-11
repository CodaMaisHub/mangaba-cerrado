import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mangaba_app/data/dummy_posts.dart';
import 'package:mangaba_app/models/post.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? _image;
  double? _latitude;
  double? _longitude;
  CameraController? _cameraController;
  bool _isLoading = false;
  String _description = '';
  final List<String> _selectedHashtags = [];
  final List<String> _availableHashtags = ['#Cerrado', '#Flora', '#Fauna', '#Educação'];
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _getCurrentLocation();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
        await _cameraController!.initialize();
        if (mounted) {
          setState(() {});
        }
      }
    } catch (e) {
      print('Erro ao inicializar a câmera: $e');
      if (mounted) {
        setState(() {});
      }
    }
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }
    if (permission == LocationPermission.deniedForever) return;

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    if (mounted) {
      setState(() {
        _latitude = position.latitude;
        _longitude = position.longitude;
      });
    }
  }

  Future<void> _takePicture() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Câmera não inicializada. Tente novamente.')),
      );
      return;
    }

    try {
      final XFile file = await _cameraController!.takePicture();
      setState(() {
        _image = File(file.path);
      });
    } catch (e) {
      print('Erro ao tirar foto: $e');
    }
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  void _postContent() {
    if (_image == null || _latitude == null || _longitude == null || _description.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos e capture uma imagem.')),
      );
      return;
    }

    setState(() => _isLoading = true);
    final newPost = Post(
      userName: 'João Pedro',
      userLocation: 'Brasília',
      imageUrl: _image!.path,
      likes: 0,
      comments: 0,
      isFavorited: false,
      date: DateTime.now(),
      text: _description,
      location: 'Localização GPS ($_latitude, $_longitude)',
      latitude: _latitude!,
      longitude: _longitude!,
      hashtags: List.from(_selectedHashtags),
    );
    dummyPosts.add(newPost);
    setState(() => _isLoading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Postagem adicionada com sucesso!')),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload de Conteúdo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _image == null
                  ? SizedBox(
                      height: 200,
                      child: _cameraController != null && _cameraController!.value.isInitialized
                          ? CameraPreview(_cameraController!)
                          : const Center(child: CircularProgressIndicator()),
                    )
                  : Image.file(_image!, height: 200, width: double.infinity, fit: BoxFit.cover),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _takePicture,
                    child: const Text('Capturar Foto'),
                  ),
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: const Text('Galeria'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text('Latitude: $_latitude, Longitude: $_longitude'),
              const SizedBox(height: 16),
              TextField(
                maxLength: 255,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Descrição (máx. 255 caracteres)',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => setState(() => _description = value),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8.0,
                children: _availableHashtags.map((tag) {
                  return FilterChip(
                    label: Text(tag),
                    selected: _selectedHashtags.contains(tag),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _selectedHashtags.add(tag);
                        } else {
                          _selectedHashtags.remove(tag);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _isLoading ? null : _postContent,
                child: _isLoading ? const CircularProgressIndicator() : const Text('Postar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}