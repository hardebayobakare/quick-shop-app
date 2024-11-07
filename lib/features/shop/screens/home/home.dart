import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/grid_layout.dart';
import 'package:quick_shop_app/common/widgets/primary_header_container.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:quick_shop_app/common/widgets/search_container.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/features/shop/screens/home/widget/home_appbar.dart';
import 'package:quick_shop_app/features/shop/screens/home/widget/home_category.dart';
import 'package:quick_shop_app/features/shop/screens/home/widget/home_slider.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        CustomHomeCategory(
                          categories: [
                            CustomImages.sportIcon,
                            CustomImages.electronicsIcon,
                            CustomImages.clothIcon,
                            CustomImages.cosmeticsIcon,
                            CustomImages.shoeIcon,
                            CustomImages.animalIcon,
                            CustomImages.furnitureIcon,
                            CustomImages.animalIcon,
                            CustomImages.jeweleryIcon,
                          ],
                        )
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
                  const CustomHomeSlider(
                    banners: [
                      CustomImages.banner1,
                      CustomImages.banner2,
                      CustomImages.banner3,
                    ],
                  ),
                  const SizedBox(height: CustomSizes.spaceBtwSections),
                  CustomSectionHeading(
                    title: CustomTextStrings.popularProducts,
                    onButtonPressed: () {},
                  ),
                  const SizedBox(height: CustomSizes.spaceBtwItems),
                  CustomGridLayout(
                    itemCount: 2,
                    itemBuilder: (_, index) => const CustomProductCardVertical(),
                  ),
                ],
              )            
            ),

            

        ],),
      ),
    );

  }
}



