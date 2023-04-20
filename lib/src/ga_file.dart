import 'dart:io';
import 'dart:typed_data';

class GAFile {
  final File file;
  final Uint8List bytes;

  GAFile({required this.file, required this.bytes});

  @override
  String toString() => 'GAFile(file: $file, bytes: $bytes)';
}
