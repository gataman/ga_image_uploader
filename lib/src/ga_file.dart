import 'dart:io';
import 'dart:typed_data';

/// This GAFile is helper for image picker
class GAFile {
  ///
  GAFile({
    required this.file,
    required this.bytes,
  });

  /// File type
  final File file;

  /// Byte type
  final Uint8List bytes;

  @override
  String toString() => 'GAFile(file: $file, bytes: $bytes)';
}
