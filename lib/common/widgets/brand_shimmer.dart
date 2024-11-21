import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/grid_layout.dart';
import 'package:quick_shop_app/utils/loaders/shimmer.dart';

class CustomBrandShimmer extends StatelessWidget {
  const CustomBrandShimmer({
    super.key,
    this.itemCount = 4
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return CustomGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount, 
      itemBuilder: (_, __) => const CustomShimmerEffect(width: 300, height: 80),
    );
  }
}