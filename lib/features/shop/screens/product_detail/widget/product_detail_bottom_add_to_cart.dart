import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/circular_icon.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class BottomAddtoCart extends StatelessWidget {
  const BottomAddtoCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: CustomSizes.defaultSpace, vertical: CustomSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? CustomColors.darkerGrey : CustomColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(CustomSizes.cardRadiusLg),
          topRight: Radius.circular(CustomSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CustomCircularIcon(
                icon: Iconsax.minus,
                width: 40,
                height: 40,
                backgroundColor: CustomColors.darkGrey,
                color: CustomColors.white,
              ),
              const SizedBox(width: CustomSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: CustomSizes.spaceBtwItems),
              const CustomCircularIcon(
                icon: Iconsax.add,
                width: 40,
                height: 40,
                backgroundColor: CustomColors.black,
                color: CustomColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(CustomSizes.md),
              backgroundColor: CustomColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
              ),
            ),
            child: const Text('Add to Cart', style: TextStyle(color: CustomColors.white)),
          ),
        ],
      ),
    );
  }
}