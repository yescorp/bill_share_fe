import 'dart:convert';
import 'dart:io';

import 'package:bill_share/services/image_converter/api/image_converter.dart';
import 'package:flutter/services.dart';

class ImageConverterImpl extends ImageConverter {
  @override
  Future<String> converToBase64(String filePath) async {
    final bytes = await File(filePath).readAsBytes();
    return base64Encode(bytes);
  }

  @override
  Future<String> convertToBase64FromAssets(String assetPath) async {
    final byteData = await rootBundle.load(assetPath);
    return base64Encode(byteData.buffer.asUint8List());
  }
}
