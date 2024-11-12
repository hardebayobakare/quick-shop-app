import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/products/rating_bar_indicator.dart';
import 'package:quick_shop_app/common/widgets/rounded_container.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(CustomImages.userProfileImage1),
                ),
                const SizedBox(width: CustomSizes.spaceBtwItems),
                Text('Alexis Sanchez', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(width: CustomSizes.spaceBtwItems),

        Row(
          children: [
            const CustomRatingBarIndicator(rating: 4.0),
            const SizedBox(width: CustomSizes.spaceBtwItems),
            Text('01, Aug 2024', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems),
        const ReadMoreText(
          'This is a very good product. I have been using it for a while now and I am very satisfied with it. I would recommend it to anyone who is looking for a good product.',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: CustomColors.primaryColor),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: CustomColors.primaryColor),
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems),

        // Company Response
        CustomRoundedContainer(
          backgroundColor: dark ? CustomColors.darkGrey : CustomColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(CustomSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Quick Shop', style: Theme.of(context).textTheme.bodyLarge),
                    Text('02, Aug 2024', style: Theme.of(context).textTheme.bodyMedium)
                  ],
                ),
                const SizedBox(height: CustomSizes.spaceBtwItems),
                const ReadMoreText(
                  'Thank you for your review. We are glad that you are satisfied with our product. We hope to see you again soon.',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: CustomColors.primaryColor),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: CustomColors.primaryColor),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems),
      ],
    );
  }
}