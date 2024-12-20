import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/brand_container.dart';
import 'package:quick_shop_app/common/widgets/circular_image.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_price_text.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_title_text.dart';
import 'package:quick_shop_app/common/widgets/rounded_container.dart';
import 'package:quick_shop_app/features/shop/controllers/product/product_controller.dart';
import 'package:quick_shop_app/features/shop/models/product_model.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/enums.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomProductMetaData extends StatelessWidget {
  const CustomProductMetaData({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salesPercentage = controller.getProductDiscount(product.price, product.salePrice);
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
                '$salesPercentage% off',
                style: Theme.of(context).textTheme.labelLarge!.apply(color: CustomColors.black),
              ),
            ),
            const SizedBox(width: CustomSizes.spaceBtwItems),

            // Price
            if (product.productType == ProductType.single.toString() && product.salePrice > 0)
              Text(
                '\$${product.price}',
                style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
              ),
            if (product.productType == ProductType.single.toString() && product.salePrice > 0) const SizedBox(width: CustomSizes.spaceBtwItems / 2),
            CustomProductPriceText(price: controller.getProductPrice(product), isLarge: true),
          ],
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems / 1.5),

        // Product Name
        CustomProductTitleText(title: product.title),
        const SizedBox(height: CustomSizes.spaceBtwItems / 1.5),

        // Stock Status
        Row(
          children: [
            const CustomProductTitleText(title: 'Status'),
            const SizedBox(width: CustomSizes.spaceBtwItems),
            Text(
              controller.getStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems / 1.5),

        // Brand
        Row(
          children: [
            CustomCircularImage(
              image: product.brand != null ? product.brand!.image : '', 
              width: 32, 
              height: 32,
              overlayColor: dark ? CustomColors.white : CustomColors.black,
              isNetworkImage: true,
            ),
            CustomBrandTitleTextWithVerification(brand: product.brand , brandTextSize: TextSizes.medium),
          ],
        )
      ],
    );
  }
}