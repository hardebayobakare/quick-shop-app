import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/common/widgets/brand_card.dart';
import 'package:quick_shop_app/common/widgets/products/sort_products.dart';
import 'package:quick_shop_app/common/widgets/vertical_product_shimmer.dart';
import 'package:quick_shop_app/features/shop/controllers/brand_controller.dart';
import 'package:quick_shop_app/features/shop/models/brand_model.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/helpers/cloud_helper_functions.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({
    super.key,
    required this.brand,
  });

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: const CustomAppBar(title: Text(CustomTextStrings.brand), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              CustomBrandCard(
                showBorder: true, 
                brand: brand,
              ),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              // Products
              FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {
                  const loader = CustomVerticalProductShimmer();
                  final widget = CustomCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: loader,
                  );
                  if (widget != null) return widget;
                  final products = snapshot.data!;
                  return  CustomSortableProduct(products: products);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}