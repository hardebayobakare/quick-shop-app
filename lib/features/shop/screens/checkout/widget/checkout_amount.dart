import 'package:flutter/material.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class CustomBillingAmountSection extends StatelessWidget {
  const CustomBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$256', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems / 2),

        // Shipping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$10', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems / 2),

        // Tax
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$10', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems),

        // Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.headlineSmall),
            Text('\$276', style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),

      ],
    );
  }
}