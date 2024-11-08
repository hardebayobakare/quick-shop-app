import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/brand_showcase.dart';
import 'package:quick_shop_app/common/widgets/grid_layout.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class CustomCategoryTab extends StatelessWidget {
  const CustomCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              // Brand Showcase
              const CustomBrandShowcase(
                productImages: [
                  CustomImages.productImage1,
                  CustomImages.productImage2,
                  CustomImages.productImage3,
                ]
              ),
              const CustomBrandShowcase(
                productImages: [
                  CustomImages.productImage11,
                  CustomImages.productImage11,
                  CustomImages.productImage12,
                ]
              ),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              // Products
              CustomSectionHeading(title: "You might like", onButtonPressed: () {}),
              const SizedBox(height: CustomSizes.spaceBtwItems),
        
              CustomGridLayout(itemCount: 4, itemBuilder: (_, index) => const CustomProductCardVertical()),
              const SizedBox(height: CustomSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}