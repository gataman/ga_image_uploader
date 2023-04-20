# GA Image Uploader

This package provides an easy way to select images from the device, crop them, and upload them to a remote server. It can be used in Android, iOS, and web projects.

This package uses the [image_picker](https://pub.dev/packages/image_picker) package to select images from the device, and the [image_cropper](https://pub.dev/packages/image_cropper) package to crop the images.

To use the package, add the following code to the `dependencies` section in your `pubspec.yaml` file:
```yaml
ga_image_uploader:
  git:
    url: https://github.com/gataman/ga_image_uploader
    ref: "39c2996"
```


## For IOS
For IOS platform, you should add the following lines to the ios/Runner/Info.plist file:

```xml
<key>NSPhotoLibraryUsageDescription</key>
<string>Need to upload image</string>
<key>NSCameraUsageDescription</key>
<string>Need to upload image</string>
```



## Android configuration
If you want to use the cropping feature, add the following lines to your
`android/app/src/main/AndroidManifest.xml` file:
```xml
<activity
   android:name="com.yalantis.ucrop.UCropActivity"
   android:screenOrientation="portrait"  
   android:theme="@style/Theme.AppCompat.Light.NoActionBar"/>
```

## Web configuration
If you want to use the cropping feature, add the following lines to the `<head>` tag in your `web/index.html` file:

```html
<head>
...
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.css" />
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/exif-js/2.3.0/exif.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/croppie/2.6.5/croppie.min.js"></script>
...
</head>
```

## Usage
Here's an example usage of the package:

```dart
final imagePickerOptionsStyle = ImagePickerOptionsStyle(
  dialogBackgroundColor: context.onPrimary,
  galleryButtonTextStyle: context.titleMedium?.copyWith(color: context.onPrimary),
  cameraButtonTextStyle: context.titleMedium?.copyWith(color: context.onPrimary),
  galleryButtonLabel: 'Galeriden Seç',
  cameraButtonLabel: 'Kamera ile Çek',
);

final imageFile = await GaImagePicker(imagePickerOptionsStyle: imagePickerOptionsStyle).pickImage(context: context);
```

This will open the image picker dialog with the specified options and return a *\`File\`* object of the selected image. If the cropping feature is enabled, the user will be able to crop the image before it's returned.

## Contributions
Contributions are welcome. If you find any issues or have suggestions for improvement, please open an issue or pull request.

## License
This package is released under the MIT License. See the [LICENSE](https://github.com/gataman/ga_image_uploader/blob/main/LICENSE) file for details.

## Note
This project is a work in progress and still under development.

