import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class CustomProductRatingAndShare extends StatelessWidget {
  const CustomProductRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Rating and Share
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber, size: 24),
            const SizedBox(width: CustomSizes.spaceBtwItems / 2),
            Text.rich(
              TextSpan(
                children: [
                    TextSpan(text: '5.0', style: Theme.of(context).textTheme.bodyLarge!),
                    const TextSpan(text: '(200)'),
                ],
              ),
            )
          ],
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.share, size: CustomSizes.iconMd)),
      ],
    );
  }
}
