import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/data/services/firebase_storage_service.dart';
import 'package:quick_shop_app/features/shop/models/brand_model.dart';
import 'package:quick_shop_app/utils/exceptions/exceptions.dart';
import 'package:quick_shop_app/utils/exceptions/firebase_exceptions.dart';
import 'package:quick_shop_app/utils/exceptions/format_exceptions.dart';
import 'package:quick_shop_app/utils/exceptions/platform_exceptions.dart';
import 'package:path/path.dart' as path;

class BrandRepository extends GetxController{
  static BrandRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  // Get all brands
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final brands = await _db.collection('Brands').get();

      return brands.docs.map((brand) => BrandModel.fromJson(brand.data())).toList();
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

  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory').where('categoryId', isEqualTo: categoryId).get();

      List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();

      if (brandIds.isEmpty) return [];

      final brandQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();
      
      List<BrandModel> brands = brandQuery.docs.map((brand) => BrandModel.fromSnapshot(brand)).toList();

      return brands;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      print(e);
      throw CustomExceptions(e.toString());
    }
  }

  // Upload Category to Cloud Firestore
  Future<void> uploadDummyData(List<BrandModel> brands) async {
    try {
      // Upload all categories along with their images
      final storage = Get.put(CustomFirebaseStorageService());

      for (var brand in brands) {
        // Upload image
        final imageData = await storage.getImageDataFromAssets(brand.image);

        final imageName = path.basename(brand.image);

        final imageUrl = await storage.uploadImageData('Brands/Images', imageData, imageName);

        brand.image = imageUrl;

        // Upload category
        await _db.collection('Brands').doc(brand.id).set(brand.toJson());
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