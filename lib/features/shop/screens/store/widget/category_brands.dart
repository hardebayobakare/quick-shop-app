import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/box_shimmes.dart';
import 'package:quick_shop_app/common/widgets/brand_showcase.dart';
import 'package:quick_shop_app/common/widgets/products/listtile_shimmer.dart';
import 'package:quick_shop_app/features/shop/controllers/brand_controller.dart';
import 'package:quick_shop_app/features/shop/models/category_model.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/cloud_helper_functions.dart';

class CustomCategoryBrands extends StatelessWidget {
  const CustomCategoryBrands({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
        const loader = Column (
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomListTileShimmer(),
            SizedBox(height: CustomSizes.spaceBtwItems),
            CustomBoxShimmer(),
            SizedBox(height: CustomSizes.spaceBtwItems),
          ]
        );

        final widget = CustomCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
        if (widget != null) return widget;

        final brands = snapshot.data!;
                 
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (_, index) {
            final brand = brands[index];
            return FutureBuilder(
              future: controller.getBrandProducts(brandId: brand.id, limit: 3),
              builder: (context, snapshot) {
                final widget = CustomCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                if(widget != null) return widget;

                final products = snapshot.data!;
                return CustomBrandShowcase(brand: brand, productImages: products.map((e) => e.thumbnail).toList());
              }
            );
          },
        );
      }
    );
  }
}