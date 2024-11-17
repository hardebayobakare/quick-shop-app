import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomFirebaseStorageService extends GetxController{
  static CustomFirebaseStorageService get to => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  

  /// Upload local Assets from IDE
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      throw 'Error loading image data: $e';
    }
  }

  /// Upload image using imagedata on Cloud Firbase Storage
  /// Returns the download URL of the image
  Future<String> uploadImageData(String path, Uint8List imageData, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(imageData);
      return await ref.getDownloadURL();
    } on FirebaseException catch (e) {
      throw 'Firebase Error: ${e.code}';
    } on PlatformException catch (e) {
      throw 'Platform Error: ${e.code}';
    } catch (e) {
      throw 'Error: $e';
    }
  }
}