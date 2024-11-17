import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/grid_layout.dart';
import 'package:quick_shop_app/common/widgets/primary_header_container.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:quick_shop_app/common/widgets/search_container.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/common/widgets/vertical_product_shimmer.dart';
import 'package:quick_shop_app/features/shop/controllers/product/product_controller.dart';
import 'package:quick_shop_app/features/shop/screens/all_product/all_product.dart';
import 'package:quick_shop_app/features/shop/screens/home/widget/home_appbar.dart';
import 'package:quick_shop_app/features/shop/screens/home/widget/home_category.dart';
import 'package:quick_shop_app/features/shop/screens/home/widget/home_slider.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const CustomPrimaryHeaderContainer(
              child: Column(
                children: [
                  // App Bar
                  CustomHomeAppBar(),
                  SizedBox(height: CustomSizes.spaceBtwSections),
                  
                  // Search Bar
                  CustomSearchContainer(
                    text: 'Search in store',
                    icon: Iconsax.search_normal,
                    showbackground: true,
                    showborder: true,
                  ),
                  SizedBox(height: CustomSizes.spaceBtwSections),
                  
                  //Categories Section
                  Padding(
                    padding: EdgeInsets.only(left: CustomSizes.defaultSpace),
                    child: Column(
                      children: [
                        // Section Heading
                        CustomSectionHeading(
                          title: CustomTextStrings.popularCategories,
                          showActionButton: false,
                          textColor: CustomColors.white,
                        ),
                        SizedBox(height: CustomSizes.spaceBtwItems),

                        // Categories
                        CustomHomeCategory(),
                        SizedBox(height: CustomSizes.spaceBtwSections),
                      ],
                    ),
                  ),
                ],
              )
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(CustomSizes.defaultSpace),
              child: Column(
                children: [
                  const CustomHomeSlider(),
                  const SizedBox(height: CustomSizes.spaceBtwSections),
                  CustomSectionHeading(
                    title: CustomTextStrings.popularProducts,
                    onButtonPressed: () => Get.to(() => const AllProductsScreen()),
                  ),
                  const SizedBox(height: CustomSizes.spaceBtwItems),
                  Obx(() {
                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                        child: Text(CustomTextStrings.noContent, style: Theme.of(context).textTheme.bodyMedium)
                      );}
                    if (controller.isLoading.value) return CustomVerticalProductShimmer(itemCount: controller.featuredProducts.length);
                    return CustomGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => CustomProductCardVertical(product: controller.featuredProducts[index]),
                    );
                  }),
                ],
              )            
            ),
        ],),
      ),
    );

  }
}



