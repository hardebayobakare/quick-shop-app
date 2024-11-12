import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/styles/shadow.dart';
import 'package:quick_shop_app/common/widgets/brand_container.dart';
import 'package:quick_shop_app/common/widgets/circular_icon.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_price_text.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_title_text.dart';
import 'package:quick_shop_app/common/widgets/rounded_container.dart';
import 'package:quick_shop_app/common/widgets/rounded_images.dart';
import 'package:quick_shop_app/features/shop/screens/product_detail/product_detail.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomProductCardVertical extends StatelessWidget {
  const CustomProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [CustomShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(CustomSizes.productImageRadius),
          color: dark ? CustomColors.darkGrey : CustomColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail, Wishlist and Discount Tag
            CustomRoundedContainer(
              height: 180,
              width: double.infinity,
              padding: const EdgeInsets.all(CustomSizes.sm),
              backgroundColor: dark ? CustomColors.dark : CustomColors.light,
              child: Stack(
                children: [
                  // Thumbnail
                  const CustomRoundedImage(
                    imageUrl: CustomImages.productImage1,
                    applyImageRadius: true,
                  ),
      
                  // Discount Tag
                  Positioned(
                    top: 12,
                    child: CustomRoundedContainer(
                      radius: CustomSizes.sm,
                      backgroundColor: CustomColors.secondaryColor.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: CustomSizes.sm, vertical: CustomSizes.xs),
                      child: Text(
                        '20%',
                        style: Theme.of(context).textTheme.labelLarge!.apply(color: CustomColors.black),
                      ),
                    
                    ),
                  ),
      
                  // Favourite Icon
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: CustomCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: CustomSizes.spaceBtwItems / 2),
            
      
            // Product Details
            const Padding(
              padding: EdgeInsets.only(left: CustomSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  CustomProductTitleText(
                    title: 'Nike Air Max 270',
                    smallSize: true,
                  ),
                  SizedBox(height: CustomSizes.spaceBtwItems / 2),
                  CustomBrandTitleTextWithVerification(brandName: "Nike", isVerified: true)
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: CustomSizes.sm),
                  child: CustomProductPriceText(
                    price: '120.99',
                  ),
                ),
                Container (
                  decoration: const BoxDecoration(
                    color: CustomColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(CustomSizes.cardRadiusMd),
                      bottomRight: Radius.circular(CustomSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: CustomSizes.iconLg * 1.2,
                    height: CustomSizes.iconLg * 1.2,
                    child: Center(child: Icon(Iconsax.add, color: CustomColors.white))),
                )

              ],
            )
          ],
        ),
      
      ),
    );
  }
}

