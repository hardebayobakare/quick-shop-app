import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_price_text.dart';
import 'package:quick_shop_app/features/shop/screens/cart/widget/cart_add_remove_quantity.dart';
import 'package:quick_shop_app/features/shop/screens/cart/widget/cart_item.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) => const SizedBox(height: CustomSizes.spaceBtwSections), 
          itemCount: 14,
          itemBuilder: (_, index) => const Column(
            children: [
              CustomCartItem(),
              SizedBox(height: CustomSizes.spaceBtwItems),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 70),
                      CustomProductQuantityWithAddRemove(),
                    ],
                  ),
                  CustomProductPriceText(price: '256')
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: ElevatedButton(onPressed: () {}, child: const Text('Checkout \$256')),
      ),
    );
  }
}

