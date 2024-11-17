import 'package:flutter/material.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/loaders/shimmer.dart';

class CustomCategoryShimmer extends StatelessWidget {
  const CustomCategoryShimmer({
    super.key,
    this.itemCount = 8,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: CustomSizes.spaceBtwItems), 
        itemCount: itemCount,
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: CustomSizes.spaceBtwItems / 2),

              // Shimmer Text
              CustomShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}