import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/circular_icon.dart';
import 'package:quick_shop_app/features/shop/controllers/product/cart_controller.dart';
import 'package:quick_shop_app/features/shop/models/product_model.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class BottomAddtoCart extends StatelessWidget {
  const BottomAddtoCart({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    cartController.updateAlreadyAddedProductCount(product);
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: CustomSizes.defaultSpace, vertical: CustomSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? CustomColors.darkerGrey : CustomColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(CustomSizes.cardRadiusLg),
          topRight: Radius.circular(CustomSizes.cardRadiusLg),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CustomCircularIcon(
                  icon: Iconsax.minus,
                  width: 40,
                  height: 40,
                  backgroundColor: CustomColors.darkGrey,
                  color: CustomColors.white,
                  onPressed: cartController.productQuantityInCart.value < 1 ?
                    null : () => cartController.productQuantityInCart.value -= 1,
                ),
                const SizedBox(width: CustomSizes.spaceBtwItems),
                Text(cartController.productQuantityInCart.value.toString(), style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: CustomSizes.spaceBtwItems),
                CustomCircularIcon(
                  icon: Iconsax.add,
                  width: 40,
                  height: 40,
                  backgroundColor: CustomColors.black,
                  color: CustomColors.white,
                  onPressed: () => cartController.productQuantityInCart.value += 1,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: cartController.productQuantityInCart.value < 1 ? null : () => cartController.addToCart(product),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(CustomSizes.md),
                backgroundColor: cartController.productQuantityInCart.value < 1 
                  ? CustomColors.buttonDisabled : CustomColors.primaryColor,
                side: const BorderSide(color: CustomColors.primaryColor),
              ),
              child: const Text(CustomTextStrings.addToCart, style: TextStyle(color: CustomColors.white)),
            ),
          ],
        ),
      ),
    );
  }
}