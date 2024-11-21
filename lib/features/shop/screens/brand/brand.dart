import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/common/widgets/brand_card.dart';
import 'package:quick_shop_app/common/widgets/brand_shimmer.dart';
import 'package:quick_shop_app/common/widgets/grid_layout.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/features/shop/controllers/brand_controller.dart';
import 'package:quick_shop_app/features/shop/screens/brand/brand_products.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text(CustomTextStrings.brands)
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              const CustomSectionHeading(title: CustomTextStrings.brands, showActionButton: false),
              const SizedBox(height: CustomSizes.spaceBtwItems),

              Obx(() {
                if (controller.isLoading.value) return CustomBrandShimmer(itemCount: controller.allBrands.length);
                if (controller.allBrands.isEmpty) return const Center(child: Text(CustomTextStrings.noContent));
                return CustomGridLayout(
                  mainAxisExtent: 80,
                  itemCount: controller.allBrands.length,
                  itemBuilder: (_, index) => CustomBrandCard(
                    showBorder: true,
                    brand: controller.allBrands[index],
                    onTap: () => Get.to(() => BrandProductsScreen(brand: controller.allBrands[index])),
                    ),
                );}
              )
            ],
          ),
        ),
      ),
    );
  }
}