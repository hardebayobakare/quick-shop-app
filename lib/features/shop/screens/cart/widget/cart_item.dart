import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/brand_container.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_title_text.dart';
import 'package:quick_shop_app/common/widgets/rounded_images.dart';
import 'package:quick_shop_app/features/shop/models/brand_model.dart';
import 'package:quick_shop_app/features/shop/models/product_model.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        // Product Image
        CustomRoundedImage(
          imageUrl: CustomImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(CustomSizes.sm),
          backgroundColor: dark ? CustomColors.darkerGrey : CustomColors.light,
        ),
        const SizedBox(width: CustomSizes.spaceBtwItems),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBrandTitleTextWithVerification(brand: product.brand ?? BrandModel.empty()),
            const Flexible(child: CustomProductTitleText(title: 'Nike Air Max 270', maxLines: 1)),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Color: ', style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: 'Green ', style: Theme.of(context).textTheme.bodyLarge),
                  TextSpan(text: 'Size: ', style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: 'EU 44 ', style: Theme.of(context).textTheme.bodyLarge),
                ]
              )
            )
          ],
        )
      ],
    );
  }
}