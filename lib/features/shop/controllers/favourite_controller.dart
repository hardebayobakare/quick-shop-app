import 'dart:convert';

import 'package:get/get.dart';
import 'package:quick_shop_app/data/repositories/products/product_repository.dart';
import 'package:quick_shop_app/features/shop/models/product_model.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/local_storage/storage_utility.dart';
import 'package:quick_shop_app/utils/popups/loaders.dart';

class FavouriteController extends GetxController{
  static FavouriteController get instance => Get.find();

  // Variables
  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  void initFavourites() async {
    final json = CustomLocalStorage.instance().readData('favourites');

    if(json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }

  void toggleFavourite(String productId) {
    if(!favourites.containsKey(productId)) {
      favourites[productId] = true;
      saveFavouriteToStorage();
      CustomLoaders.customToast(message: CustomTextStrings.addToWishlist);
    } else {
      CustomLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavouriteToStorage();
      favourites.refresh();
      CustomLoaders.customToast(message: CustomTextStrings.removeFromWishlist);
    }
  }

  void saveFavouriteToStorage() {
    final encodedFavourites = jsonEncode(favourites);
    CustomLocalStorage.instance().saveData('favourites', encodedFavourites);
  }

  Future<List<ProductModel>> getFavouriteProducts() async {
    try{
       return await ProductRepository.instance.getFavoriteProducts(favourites.keys.toList());
    } catch(e) {
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
      return [];
    }
   
  }
}