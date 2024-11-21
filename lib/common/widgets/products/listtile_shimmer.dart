import 'package:flutter/material.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/loaders/shimmer.dart';

class CustomListTileShimmer extends StatelessWidget {
  const CustomListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            CustomShimmerEffect(width: 50, height: 50, radius: 50),
            SizedBox(width: CustomSizes.spaceBtwItems),
            Column(
              children: [
                CustomShimmerEffect(width: 100, height: 15),
                SizedBox(height: CustomSizes.spaceBtwItems / 2),
                CustomShimmerEffect(width: 80, height: 12)
              ],
            )
          ],
        )
      ]
    );
  }
}