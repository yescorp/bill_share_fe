abstract class ImageConverter {
  Future<String> converToBase64(String filePath);
  Future<String> convertToBase64FromAssets(String assetPath);
}
