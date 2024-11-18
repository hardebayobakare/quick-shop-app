import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/grid_layout.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/loaders/shimmer.dart';

class CustomVerticalProductShimmer extends StatelessWidget {
  final int itemCount;

  const CustomVerticalProductShimmer({
    super.key, 
    this.itemCount = 4,
  });

  @override
  Widget build(BuildContext context) {
    return CustomGridLayout(
      itemCount: itemCount, 
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            CustomShimmerEffect(width: 180, height: 180),
            SizedBox(height: CustomSizes.spaceBtwItems),
            
            // Texts
            CustomShimmerEffect(width: 160, height: 15),
            SizedBox(height: CustomSizes.spaceBtwItems / 2),
            CustomShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}