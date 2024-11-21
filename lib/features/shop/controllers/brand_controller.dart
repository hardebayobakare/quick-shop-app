import 'package:get/get.dart';
import 'package:quick_shop_app/data/repositories/brand/brand_repository.dart';
import 'package:quick_shop_app/data/repositories/products/product_repository.dart';
import 'package:quick_shop_app/features/shop/models/brand_model.dart';
import 'package:quick_shop_app/features/shop/models/product_model.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/popups/loaders.dart';

class BrandController extends GetxController{
  static BrandController get instance => Get.find();

  RxBool isLoading = true.obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    super.onInit();
    // -- Load Brands
    getFeaturedBrands();
  }

  /// -- Load Brands
  Future<void> getFeaturedBrands() async {
    try {
      isLoading.value = true;
      
      final brands = await brandRepository.getAllBrands();

      allBrands.assignAll(brands);

      // -- Load Featured Brands
      featuredBrands.assignAll(allBrands.where((brand) => brand.isFeatured ?? false).take(4));

    } catch (e) {
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// -- Load Brands for Category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      final brands = await brandRepository.getBrandsForCategory(categoryId);
      return brands;
    } catch (e) {
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
      return [];
    } finally {
      isLoading.value = false;
    }
  }
  

  /// -- Get Brand Specific Products
  Future<List<ProductModel>> getBrandProducts({required String brandId, int limit = -1}) async {
    try {
      final products = await ProductRepository.instance.getBrandProductsForBrand(brandId: brandId , limit: limit);
      return products;
    } catch (e) {
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
      return [];
    } finally {
      isLoading.value = false;
    }
  }
  


}