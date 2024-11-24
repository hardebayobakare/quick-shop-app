import 'package:get/get.dart';
import 'package:quick_shop_app/features/shop/controllers/product/variation_controller.dart';
import 'package:quick_shop_app/features/shop/models/cart_item_model.dart';
import 'package:quick_shop_app/features/shop/models/product_model.dart';
import 'package:quick_shop_app/utils/constants/enums.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/local_storage/storage_utility.dart';
import 'package:quick_shop_app/utils/popups/loaders.dart';

class CartController extends GetxController{
  static CartController get instance => Get.find();

  // Variables
  RxInt cartItemCount = 0.obs;
  RxDouble cartTotalPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  CartController() {
    loadCartItems();
  }

  // Add to cart
  void addToCart(ProductModel product) {
    // Quantity Check
    if (productQuantityInCart.value < 1) {
      CustomLoaders.customToast(message: CustomTextStrings.selectQuatity);
    }

    if (product.productType == ProductType.variable.toString()) {
     if (variationController.selectedVariation.value.stock < 1) {
      CustomLoaders.warningSnackBar(title: CustomTextStrings.outOfStock, message: CustomTextStrings.variationOutOfStockMessage);
      return; 
      }
    } else {
      if (product.stock < 1) {
        CustomLoaders.warningSnackBar(title: CustomTextStrings.outOfStock, message: CustomTextStrings.outOfStockMessage);
        return;
      }
    }

    final selectedCartItem = convertProductToCartItem(product, productQuantityInCart.value);

    int index = cartItems.indexWhere((cartItem) => 
      cartItem.productId == selectedCartItem.productId
      && cartItem.variationId == selectedCartItem.variationId);
    
    if (index >= 0){
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();

    CustomLoaders.successSnackBar(title: CustomTextStrings.addedToCart);

  }

  void addOneToCart(CartItemModel cartItem) {
    int index = cartItems.indexWhere((item) => item.productId == cartItem.productId && item.variationId == cartItem.variationId);
    if (index >= 0) {
      cartItems[index].quantity += 1;
      updateCart();
    } else {
      cartItems.add(cartItem);
    }

    updateCart();
  }

  void removeOneFromCart(CartItemModel cartItem) {
    int index = cartItems.indexWhere((item) => item.productId == cartItem.productId && item.variationId == cartItem.variationId);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems[index].quantity == 1 ? removefromCartDialog(index) : cartItems.removeAt(index);
      }
    }
    updateCart();
  }

  void removefromCartDialog(int index) {
    Get.defaultDialog(
      title: CustomTextStrings.removeProduct,
      middleText: CustomTextStrings.removeProductMessage,
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        CustomLoaders.customToast(message: CustomTextStrings.removeFromCart);
        Get.back();
      },
    );
  }

  CartItemModel convertProductToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      variationController.resetSelectedAttribues();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variationController.selectedVariation.value.id.isNotEmpty;
    final price = isVariation 
      ? variation.salePrice > 0.0 
        ? variation.salePrice 
        : variation.price 
      : product.salePrice > 0.0 
        ? product.salePrice 
        : product.price;

    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: price,
      image: isVariation ? variation.image : product.thumbnail,
      quantity: quantity,
      variationId: variation.id,
      brandName: product.brand,
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }

  void updateCart() {
    updateCartTotal();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotal() {
    double calculatedTotalPrice = 0.0;
    int calculatedCartItemCount = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedCartItemCount += item.quantity;
    }

    cartTotalPrice.value = calculatedTotalPrice;
    cartItemCount.value = calculatedCartItemCount;

  }

  void saveCartItems() {
    final cartItemsJson = cartItems.map((item) => item.toJson()).toList();
    
    // Save to local storage
    CustomLocalStorage.instance().saveData(CustomTextStrings.cartItems, cartItemsJson);
  }

  void loadCartItems() {
    final cartItemsJson = CustomLocalStorage.instance().readData<List<dynamic>>(CustomTextStrings.cartItems);

    if (cartItemsJson != null) {
      cartItems.assignAll(cartItemsJson.map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotal();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems.where((item) =>item.productId == productId).fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final cartItem = cartItems.firstWhere((item) => item.productId == productId && item.variationId == variationId, orElse: () => CartItemModel.empty());
    return cartItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

  void updateAlreadyAddedProductCount(ProductModel product) {
    if (product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      final variation = variationController.selectedVariation.value.id;
      if (variation.isNotEmpty) {
        productQuantityInCart.value = getVariationQuantityInCart(product.id, variation);
      } else {
        productQuantityInCart.value = 0;
      }
      
    }
  }
}