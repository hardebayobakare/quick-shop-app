import 'package:flutter/material.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/device/device_utitlty.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomSearchContainer extends StatelessWidget {
  const CustomSearchContainer({
    super.key,
    required this.text,
    this.icon,
    required this.showbackground,
    required this.showborder,
    this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showbackground, showborder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: CustomSizes.defaultSpace),
        child: Container(
          width: DeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(CustomSizes.md),
          decoration: BoxDecoration(
            color: showbackground ? dark ? CustomColors.dark : CustomColors.light : Colors.transparent,
            borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
            border: showborder? Border.all(color: Colors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: dark ? CustomColors.light : CustomColors.dark),
              const SizedBox(width: CustomSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall!),
            ],
          )
        ),
      ),
    );
  }
}