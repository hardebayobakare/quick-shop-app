import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/features/shop/screens/cart/widget/cart_items.dart';
import 'package:quick_shop_app/features/shop/screens/checkout/checkout.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const Padding(
        padding: EdgeInsets.all(CustomSizes.defaultSpace),
        child: CustomCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), child: const Text('Checkout \$256')),
      ),
    );
  }
}

