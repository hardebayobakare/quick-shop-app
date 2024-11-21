import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/widgets/grid_layout.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/common/widgets/vertical_product_shimmer.dart';
import 'package:quick_shop_app/features/shop/controllers/category_controller.dart';
import 'package:quick_shop_app/features/shop/models/category_model.dart';
import 'package:quick_shop_app/features/shop/screens/all_product/all_product.dart';
import 'package:quick_shop_app/features/shop/screens/store/widget/category_brands.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/helpers/cloud_helper_functions.dart';

class CustomCategoryTab extends StatelessWidget {
  const CustomCategoryTab({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              // Brand Showcase
              CustomCategoryBrands(category: category),
              // Products
              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {
                  final widget = CustomCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: const CustomVerticalProductShimmer());
                  if (widget != null) return widget;

                  final products = snapshot.data!;

                  return Column(
                    children: [
                      CustomSectionHeading(
                        title: CustomTextStrings.youMightLike, 
                        onButtonPressed: () => Get.to(AllProductsScreen(
                          title: category.name,
                          futureMethod: controller.getCategoryProducts(categoryId: category.id),
                        ))),
                      const SizedBox(height: CustomSizes.spaceBtwItems),
                      CustomGridLayout(itemCount: products.length, itemBuilder: (_, index) => CustomProductCardVertical(product: products[index])),
                    ],
                  );
                }
              ),        
              
            ],
          ),
        ),
      ],
    );
  }
}