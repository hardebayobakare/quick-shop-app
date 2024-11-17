import 'package:get/get.dart';
import 'package:quick_shop_app/data/repositories/categories/category_repository.dart';
import 'package:quick_shop_app/dummy_data.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/popups/loaders.dart';

class UploadDataController extends GetxController{
  static UploadDataController get instance => Get.find();
  
  // Variables
  final CategoryRepository _categoryRepository = Get.find();

  Future<void> uploadCategories() async {
    try {
      await _categoryRepository.uploadDummyData(CustomDummyData.categories);
      CustomLoaders.successSnackBar(title: CustomTextStrings.uploadSuccess, message: CustomTextStrings.uploadSuccessMessage);
    } catch (e) {
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
    }
  }


}