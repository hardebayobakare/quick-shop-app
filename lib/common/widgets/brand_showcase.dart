import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/widgets/brand_card.dart';
import 'package:quick_shop_app/common/widgets/rounded_container.dart';
import 'package:quick_shop_app/features/shop/models/brand_model.dart';
import 'package:quick_shop_app/features/shop/screens/brand/brand_products.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';
import 'package:quick_shop_app/utils/loaders/shimmer.dart';

class CustomBrandShowcase extends StatelessWidget {
  const CustomBrandShowcase({
    super.key,
    required this.brand,
    required this.productImages,

  });

  final BrandModel brand;
  final List<String> productImages;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProductsScreen(brand: brand)),
      child: CustomRoundedContainer(
        showborder: true,
        borderColor: CustomColors.darkGrey,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: CustomSizes.spaceBtwItems),
        padding: const EdgeInsets.all(CustomSizes.md),
        child: Column(
          children: [
            // Brand with Product Count
            CustomBrandCard(
              brand: brand,
              showBorder: false,
            ),
      
            const SizedBox(height: CustomSizes.spaceBtwItems),
      
            // Top 3 Products from Brand
            Row(
              children: productImages.map((image) => brandTopProductImageWidget(image, context)).toList(),
            )
          ],
        ),
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context){
  final dark = CustomHelperFunctions.isDarkMode(context);
  return Expanded(
    child: CustomRoundedContainer(
      height: 100,
      backgroundColor: dark ? CustomColors.darkGrey : CustomColors.light,
      margin: const EdgeInsets.only(right: CustomSizes.sm),
      padding: const EdgeInsets.all(CustomSizes.md),
      child: CachedNetworkImage(
        fit: BoxFit.contain,
        imageUrl: image,
        progressIndicatorBuilder: (context, url, progress) => const CustomShimmerEffect(width: 100, height: 100),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    ),
  );
}
