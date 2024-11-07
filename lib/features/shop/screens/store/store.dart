import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/common/widgets/brand_container.dart';
import 'package:quick_shop_app/common/widgets/cart.dart';
import 'package:quick_shop_app/common/widgets/circular_image.dart';
import 'package:quick_shop_app/common/widgets/grid_layout.dart';
import 'package:quick_shop_app/common/widgets/rounded_container.dart';
import 'package:quick_shop_app/common/widgets/search_container.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/enums.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Scaffold(
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
                      return GestureDetector(
                        onTap: () {},
                        child: CustomRoundedContainer(
                          padding: const EdgeInsets.all(CustomSizes.sm),
                          showborder: true,
                          backgroundColor: Colors.transparent,
                          child: Row(
                            children: [
                              // Brand Icon
                              Flexible(
                                child: CustomCircularImage(
                                  isNetworkImage: false,
                                  image: CustomImages.nikeLogo,
                                  backgroundColor: Colors.transparent,
                                  overlayColor: dark ? CustomColors.light : CustomColors.dark,
                                ),
                              ),
                              const SizedBox(width: CustomSizes.spaceBtwItems / 2),
                        
                              // Text
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CustomBrandTitleTextWithVerification(brandName: "Nike", isVerified: true, brandTextSize: TextSizes.large),
                                    Text(
                                      '300 Products',
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                  ],
                                ),
                              )
                            ], 
                          ),
                        ),
                      );
                    }
                  )
                ],
              ),
            ),
            
          ),
        ];
      }, body: Container()),
    );
  }
}