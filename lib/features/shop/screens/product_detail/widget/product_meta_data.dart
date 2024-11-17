import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/brand_container.dart';
import 'package:quick_shop_app/common/widgets/circular_image.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_price_text.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_title_text.dart';
import 'package:quick_shop_app/common/widgets/rounded_container.dart';
import 'package:quick_shop_app/features/shop/models/brand_model.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/enums.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomProductMetaData extends StatelessWidget {
  const CustomProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price and Sale Price
        Row(
          children: [
            // Discount Tag
            CustomRoundedContainer(
              radius: CustomSizes.sm,
              backgroundColor: CustomColors.secondaryColor.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: CustomSizes.sm, vertical: CustomSizes.xs),
              child: Text(
                '20%',
                style: Theme.of(context).textTheme.labelLarge!.apply(color: CustomColors.black),
              ),
            ),
            const SizedBox(width: CustomSizes.spaceBtwItems),

            // Price
            Text(
              '\$ 200',
              style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: CustomSizes.spaceBtwItems),
            const CustomProductPriceText(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems * 1.5),

        // Product Name
        const CustomProductTitleText(title: 'Nike Air 270'),
        const SizedBox(height: CustomSizes.spaceBtwItems * 1.5),

        // Stock Status
        Row(
          children: [
            const CustomProductTitleText(title: 'Status'),
            const SizedBox(width: CustomSizes.spaceBtwItems),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems * 1.5),

        // Brand
        Row(
          children: [
            CustomCircularImage(
              image: CustomImages.nikeLogo, 
              width: 32, 
              height: 32,
              overlayColor: dark ? CustomColors.white : CustomColors.black,
            ),
            const SizedBox(width: CustomSizes.spaceBtwItems / 2),
            CustomBrandTitleTextWithVerification(brand: BrandModel.empty(), brandTextSize: TextSizes.medium,),
          ],
        )

        // Description
      ],
    );
  }
}