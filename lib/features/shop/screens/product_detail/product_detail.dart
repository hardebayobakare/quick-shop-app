import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/features/shop/screens/product_detail/widget/product_detail_attributes.dart';
import 'package:quick_shop_app/features/shop/screens/product_detail/widget/product_detail_bottom_add_to_cart.dart';
import 'package:quick_shop_app/features/shop/screens/product_detail/widget/product_detail_heading.dart';
import 'package:quick_shop_app/features/shop/screens/product_detail/widget/product_detail_rating.dart';
import 'package:quick_shop_app/features/shop/screens/product_detail/widget/product_meta_data.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAddtoCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Header with Image Slider
            const CustomProductImageSlider(),

            // Product Details
            Padding(
              padding: const EdgeInsets.only(right: CustomSizes.defaultSpace, left: CustomSizes.defaultSpace, bottom: CustomSizes.defaultSpace),
              child: Column(
                children: [
                  // Ratings and Share
                  const CustomProductRatingAndShare(),

                  // Price, Title, Stock and Brand
                  const CustomProductMetaData(),

                  // Attributes
                  const CustomProductAttribute(),
                  const SizedBox(height: CustomSizes.spaceBtwSections),

                  // Checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Add to Cart'))),
                   const SizedBox(height: CustomSizes.spaceBtwSections),

                  // Description
                  const CustomSectionHeading(title: 'Description', showActionButton: false),
                  const SizedBox(height: CustomSizes.spaceBtwItems),
                  const ReadMoreText(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, molestie ipsum et, consequat nibh. Etiam non elit dui. Nullam vel erat sed mi finibus luctus. Quisque ultricies, turpis nec vehicula posuere, turpis massa volutpat augue, at lacinia enim arcu nec est. Nulla facilisi. Nullam sit amet nunc nec nulla tincidunt aliquam. Donec euismod, nunc id lacinia ultricies, nunc nulla fermentum elit, nec auctor nunc metus at nunc. Nullam non metus nec nunc tincidunt aliquam. Nulla facilisi. Nullam sit amet nunc nec nulla tincidunt aliquam. Donec euismod, nunc id lacinia ultricies, nunc nulla fermentum elit, nec auctor nunc metus at nunc. Nullam non metus nec nunc tincidunt aliquam.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  // Reviews
                  const Divider(),
                  const SizedBox(height: CustomSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomSectionHeading(title: 'Reviews(200)', showActionButton: false),
                      IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_right_3, size: 18))
                    ],
                  ),
                  const SizedBox(height: CustomSizes.spaceBtwSections),



                ],
              ),
            )

          ],
        ),
      )
    );
  }
}


