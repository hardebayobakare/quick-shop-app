import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_price_text.dart';
import 'package:quick_shop_app/features/shop/controllers/product/cart_controller.dart';
import 'package:quick_shop_app/features/shop/screens/cart/widget/cart_add_remove_quantity.dart';
import 'package:quick_shop_app/features/shop/screens/cart/widget/cart_item.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class CustomCartItems extends StatelessWidget {
  const CustomCartItems({
    super.key,
    this.showActionButton = true,
  });

  final bool showActionButton;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(height: CustomSizes.spaceBtwSections), 
        itemCount: cartController.cartItems.length,
        itemBuilder: (_, index) => Obx(() {
          final item = cartController.cartItems[index];
          return Column(
            children: [
              CustomCartItem(cartItem: item),
              if(showActionButton) const SizedBox(height: CustomSizes.spaceBtwItems),
              if(showActionButton) Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 70),
                      CustomProductQuantityWithAddRemove(
                        quantity: item.quantity,
                        add: () => cartController.addOneToCart(item),
                        remove: () => cartController.removeOneFromCart(item),
                      ),
                    ],
                  ),
                  CustomProductPriceText(price: (item.price * item.quantity).toStringAsFixed(2)),
                ],
              )
            ],
          );}
        ),
      ),
    );
  }
}

