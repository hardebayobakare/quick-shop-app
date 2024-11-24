import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/menu/navigation_menu.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/features/shop/controllers/product/cart_controller.dart';
import 'package:quick_shop_app/features/shop/screens/cart/widget/cart_items.dart';
import 'package:quick_shop_app/features/shop/screens/checkout/checkout.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/loaders/animation_loader.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Obx(() {
        final emptyWidget = CustomAnimationLoaderWidget(
          text: CustomTextStrings.cartEmpty, 
          animation: CustomImages.cartAnimation,
          showAction: true,
          actionText: CustomTextStrings.startShopping,
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        return controller.cartItems.isEmpty 
          ? emptyWidget
          : const SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(CustomSizes.defaultSpace),
                child: CustomCartItems(),
              ),
          );
        },
      ),
      bottomNavigationBar: controller.cartItems.isNotEmpty 
        ? Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()), 
            child: Obx(() => Text('Checkout \$${controller.cartTotalPrice.value.toStringAsFixed(2)}'))),
          )
        : const SizedBox(),
    );
  }
}

