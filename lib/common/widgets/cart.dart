import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomCartCounterIcon extends StatelessWidget {
  const CustomCartCounterIcon({
    super.key,
    this.iconColor,
    required this.onPressed,
  });

  final Color? iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Iconsax.shopping_bag),
          color: iconColor ?? (dark ? CustomColors.light : CustomColors.dark),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height:18,
            decoration: BoxDecoration(
              color: CustomColors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child:Center(
              child: Text('2', style: Theme.of(context).textTheme.labelLarge!.apply(color: CustomColors.white, fontSizeFactor: 0.8)))
          ),
        )
      ]
    );
  }
}