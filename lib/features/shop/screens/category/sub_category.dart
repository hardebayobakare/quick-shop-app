import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class CustomSubCategory extends StatelessWidget {
  const CustomSubCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSectionHeading(title: 'Sport Shirt', onButtonPressed: () {},),
        const SizedBox(height: CustomSizes.spaceBtwItems / 2),
    
        SizedBox(
          height: 120,
          child: ListView.separated(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: CustomSizes.spaceBtwItems),
            itemBuilder: (context, index) => const CustomProductCardHorizontal()
          ),
        )
      ],
    );
  }
}