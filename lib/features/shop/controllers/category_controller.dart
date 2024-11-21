import 'package:get/get.dart';
import 'package:quick_shop_app/data/repositories/categories/category_repository.dart';
import 'package:quick_shop_app/data/repositories/products/product_repository.dart';
import 'package:quick_shop_app/features/shop/models/category_model.dart';
import 'package:quick_shop_app/features/shop/models/product_model.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/popups/loaders.dart';

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();
  
  // Variables
  final _categoryRepository = Get.put(CategoryRepository());
  final isLoading = false.obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxList<CategoryModel> subCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
    // Load Category data
  }

  // Load Category data
  Future<void> fetchCategories() async {
    try {
      // Show loading
      isLoading.value = true;

      // Fetch Categories
      final catagories = await _categoryRepository.getAllCategories();
      
      // Update the Categories list
      categories.assignAll(catagories);

      // Filter featured categories
      featuredCategories.assignAll(categories.where((element) => element.isFeatured  && element.parentId.isEmpty).take(8).toList());
    } catch (e) {
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
    } finally {
      // Hide loading
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
    try {
      // Show loading
      isLoading.value = true;

      // Fetch Categories
      final products = await ProductRepository.instance.getProductsByCategory(categoryId: categoryId, limit: limit);
      
      return products;
    } catch (e) {
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
      return [];
    } finally {
      // Hide loading
      isLoading.value = false;
    }
  }

}