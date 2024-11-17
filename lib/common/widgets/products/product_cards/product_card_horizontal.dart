import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/brand_container.dart';
import 'package:quick_shop_app/common/widgets/circular_icon.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_price_text.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_title_text.dart';
import 'package:quick_shop_app/common/widgets/rounded_container.dart';
import 'package:quick_shop_app/common/widgets/rounded_images.dart';
import 'package:quick_shop_app/features/shop/models/brand_model.dart';
import 'package:quick_shop_app/features/shop/models/product_model.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomProductCardHorizontal extends StatelessWidget {
  const CustomProductCardHorizontal({
    super.key,
    required this.product,
  });

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CustomSizes.productImageRadius),
        color: dark ? CustomColors.darkGrey : CustomColors.grey,
      ),
      child: Row(
        children: [
          CustomRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(CustomSizes.sm),
            backgroundColor: dark ? CustomColors.dark : CustomColors.light,
            child: Stack(
              children: [
                // Thumbnail Image
                SizedBox(
                  height:120, 
                  width: 120, 
                  child: CustomRoundedImage(width: double.infinity, imageUrl: product.thumbnail, applyImageRadius: true)
                ),

                // Discount Tag
                Positioned(
                  top: 2,
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
          // Product Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: CustomSizes.sm, left: CustomSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Name
                      CustomProductTitleText(
                        title: product.title,
                        smallSize: true,
                      ),
                      const SizedBox(height: CustomSizes.spaceBtwItems / 2),
                      CustomBrandTitleTextWithVerification(brand: product.brand ?? BrandModel.empty()),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: CustomProductPriceText(price: product.price.toString())),

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
          )
        ],
      ),
    );
  }
}