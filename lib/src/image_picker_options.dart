import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'components/camera_button.dart';
import 'components/gallery_button.dart';
import 'style/image_picker_options_style.dart';

class ImagePickerOptions extends StatelessWidget {
  const ImagePickerOptions({
    Key? key,
    required this.onTap,
    required this.imagePickerOptionsStyle,
    required this.isDialog,
  }) : super(key: key);

  final Function(ImageSource source) onTap;
  final ImagePickerOptionsStyle imagePickerOptionsStyle;
  final bool isDialog;

  @override
  Widget build(BuildContext context) {
    return isDialog ? _buttonColumn() : _bottomSheetContent();
  }

  Widget _bottomSheetContent() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -35,
            child: Container(
              width: 50,
              height: 6,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5),
                color: imagePickerOptionsStyle.dialogBackgroundColor ?? Colors.white,
              ),
            ),
          ),
          _buttonColumn()
        ],
      ),
    );
  }

  Widget _buttonColumn() {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      GalleryButton(
        onTap: () => onTap(ImageSource.gallery),
        style: imagePickerOptionsStyle,
      ),
      const SizedBox(
        height: 16,
      ),
      CameraButton(
        onTap: () => onTap(ImageSource.camera),
        style: imagePickerOptionsStyle,
      ),
    ]);
  }
}
