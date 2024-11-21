import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/common/widgets/brand_card.dart';
import 'package:quick_shop_app/common/widgets/brand_shimmer.dart';
import 'package:quick_shop_app/common/widgets/products/carts/cart.dart';
import 'package:quick_shop_app/common/widgets/grid_layout.dart';
import 'package:quick_shop_app/common/widgets/search_container.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/common/widgets/tab_bar.dart';
import 'package:quick_shop_app/features/shop/controllers/brand_controller.dart';
import 'package:quick_shop_app/features/shop/controllers/category_controller.dart';
import 'package:quick_shop_app/features/shop/screens/brand/brand.dart';
import 'package:quick_shop_app/features/shop/screens/brand/brand_products.dart';
import 'package:quick_shop_app/features/shop/screens/store/widget/store_category.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    final featuredbrands = brandController.featuredBrands;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: Text(CustomTextStrings.store),      
          actions: [
            CustomCartCounterIcon(),
          ]
        ),
        body: NestedScrollView(headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              floating: true,
              pinned: true,
              backgroundColor: dark ? CustomColors.dark : CustomColors.light,
              expandedHeight: 440,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(CustomSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    // Search Bar
                    const SizedBox(height: CustomSizes.spaceBtwItems),
                    const CustomSearchContainer(
                      text: CustomTextStrings.searchStore,
                      icon: Icons.search,
                      showbackground: true,
                      showborder: true,
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(height: CustomSizes.spaceBtwSections),
      
                    // Featured Brands
                    CustomSectionHeading(
                      title: CustomTextStrings.featuredBrands,
                      showActionButton: true,
                      onButtonPressed: () => Get.to(() => const BrandScreen()),
                    ),
                    const SizedBox(height: CustomSizes.spaceBtwItems / 1.5),
      
                    // Brands
                    Obx(() {
                      if (brandController.isLoading.value) return const CustomBrandShimmer();
                      if (featuredbrands.isEmpty) return const Center(child: Text(CustomTextStrings.noContent));
                      return CustomGridLayout(
                        itemCount: featuredbrands.length, 
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return CustomBrandCard(
                            showBorder: true,
                            brand: featuredbrands[index],
                            onTap: () => Get.to(() => BrandProductsScreen(brand: featuredbrands[index],)),
                          );
                        }
                      );}
                    )
                  ],
                ),
              ),
              bottom: CustomTabBar(
                tabs: categories.map((category) => Tab(child: Text(category.name))).toList()
              ),
            ),
          ];
        }, 
        body: TabBarView(
            children: categories.map((category) => CustomCategoryTab(category: category)).toList(),
          ),
        )
      ),
    );
  }
}


