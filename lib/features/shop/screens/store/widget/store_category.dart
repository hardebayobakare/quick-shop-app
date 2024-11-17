import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/brand_showcase.dart';
import 'package:quick_shop_app/common/widgets/grid_layout.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/features/shop/models/brand_model.dart';
import 'package:quick_shop_app/features/shop/models/category_model.dart';
import 'package:quick_shop_app/features/shop/models/product_model.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class CustomCategoryTab extends StatelessWidget {
  const CustomCategoryTab({
    super.key,
    required this.category,
  });

  final CategoryModel category;

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
              CustomBrandShowcase(
                brand: BrandModel.empty(),
                productImages: const [
                  CustomImages.productImage1,
                  CustomImages.productImage2,
                  CustomImages.productImage3,
                ]
              ),
              CustomBrandShowcase(
                brand: BrandModel.empty(),
                productImages: const [
                  CustomImages.productImage11,
                  CustomImages.productImage11,
                  CustomImages.productImage12,
                ]
              ),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              // Products
              CustomSectionHeading(title: "You might like", onButtonPressed: () {}),
              const SizedBox(height: CustomSizes.spaceBtwItems),
        
              CustomGridLayout(itemCount: 4, itemBuilder: (_, index) => CustomProductCardVertical(product: ProductModel.empty())),
              const SizedBox(height: CustomSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}