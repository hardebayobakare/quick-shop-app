import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_price_text.dart';
import 'package:quick_shop_app/features/shop/models/product_model.dart';
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
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: CustomSizes.spaceBtwSections), 
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          CustomCartItem(product: ProductModel.empty()),
          if(showActionButton) const SizedBox(height: CustomSizes.spaceBtwItems),
          if(showActionButton) const Row(
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
    );
  }
}

