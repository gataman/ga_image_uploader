import 'package:flutter/material.dart';

class ImagePickerOptionsStyle {
  ImagePickerOptionsStyle({
    this.dialogBackgroundColor,
    this.galleryButtonVisible = true,
    this.cameraButtonVisible = true,
    this.galleryButtonLabel,
    this.cameraButtonLabel,
    this.galleryButtonTextStyle,
    this.cameraButtonTextStyle,
    this.galleryButtonIcon,
    this.cameraButtonIcon,
    this.galleryButtonStyle,
    this.cameraButtonStyle,
  });

  /// Determines whether the gallery button is visible.
  final bool galleryButtonVisible;

  /// Determines whether the camera button is visible.
  final bool cameraButtonVisible;

  final String? galleryButtonLabel;
  final String? cameraButtonLabel;

  final TextStyle? galleryButtonTextStyle;
  final TextStyle? cameraButtonTextStyle;

  final Widget? galleryButtonIcon;
  final Widget? cameraButtonIcon;

  final ButtonStyle? galleryButtonStyle;
  final ButtonStyle? cameraButtonStyle;

  final Color? dialogBackgroundColor;
}
