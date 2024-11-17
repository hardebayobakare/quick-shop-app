import 'package:get/get.dart';
import 'package:quick_shop_app/data/repositories/banners/banner_repository.dart';
import 'package:quick_shop_app/data/repositories/categories/category_repository.dart';
import 'package:quick_shop_app/dummy_data.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/helpers/network_manager.dart';
import 'package:quick_shop_app/utils/popups/full_screen_loader.dart';
import 'package:quick_shop_app/utils/popups/loaders.dart';

class UploadDataController extends GetxController{
  static UploadDataController get instance => Get.find();
  
  // Variables
  final CategoryRepository _categoryRepository = Get.find();
  final BannerRepository _bannerRepository = Get.find();

  

  Future<void> uploadCategories() async {
    try {
      // Show loading
      CustomFullScreenLoader.openLoadingDialog(CustomTextStrings.uploadingData, CustomImages.dataProcess);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CustomFullScreenLoader.closeLoadingDialog();
        return;
      }

      // Validate Dummy data
      if (CustomDummyData.categories.isEmpty) {
        CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: CustomTextStrings.noContent);
        CustomFullScreenLoader.closeLoadingDialog();
        return;
      }

      // Upload Dummy Data
      await _categoryRepository.uploadDummyData(CustomDummyData.categories);

      // Close Loading
      CustomFullScreenLoader.closeLoadingDialog();

      // Show Success Message
      CustomLoaders.successSnackBar(title: CustomTextStrings.uploadSuccess, message: CustomTextStrings.uploadSuccessMessage);
    } catch (e) {
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
    }
  }

  Future<void> uploadBanners() async {
    try {
       // Show loading
      CustomFullScreenLoader.openLoadingDialog(CustomTextStrings.uploadingData, CustomImages.dataProcess);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CustomFullScreenLoader.closeLoadingDialog();
        return;
      }

      // Validate Dummy data
      if (CustomDummyData.banners.isEmpty) {
        CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: CustomTextStrings.noContent);
        CustomFullScreenLoader.closeLoadingDialog();
        return;
      }

      // Upload Dummy Data
      await _bannerRepository.uploadDummyData(CustomDummyData.banners);

      // Close Loading
      CustomFullScreenLoader.closeLoadingDialog();

      // Show Success Message
      CustomLoaders.successSnackBar(title: CustomTextStrings.uploadSuccess, message: CustomTextStrings.uploadSuccessMessage);
    } catch (e) {
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
    }
  }


}