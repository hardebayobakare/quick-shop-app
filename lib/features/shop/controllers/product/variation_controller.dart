import 'package:get/get.dart';
import 'package:quick_shop_app/features/shop/controllers/product/image_conntroller.dart';
import 'package:quick_shop_app/features/shop/models/product_model.dart';
import 'package:quick_shop_app/features/shop/models/product_variation_model.dart';

class VariationController extends GetxController{
  static VariationController get instance => Get.find();

  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;


  void onAttributeSelected(ProductModel product, attributeName, attributeValue) {
    final selectedAttributes = Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
      (variation) => _isSameAttributeValues(variation.attributeValues, selectedAttributes), 
      orElse: () => ProductVariationModel.empty());

    // Show selected variation image as main image
    if (selectedVariation.image.isNotEmpty) {
      ImageController.instance.selectedProductImage.value = selectedVariation.image;
    }

    // Assign selected variation
    this.selectedVariation.value = selectedVariation;
  }

  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes, Map<String, dynamic> selectedAttributes) {
    if (variationAttributes.length != selectedAttributes.length) return false;

    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  Set<String?> getAttributesAvailabilityInVariation(List<ProductVariationModel> variations, String attributeName, Map<String, dynamic> selectedAttributes) {
    final filteredVariations = variations
          .where((variation)  {
            return selectedAttributes.entries.every((entry) {
              // Ignore matching for the current attributeName
              if (entry.key == attributeName) return true;
              return variation.attributeValues[entry.key] == entry.value;
            });
          });
    
    final availableVariationAttributeValues = filteredVariations
          .where((variation) => 
            variation.attributeValues[attributeName] != null && variation.stock > 0)
          .map((variation) => variation.attributeValues[attributeName])
          .toSet(); 
    return availableVariationAttributeValues;
  }

  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price).toString();
  }



  void getProductVariationStockStatus() {
    variationStockStatus.value = selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  void resetSelectedAttribues () {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}