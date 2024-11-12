import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/features/shop/screens/product_review/widget/review_card.dart';
import 'package:quick_shop_app/features/shop/screens/product_review/widget/review_overall_rating.dart';
import 'package:quick_shop_app/common/widgets/products/rating_bar_indicator.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Ratings and reviews are verified and are from people who use the same type of device that you use'),
              const SizedBox(height: CustomSizes.spaceBtwItems),

              // Overall Rating
              const CustomOveralProductRating(),
              const CustomRatingBarIndicator(rating: 4.4),
              Text('13,400', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: CustomSizes.spaceBtwSections),


              // Reviews List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          )
        )
      ),
    );
  }
}



