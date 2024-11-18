import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/features/shop/models/product_model.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class ImageController extends GetxController{
  static ImageController instance = Get.find();

  // Variables
  RxString selectedProductImage = ''.obs;

  // Get all images from product and product variations
  List<String> getAppProductImages(ProductModel product){
    final Set<String> images = {};
    
    // Load Product thumbnail image
    images.add(product.thumbnail);

    // Assign thumbnail image to selected product image
    selectedProductImage.value = product.thumbnail;

    // Load product images
    if (product.images != null){
      images.addAll(product.images!);
    }

    // Load product variations images
    if (product.productVariations != null || product.productVariations!.isNotEmpty){
      images.addAll(product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }

  // Show Image Popup
  void showImagePopup(String image){
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: CustomSizes.defaultSpace * 2, horizontal: CustomSizes.defaultSpace),
              child: CachedNetworkImage(imageUrl: image),
            ),
            const SizedBox(height: CustomSizes.spaceBtwSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(onPressed: () => Get.back(), child: const Text('Close')),
              ),
            )
          ],
        )
      )
    );
  }
}