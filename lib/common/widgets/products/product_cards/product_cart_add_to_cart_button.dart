import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/features/shop/controllers/product/cart_controller.dart';
import 'package:quick_shop_app/features/shop/models/product_model.dart';
import 'package:quick_shop_app/features/shop/screens/product_detail/product_detail.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/enums.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class CustomProductCardAddToCartButton extends StatelessWidget {
  const CustomProductCardAddToCartButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: () {
        // If product have variation open product detail screen
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertProductToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetailScreen(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart = cartController.getProductQuantityInCart(product.id);
        return Container (
          decoration: BoxDecoration(
            color: productQuantityInCart > 0 ? CustomColors.primaryColor : CustomColors.dark,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(CustomSizes.cardRadiusMd),
              bottomRight: Radius.circular(CustomSizes.productImageRadius),
            ),
          ),
          child: SizedBox(
            width: CustomSizes.iconLg * 1.2,
            height: CustomSizes.iconLg * 1.2,
            child: productQuantityInCart > 0 
              ? Center(child: Text(productQuantityInCart.toString(), style: Theme.of(context).textTheme.bodyLarge!.apply(color: CustomColors.white)))
              : const Center(child: Icon(Iconsax.add, color: CustomColors.white))),
        );}
      ),
    );
  }
}