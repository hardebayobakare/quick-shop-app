import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/choice_chip.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_price_text.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_title_text.dart';
import 'package:quick_shop_app/common/widgets/rounded_container.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomProductAttribute extends StatelessWidget {
  const CustomProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        CustomRoundedContainer(
          padding: const EdgeInsets.all(CustomSizes.md),
          backgroundColor: dark ? CustomColors.darkerGrey : CustomColors.grey,
          child: Column(
            children: [
              // Title, Price, Stock status
              Row(
                children: [
                  // Title
                  const CustomSectionHeading(title: 'Variations', showActionButton: false),
                  const SizedBox(width: CustomSizes.spaceBtwItems),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CustomProductTitleText(title: 'Price : ', smallSize: true),
                          const SizedBox(width: CustomSizes.spaceBtwItems),

                          // Actual Price
                          Text(
                            '\$ 200',
                            style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: CustomSizes.spaceBtwItems),
                      
                          // Sale Price
                          const CustomProductPriceText(price: '175'),
                        ],
                      ),
                      // Stock
                      Row(
                        children: [
                          const CustomProductTitleText(title: 'Stock : ', smallSize: true),
                          Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),               
                ],
              ),
              // Variations Description
              const CustomProductTitleText(
                title: "This is a variation of the product. You can select the size and color of the product.",
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems),

        // Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSectionHeading(title: "Color", showActionButton: false),
            const SizedBox(height: CustomSizes.spaceBtwItems / 2,),
            Wrap(
              spacing: CustomSizes.spaceBtwItems / 2,
              children: [
                CustomChoiceChip(text: 'Green', isSelected: true, onSelected: (isSelected) {}),
                CustomChoiceChip(text: 'Blue', isSelected: false, onSelected: (isSelected) {}),
                CustomChoiceChip(text: 'Yellow', isSelected: false, onSelected: (isSelected) {}),
                CustomChoiceChip(text: 'Black', isSelected: false, onSelected: (isSelected) {}),
                CustomChoiceChip(text: 'Purple', isSelected: false, onSelected: (isSelected) {}),
                CustomChoiceChip(text: 'Orange', isSelected: false, onSelected: (isSelected) {}),
                CustomChoiceChip(text: 'White', isSelected: false, onSelected: (isSelected) {}),
                CustomChoiceChip(text: 'Grey', isSelected: false, onSelected: (isSelected) {}),
                CustomChoiceChip(text: 'Lime', isSelected: false, onSelected: (isSelected) {}),
                CustomChoiceChip(text: 'Light Blue', isSelected: false, onSelected: (isSelected) {}),
                CustomChoiceChip(text: 'Deep Orange', isSelected: false, onSelected: (isSelected) {}),
                CustomChoiceChip(text: 'Light Green', isSelected: false, onSelected: (isSelected) {}),
              ],
            )
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSectionHeading(title: "Sizes", showActionButton: false),
            const SizedBox(height: CustomSizes.spaceBtwItems / 2,),
            Wrap(
              spacing: CustomSizes.spaceBtwItems / 2,
              children: [
                CustomChoiceChip(text: 'EU 34', isSelected: true, onSelected: (isSelected) {}),
                CustomChoiceChip(text: 'EU 36', isSelected: false, onSelected: (isSelected) {}),
                CustomChoiceChip(text: 'EU 38', isSelected: false, onSelected: (isSelected) {}),
                CustomChoiceChip(text: 'EU 34', isSelected: false, onSelected: (isSelected) {}),
                CustomChoiceChip(text: 'EU 36', isSelected: false, onSelected: (isSelected) {}),
                CustomChoiceChip(text: 'EU 38', isSelected: false, onSelected: (isSelected) {}),
                CustomChoiceChip(text: 'EU 34', isSelected: false, onSelected: (isSelected) {}),
                CustomChoiceChip(text: 'EU 36', isSelected: false, onSelected: (isSelected) {}),
                CustomChoiceChip(text: 'EU 38', isSelected: false, onSelected: (isSelected) {}),
              ],
            )
          ],
        )
      ],
    );
  }
}

