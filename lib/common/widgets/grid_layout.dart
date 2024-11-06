import 'package:flutter/material.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class CustomGridLayout extends StatelessWidget {
  const CustomGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 288,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: itemCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:2,
        mainAxisSpacing: CustomSizes.gridViewSpacing,
        crossAxisSpacing: CustomSizes.gridViewSpacing,
        mainAxisExtent: 288,
      ) ,
      itemBuilder: itemBuilder,
    );
  }
}