import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'image_picker_options.dart';
import 'style/image_picker_options_style.dart';

/// A widget that allows the user to select an image from the device's gallery or camera.
///
/// If [cropEnabled] is set to `true`, users will be able to crop the selected image
/// before returning it to the application.
///
/// Note: In order to use the cropping feature on Android and Web platforms, users must add the following
/// code to their AndroidManifest.xml file or web/index.html file respectively:
///
/// For Android: android/app/src/main/AndroidManifest.xml
/// <activity
///     android:name="com.yalantis.ucrop.UCropActivity"
///     android:screenOrientation="portrait"
///     android:theme="@style/Theme.AppCompat.Light.NoActionBar"/>
///
/// For Web: web/index.html inside <head> tag
/// <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.css" />
/// <script defer src="https://cdnjs.cloudflare.com/ajax/libs/exif-js/2.3.0/exif.js"></script>
/// <script src="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.min.js"></script>
///

class GaImagePicker {
  const GaImagePicker({
    // If you want to enable cropping feature, set cropEnabled to true.
    // By default, it is set to false.
    this.cropEnabled = false,
    // Set the picker style to either a bottom sheet or a dialog
    this.pickerStyle = GaImagePickerType.bottomSheet,

    // Set the style to dialog or bottom sheet style
    this.imagePickerOptionsStyle,
  });

  final bool cropEnabled;

  final GaImagePickerType pickerStyle;

  final ImagePickerOptionsStyle? imagePickerOptionsStyle;

  Future<File?> pickImage({required BuildContext context}) async {
    if (pickerStyle == GaImagePickerType.bottomSheet) {
      return await _showModalBottomSheet(context);
    } else {
      return await _showDialog(context);
    }
  }

  Future<File?> _showModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: imagePickerOptionsStyle?.dialogBackgroundColor ?? Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: ImagePickerOptions(
                imagePickerOptionsStyle: imagePickerOptionsStyle ?? ImagePickerOptionsStyle(),
                onTap: (source) async {
                  final res = await _uploadImage(source, context);
                  if (context.mounted) {
                    Navigator.pop(context, res);
                  }
                },
                isDialog: false,
              ),
            );
          }),
    );
  }

  Future<File?> _showDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          decoration: BoxDecoration(
            color: imagePickerOptionsStyle?.dialogBackgroundColor ?? Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          //height: 200,
          child: ImagePickerOptions(
            onTap: (source) async {
              final res = await _uploadImage(source, context);
              if (context.mounted) {
                Navigator.pop(context, res);
              }
            },
            isDialog: true,
            imagePickerOptionsStyle: imagePickerOptionsStyle ?? ImagePickerOptionsStyle(),
          ),
        ),
      ),
    );
  }

  Future<File?> _uploadImage(ImageSource source, BuildContext context) async {
    final image = await ImagePicker().pickImage(source: source);

    if (image == null) return null;

    File? img = File(image.path);

    if (cropEnabled && context.mounted) {
      img = await _cropImage(img, context);
    }

    return img;
  }

  Future<File?> _cropImage(File imageFile, BuildContext context) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      cropStyle: CropStyle.circle,
      uiSettings: [
        IOSUiSettings(resetAspectRatioEnabled: true),
        WebUiSettings(
          context: context,
          enableZoom: true,
          presentStyle: CropperPresentStyle.page,
          enableResize: true,
        )
      ],
    );
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }
}

enum GaImagePickerType { dialog, bottomSheet }
