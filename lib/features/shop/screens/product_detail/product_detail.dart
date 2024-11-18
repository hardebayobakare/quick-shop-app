import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/features/shop/models/product_model.dart';
import 'package:quick_shop_app/features/shop/screens/product_detail/widget/product_detail_attributes.dart';
import 'package:quick_shop_app/features/shop/screens/product_detail/widget/product_detail_bottom_add_to_cart.dart';
import 'package:quick_shop_app/features/shop/screens/product_detail/widget/product_detail_heading.dart';
import 'package:quick_shop_app/features/shop/screens/product_detail/widget/product_detail_rating.dart';
import 'package:quick_shop_app/features/shop/screens/product_detail/widget/product_meta_data.dart';
import 'package:quick_shop_app/features/shop/screens/product_review/product_review.dart';
import 'package:quick_shop_app/utils/constants/enums.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAddtoCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Header with Image Slider
            CustomProductImageSlider(product: product),

            // Product Details
            Padding(
              padding: const EdgeInsets.only(right: CustomSizes.defaultSpace, left: CustomSizes.defaultSpace, bottom: CustomSizes.defaultSpace),
              child: Column(
                children: [
                  // Ratings and Share
                  const CustomProductRatingAndShare(),

                  // Price, Title, Stock and Brand
                  CustomProductMetaData(product: product),

                  // Attributes
                  if (product.productType == ProductType.variable.toString() && product.productVariations!.isNotEmpty)
                      CustomProductAttribute(product: product),
                  if (product.productType == ProductType.variable.toString() && product.productVariations!.isNotEmpty)
                      const SizedBox(height: CustomSizes.spaceBtwSections),

                  // Checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Add to Cart'))),
                   const SizedBox(height: CustomSizes.spaceBtwSections),

                  // Description
                  const CustomSectionHeading(title: 'Description', showActionButton: false),
                  const SizedBox(height: CustomSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  // Reviews
                  const Divider(),
                  const SizedBox(height: CustomSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomSectionHeading(title: 'Reviews(200)', showActionButton: false),
                      IconButton(onPressed: () => Get.to(() => const ProductReviewScreen()), icon: const Icon(Iconsax.arrow_right_3, size: 18))
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


