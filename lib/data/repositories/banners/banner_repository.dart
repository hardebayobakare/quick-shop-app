import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:quick_shop_app/data/services/firebase_storage_service.dart';
import 'package:quick_shop_app/features/shop/models/banner_model.dart';
import 'package:quick_shop_app/utils/exceptions/exceptions.dart';
import 'package:quick_shop_app/utils/exceptions/firebase_exceptions.dart';
import 'package:quick_shop_app/utils/exceptions/format_exceptions.dart';
import 'package:quick_shop_app/utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController{
  static BannerRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> getActiveBanners() async {
    try {
      final snapshot = await _db.collection('Banners').where('IsActive', isEqualTo: true).get();
      return snapshot.docs.map((doc) => BannerModel.fromSnapshot(doc)).toList();
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

  // Upload Category to Cloud Firestore
  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      // Upload all categories along with their images
      final storage = Get.put(CustomFirebaseStorageService());

      for (var banner in banners) {
        // Upload image
        final imageData = await storage.getImageDataFromAssets(banner.image);

        final bannerImageName = path.basename(banner.image);

        final imageUrl = await storage.uploadImageData('Banners/Images', imageData, bannerImageName);

        banner.image = imageUrl;

        // Upload category
        await _db.collection('Banners').doc(banner.id).set(banner.toJson());
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