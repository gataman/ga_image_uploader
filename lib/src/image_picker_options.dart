import 'package:flutter/material.dart';
import 'package:ga_image_uploader/src/components/camera_button.dart';
import 'package:ga_image_uploader/src/components/gallery_button.dart';
import 'package:ga_image_uploader/src/style/image_picker_options_style.dart';
import 'package:image_picker/image_picker.dart';

/// A widget that provides options for selecting and uploading images.

class ImagePickerOptions extends StatelessWidget {
  ///
  const ImagePickerOptions({
    required this.onTap,
    required this.imagePickerOptionsStyle,
    required this.isDialog,
    super.key,
  });

  /// [onTap] is a callback function that takes an [ImageSource] parameter,
  /// representing the selected image source.
  final void Function(ImageSource source) onTap;

  /// [imagePickerOptionsStyle] defines the visual
  /// style for the image picker options.
  final ImagePickerOptionsStyle imagePickerOptionsStyle;

  /// [isDialog] specifies whether the widget
  /// should be displayed as a dialog or a bottom sheet.
  final bool isDialog;

  @override
  Widget build(BuildContext context) {
    // Display the widget as a dialog or a
    // bottom sheet based on the value of [isDialog].
    return isDialog ? _buttonColumn() : _bottomSheetContent();
  }

  /// Builds the content for the bottom sheet.
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
                color: imagePickerOptionsStyle.dialogBackgroundColor ??
                    Colors.white,
              ),
            ),
          ),
          _buttonColumn(),
        ],
      ),
    );
  }

  /// Builds the column containing the gallery and camera buttons.
  Widget _buttonColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
      ],
    );
  }
}
