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
              final result = await const GaImagePicker(
                cropEnabled: true,
                pickerStyle: GaImagePickerType.bottomSheet,
              ).pickImage(context: context);
              debugPrint(result?.file.path);
              debugPrint(result?.bytes.toString());
            },
            child: const Text('Upload Image'))
      ],
    );
  }
}
