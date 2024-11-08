import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/common/widgets/brand_card.dart';
import 'package:quick_shop_app/common/widgets/cart.dart';
import 'package:quick_shop_app/common/widgets/grid_layout.dart';
import 'package:quick_shop_app/common/widgets/search_container.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/common/widgets/tab_bar.dart';
import 'package:quick_shop_app/features/shop/screens/store/widget/store_category.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: CustomAppBar(
          title: const Text('Store'),
      
          actions: [
            CustomCartCounterIcon(onPressed: () {}),
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
                      text: 'Search in store',
                      icon: Icons.search,
                      showbackground: true,
                      showborder: true,
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(height: CustomSizes.spaceBtwSections),
      
                    // Featured Brands
                    CustomSectionHeading(
                      title: 'Featured Brands',
                      showActionButton: true,
                      onButtonPressed: () {},
                    ),
                    const SizedBox(height: CustomSizes.spaceBtwItems / 1.5),
      
                    // Brands
                    CustomGridLayout(
                      itemCount: 4, 
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        return const CustomBrandCard(
                          showBorder: true,
                          image: CustomImages.nikeLogo,
                          brandName: 'Nike',
                          productsCount: '300',
                          isVerified: true,
                        );
                      }
                    )
                  ],
                ),
              ),
              bottom: const CustomTabBar(
                tabs: [
                  Tab(child: Text('Sports')),
                  Tab(child: Text('Furniture')),
                  Tab(child: Text('Eletronics')),
                  Tab(child: Text('Clothes')),
                  Tab(child: Text('Cosmetics')),
                ],
              ),
            ),
          ];
        }, 
        body: const TabBarView(
            children: [
              CustomCategoryTab(),
              CustomCategoryTab(),
              CustomCategoryTab(),
              CustomCategoryTab(),
              CustomCategoryTab(),
            ]
          ),
        )
      ),
    );
  }
}


