import 'package:flutter/material.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/loaders/shimmer.dart';

class CustomHorizontalProductShimmer extends StatelessWidget {
  const CustomHorizontalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: CustomSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: CustomSizes.spaceBtwItems), 
        itemCount: itemCount,
        itemBuilder: (_, __) => const Row(
          children: [
            CustomShimmerEffect(width: 120, height: 120),
            SizedBox(width: CustomSizes.spaceBtwItems),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: CustomSizes.spaceBtwItems / 2),
                CustomShimmerEffect(width: 120, height: 20),
                SizedBox(height: CustomSizes.spaceBtwItems),
                CustomShimmerEffect(width: 120, height: 20),
                SizedBox(height: CustomSizes.spaceBtwItems),
                CustomShimmerEffect(width: 120, height: 20),
              ]
            ),
          ],
        ),
      ),
    );
  }
}