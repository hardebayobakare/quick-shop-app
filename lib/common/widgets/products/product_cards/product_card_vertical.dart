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
import 'package:quick_shop_app/features/shop/controllers/product_controller.dart';
import 'package:quick_shop_app/features/shop/models/brand_model.dart';
import 'package:quick_shop_app/features/shop/models/product_model.dart';
import 'package:quick_shop_app/features/shop/screens/product_detail/product_detail.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/enums.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomProductCardVertical extends StatelessWidget {
  const CustomProductCardVertical({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    final controller = ProductController.instace;
    final salePercentage = controller.getProductDiscount(product.price, product.salePrice);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
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
                  Center(
                    child: CustomRoundedImage(
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                      isNetworkImage: true,
                    ),
                  ),
      
                  // Discount Tag
                  Positioned(
                    top: 12,
                    child: CustomRoundedContainer(
                      radius: CustomSizes.sm,
                      backgroundColor: CustomColors.secondaryColor.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: CustomSizes.sm, vertical: CustomSizes.xs),
                      child: Text(
                        '$salePercentage%',
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
                  CustomProductTitleText(
                    title: product.title,
                    smallSize: true,
                  ),
                  const SizedBox(height: CustomSizes.spaceBtwItems / 2),
                  CustomBrandTitleTextWithVerification(brand: product.brand ?? BrandModel.empty(), maxLines: 1),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType == ProductType.single.toString() && product.salePrice > 0)
                        // Sale Price
                        Padding(
                          padding: const EdgeInsets.only(left: CustomSizes.sm),
                          child: Text(
                            '\$$product.price.toString()',
                            style: Theme.of(context).textTheme.labelMedium!.apply(
                              color: CustomColors.grey,
                              decoration: TextDecoration.lineThrough)
                          ),
                        ),
                      // Product Price
                      Padding(
                        padding: const EdgeInsets.only(left: CustomSizes.sm),
                        child: CustomProductPriceText(
                          price: controller.getProductPrice(product),
                        ),
                      ),
                    ],
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

