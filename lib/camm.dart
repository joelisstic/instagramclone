import 'dart:io';
import 'package:clonetaskinstagram/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Camm extends StatefulWidget {
  const Camm({super.key});

  @override
  State<Camm> createState() => _CammState();
}

class _CammState extends State<Camm> {
  String? _selectedImage; // Store the path of the selected image (either asset or file)

  final ImagePicker _picker = ImagePicker();

  // Function to open the camera and capture an image
  Future<void> _openCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        _selectedImage = photo.path; // Store the captured photo's file path
      });
    }
  }

  // Function to preview the selected asset image
  void _previewImage(String assetPath) {
    setState(() {
      _selectedImage = assetPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Dashboard()),
                  (Route<dynamic> route) => false,
            );
          },
        ),
        title: const Text(
          'New Post',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (_selectedImage != null) {
                // Handle next action, like submitting the image
                print('Image selected: $_selectedImage');
              }
            },
            child: const Text(
              'Next',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Preview Section
          Container(
            color: Colors.grey[900],
            height: 300,
            width: double.infinity,
            child: _selectedImage == null
                ? const Center(
              child: Icon(
                Icons.image,
                color: Colors.grey,
                size: 100,
              ),
            )
                : (_selectedImage!.startsWith('assets/')
                ? Image.asset(
              _selectedImage!,
              fit: BoxFit.cover,
            )
                : Image.file(
              File(_selectedImage!),
              fit: BoxFit.cover,
            )),
          ),
          // Media Selection Options
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: "Recents",
                  dropdownColor: Colors.black,
                  underline: const SizedBox(),
                  style: const TextStyle(color: Colors.white),
                  items: const [
                    DropdownMenuItem(value: "Recents", child: Text("Recents")),
                    DropdownMenuItem(value: "Favorites", child: Text("Favorites")),
                  ],
                  onChanged: (value) {},
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.select_all, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: _openCamera,
                      icon: const Icon(Icons.camera_alt, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(color: Colors.grey),
          // Media Grid
          Expanded(
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemBuilder: (context, index) {
                final String assetPath = 'assets/images/pic${index + 1}.jpg';
                return GestureDetector(
                  onTap: () => _previewImage(assetPath),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      image: DecorationImage(
                        image: AssetImage(assetPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Tabs for Post, Story, Reel, Live
          Container(
            color: Colors.black,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _TabItem(title: 'POST', isSelected: true),
                _TabItem(title: 'STORY', isSelected: false),
                _TabItem(title: 'REEL', isSelected: false),
                _TabItem(title: 'LIVE', isSelected: false),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final bool isSelected;

  const _TabItem({required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        if (isSelected)
          const Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: CircleAvatar(radius: 2, backgroundColor: Colors.white),
          ),
      ],
    );
  }
}
