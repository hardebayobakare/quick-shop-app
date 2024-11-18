import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/styles/curved_edges_widget.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/common/widgets/circular_icon.dart';
import 'package:quick_shop_app/common/widgets/rounded_images.dart';
import 'package:quick_shop_app/features/shop/controllers/product/image_conntroller.dart';
import 'package:quick_shop_app/features/shop/models/product_model.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomProductImageSlider extends StatelessWidget {
  const CustomProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;
  
  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);

    final controller = Get.put(ImageController());
    final images = controller.getAppProductImages(product);

    return CustomCurvedEdgesWidget(
      child: Container(
        color: dark ? CustomColors.darkGrey : CustomColors.light,
        child: Stack(
          children: [
            // Product Image
            SizedBox(
              height: 400, 
              child: Padding(
                padding: const EdgeInsets.all(CustomSizes.productImageRadius * 2),
                child: Center(child: Obx(() {
                  final image = controller.selectedProductImage.value;
                  return GestureDetector(
                    onTap: () => controller.showImagePopup(image),
                    child: CachedNetworkImage(
                      imageUrl: image, 
                      progressIndicatorBuilder: (_, __, downloadProgress) =>
                        CircularProgressIndicator(value: downloadProgress.progress, color: CustomColors.primaryColor),
                      ),
                  );
                })),
              )
            ),
            // Product Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: CustomSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: images.length,
                  separatorBuilder: (_, __) => const SizedBox(width: CustomSizes.spaceBtwItems),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => Obx(() {
                    final imageSelected = controller.selectedProductImage.value == images[index]; 
                    return CustomRoundedImage(
                      width: 80,
                      backgroundColor: dark ? CustomColors.dark : CustomColors.white,
                      border: Border.all(color: imageSelected ? CustomColors.primaryColor : Colors.transparent),
                      padding: const EdgeInsets.all(CustomSizes.sm),
                      imageUrl: images[index],
                      isNetworkImage: true,
                      onTap: () => controller.selectedProductImage.value = images[index],
                    );},
                  ),
                ),
              ),
            ),
    
            // Appbar Icons
            const CustomAppBar(
              showBackArrow: true,
              actions: [
                CustomCircularIcon(icon: Iconsax.heart5, color: Colors.red,),
              ],
            )
    
          ],
        ),
      ),
    );
  }
}