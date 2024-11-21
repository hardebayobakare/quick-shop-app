import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:quick_shop_app/data/services/firebase_storage_service.dart';
import 'package:quick_shop_app/features/shop/models/product_model.dart';
import 'package:quick_shop_app/utils/constants/enums.dart';
import 'package:quick_shop_app/utils/exceptions/exceptions.dart';
import 'package:quick_shop_app/utils/exceptions/firebase_exceptions.dart';
import 'package:quick_shop_app/utils/exceptions/format_exceptions.dart';
import 'package:quick_shop_app/utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController{
  static ProductRepository get instance => Get.find();
  
    // Variables
  final _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).limit(4).get();
      return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
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

  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).get();
      return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
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

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;
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

  Future<List<ProductModel>> getBrandProductsForBrand({required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1 
        ? await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).get() 
        : await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).limit(limit).get();
      return querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
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

  Future<List<ProductModel>> getProductsByCategory({required String categoryId, int limit = -1}) async {
    try {
      final productCategoryQuery = limit == -1 
        ? await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).get() 
        : await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).limit(limit).get();

      List<String> productIds = productCategoryQuery.docs.map((doc) => doc['productId'] as String).toList();

      if (productIds.isEmpty) return [];

      final productQuery = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();

      List<ProductModel> products = productQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();

      return products;
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

  Future<List<ProductModel>> getFavoriteProducts(List<String> productId) async {
    try {
      if (productId.isEmpty) return [];
      final snapshot = await _db.collection('Products').where(FieldPath.documentId, whereIn: productId).get();
      return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
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

  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      final storage = Get.put(CustomFirebaseStorageService());

      for (var product in products) {
        final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);

        final imageName = path.basename(product.thumbnail);

        final url = await storage.uploadImageData('Products/Images', thumbnail, imageName);

        product.thumbnail = url;

        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imageUrls = [];
          for (var image in product.images!) {
            final assetImage = await storage.getImageDataFromAssets(image);

            final imageName = path.basename(image);

            final imageUrl = await storage.uploadImageData('Products/Images', assetImage, imageName);

            imageUrls.add(imageUrl);
          }
          product.images!.clear();
          product.images!.addAll(imageUrls);
        }

        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            final assetImage = await storage.getImageDataFromAssets(variation.image);

            final variatinImageName = path.basename(variation.image);

            final url = await storage.uploadImageData('Products/Images', assetImage, variatinImageName);

            variation.image = url;
          }
        }

        // upload brand image
        if (product.brand != null) {
          final assetImage = await storage.getImageDataFromAssets(product.brand!.image);

          final brandImageName = path.basename(product.brand!.image);

          final url = await storage.uploadImageData('Brands/Images', assetImage, brandImageName);

          product.brand!.image = url;
        }

        await _db.collection('Products').doc(product.id).set(product.toJson());
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