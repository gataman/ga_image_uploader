import 'package:flutter/material.dart';
import '../style/image_picker_options_style.dart';

class CameraButton extends StatelessWidget {
  const CameraButton({super.key, this.onTap, required this.style});

  final void Function()? onTap;

  final ImagePickerOptionsStyle style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: style.galleryButtonStyle,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            style.cameraButtonIcon ??
                Icon(
                  Icons.camera_alt_outlined,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
            const SizedBox(
              width: 16,
            ),
            Text(style.cameraButtonLabel ?? 'Use a Camera',
                style: style.cameraButtonTextStyle ?? Theme.of(context).textTheme.titleMedium)
          ],
        ),
      ),
    );
  }
}
