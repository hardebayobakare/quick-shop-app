import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/brand_container.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_title_text.dart';
import 'package:quick_shop_app/common/widgets/rounded_images.dart';
import 'package:quick_shop_app/features/shop/models/brand_model.dart';
import 'package:quick_shop_app/features/shop/models/cart_item_model.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        // Product Image
        CustomRoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(CustomSizes.sm),
          backgroundColor: dark ? CustomColors.darkerGrey : CustomColors.light,
          isNetworkImage: true,
        ),
        const SizedBox(width: CustomSizes.spaceBtwItems),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBrandTitleTextWithVerification(brand: cartItem.brandName ?? BrandModel.empty()),
            Flexible(child: CustomProductTitleText(title: cartItem.title,  maxLines: 1)),
            Text.rich(
              TextSpan(
                children: (cartItem.selectedVariation ?? {}).entries.map((e) {
                  final key = e.key;
                  final value = e.value;
                  return TextSpan(
                    children: [
                      TextSpan(text: '$key: ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: '$value ', style: Theme.of(context).textTheme.bodySmall),
                    ],
                  );
                }).toList(),
              )
            )
          ],
        )
      ],
    );
  }
}