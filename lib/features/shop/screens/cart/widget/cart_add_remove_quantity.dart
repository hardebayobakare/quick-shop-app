import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/circular_icon.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomProductQuantityWithAddRemove extends StatelessWidget {
  const CustomProductQuantityWithAddRemove({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: CustomSizes.md,
          color: dark ? CustomColors.white : CustomColors.black,
          backgroundColor: dark ? CustomColors.darkerGrey : CustomColors.light,
          onPressed: remove,
        ),
        const SizedBox(width: CustomSizes.spaceBtwItems),
        Text(quantity.toString(), style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: CustomSizes.spaceBtwItems),
        CustomCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: CustomSizes.md,
          color: CustomColors.white,
          backgroundColor: CustomColors.primaryColor,
          onPressed: add,
        ),
      ],
    );
  }
}