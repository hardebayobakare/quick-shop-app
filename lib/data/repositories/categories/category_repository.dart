import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/data/services/firebase_storage_service.dart';
import 'package:quick_shop_app/features/shop/models/category_model.dart';
import 'package:quick_shop_app/utils/exceptions/exceptions.dart';
import 'package:quick_shop_app/utils/exceptions/firebase_exceptions.dart';
import 'package:quick_shop_app/utils/exceptions/format_exceptions.dart';
import 'package:quick_shop_app/utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController{
  static CategoryRepository get to => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  // Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      return snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw CustomExceptions(e.toString());
    }
  }


  // Get Sub Categories

  
  // Upload Category to Cloud Firestore
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // Upload all categories along with their images
      final storage = Get.put(CustomFirebaseStorageService());

      for (var category in categories) {
        // Upload image
        final imageData = await storage.getImageDataFromAssets(category.image);
        final imageUrl = await storage.uploadImageData('Categories', imageData, category.name);

        category.image = imageUrl;

        // Upload category
        await _db.collection('Categories').doc(category.id).set(category.toJson());
      }
      
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw CustomExceptions(e.toString());
    }
  }
}