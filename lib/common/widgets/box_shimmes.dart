import 'package:flutter/material.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/loaders/shimmer.dart';

class CustomBoxShimmer extends StatelessWidget {
  const CustomBoxShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: CustomShimmerEffect(width: 150, height: 110)),
            SizedBox(width: CustomSizes.spaceBtwItems),
            Expanded(child: CustomShimmerEffect(width: 150, height: 110)),
            SizedBox(width: CustomSizes.spaceBtwItems),
            Expanded(child: CustomShimmerEffect(width: 150, height: 110)),
          ],
        )
      ]
    );
  }
}