import 'package:get/get.dart';
import 'package:quick_shop_app/data/repositories/products/product_repository.dart';
import 'package:quick_shop_app/features/shop/models/product_model.dart';
import 'package:quick_shop_app/utils/constants/enums.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/popups/loaders.dart';

class ProductController extends GetxController{
  static ProductController get instace => Get.find();

  // Variables
  final isLoading = false.obs;
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final _productRepository = Get.put(ProductRepository());


  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }
  
  void fetchFeaturedProducts() async{
    try {
      // Show loading
      isLoading.value = true;

      // Fetch featured products
      final products = await _productRepository.getFeaturedProducts();

      print("Products ${products.length}");

      // Update featured products
      featuredProducts.assignAll(products);

    } catch (e) {
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
    } finally {
      // Hide loading
      isLoading.value = false;
    }
  }

  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0;

    // If no variations
    if(product.productType == ProductType.single.toString()){
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    } else {
      // If there is variations
      for (var variation in product.productVariations!) {
        double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;
        if(priceToConsider < smallestPrice){
          smallestPrice = priceToConsider;
        }
        if(priceToConsider > largestPrice){
          largestPrice = priceToConsider;
        }
      }

      if (smallestPrice.isEqual(largestPrice)){
        return smallestPrice.toString();
      } else {
        return '\$$smallestPrice - \$$largestPrice';
      }
    }
  }

  String? getProductDiscount(double price, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (price <= 0.0) return null;

    double discount = ((price - salePrice) / price) * 100;
    return discount.toStringAsFixed(0);
  }

  String getStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}