import 'package:flutter/material.dart';
import 'package:quick_shop_app/features/shop/controllers/product/cart_controller.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/helpers/pricing_calculator.dart';

class CustomBillingAmountSection extends StatelessWidget {
  const CustomBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subtotal = cartController.cartTotalPrice.value;
    return Column(
      children: [
        // Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(CustomTextStrings.subtotal, style: Theme.of(context).textTheme.bodyMedium),
            Text('\$${subtotal.toStringAsFixed(2)}', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems / 2),

        // Shipping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(CustomTextStrings.shippingFee, style: Theme.of(context).textTheme.bodyMedium),
            Text('\$${CustomPriceCalculator.calculateShippingCost(subtotal, 'US')}', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems / 2),

        // Tax
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(CustomTextStrings.tax, style: Theme.of(context).textTheme.bodyMedium),
            Text('\$${CustomPriceCalculator.calculateTax(subtotal, 'US')}', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems),

        // Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(CustomTextStrings.orderTotal, style: Theme.of(context).textTheme.headlineSmall),
            Text('\$${CustomPriceCalculator.calculateTotalPrice(subtotal, 'US').toStringAsFixed(2)}', style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),

      ],
    );
  }
}