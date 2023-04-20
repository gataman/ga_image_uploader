import 'package:flutter/material.dart';
import 'package:ga_image_uploader/ga_image_uploader.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: HomeView(),
          ),
        ),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () async {
              final gaFile = await const GaImagePicker(
                cropEnabled: true,
              ).pickImage(context: context);

              if (gaFile != null) {
                final imageBytes = gaFile.bytes; // You can use bytes as dart:io doesn't work in web projects.
                final imageFile = gaFile.file;
              }
            },
            child: const Text('Upload Image'))
      ],
    );
  }
}
