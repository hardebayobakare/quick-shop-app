import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class CustomBillingAddressSection extends StatelessWidget {
  const CustomBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSectionHeading(
          title: 'Shipping Address', 
          buttonTitle: 'Change',
          onButtonPressed: () {},
        ),
        Text('Adebayo Oluwaseun', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: CustomSizes.spaceBtwItems / 2),

        Row(
          children: [
            const Icon(Icons.phone, color: CustomColors.grey, size: 16),
            const SizedBox(width: CustomSizes.spaceBtwItems),
            Text('+1 123 456 7890', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),

        const SizedBox(height: CustomSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: CustomColors.grey, size: 16),
            const SizedBox(width: CustomSizes.spaceBtwItems),
            Expanded(child: Text('188 Clark Blvd, Brampton ON L6T 0J2', style: Theme.of(context).textTheme.bodyMedium)),
          ],
        )
      ],
    );
  }
}