import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/styles/shadow.dart';
import 'package:quick_shop_app/common/widgets/circular_icon.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_price_text.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_title_text.dart';
import 'package:quick_shop_app/common/widgets/rounded_container.dart';
import 'package:quick_shop_app/common/widgets/rounded_images.dart';
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
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [CustomShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(CustomSizes.productImageRadius),
          color: dark ? CustomColors.darkGrey : CustomColors.white,
        ),
        child: Column(
          children: [
            // Thumbnail, Wishlist and Discount Tag
            CustomRoundedContainer(
              height: 180,
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
            Padding(
              padding: const EdgeInsets.only(left: CustomSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  const CustomProductTitleText(
                    title: 'Nike Air Max 270',
                    smallSize: true,
                  ),
                  const SizedBox(height: CustomSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Text('Nike', overflow: TextOverflow.ellipsis, maxLines: 1, style: Theme.of(context).textTheme.labelMedium),
                      const SizedBox(width: CustomSizes.xs),
                      const Icon(Iconsax.verify5, color: CustomColors.primaryColor, size: CustomSizes.iconXs),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomProductPriceText(
                        price: '120.99',
                        isLarge: false,
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
            )
          ],
        ),
      
      ),
    );
  }
}

