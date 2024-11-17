import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/common/widgets/brand_card.dart';
import 'package:quick_shop_app/common/widgets/grid_layout.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/features/shop/models/brand_model.dart';
import 'package:quick_shop_app/features/shop/screens/brand/brand_products.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text('Brand')
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              const CustomSectionHeading(title: 'Brands', showActionButton: false),
              const SizedBox(height: CustomSizes.spaceBtwItems),

              CustomGridLayout(
                mainAxisExtent: 80,
                itemCount: 10,
                itemBuilder: (_, index) => CustomBrandCard(
                  showBorder: true,
                  brand: BrandModel.empty(),
                  onTap: () => Get.to(() => const BrandProductsScreen()),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}