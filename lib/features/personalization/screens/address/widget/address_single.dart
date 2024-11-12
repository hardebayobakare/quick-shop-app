import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/rounded_container.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomSingleAddress extends StatelessWidget {
  const CustomSingleAddress({
    super.key,
    required this.selectedAddress,
  });

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return CustomRoundedContainer(
      padding: const EdgeInsets.all(CustomSizes.md),
      width: double.infinity,
      showborder: true,
      backgroundColor: selectedAddress ? CustomColors.primaryColor.withOpacity(0.5) : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? CustomColors.darkerGrey
              : CustomColors.grey,
      margin: const EdgeInsets.only(bottom: CustomSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? CustomColors.light
                      : CustomColors.dark.withOpacity(0.6)
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Adebayo Bakare',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: CustomSizes.sm / 2),
              const Text(' +1 647 123 4567', maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: CustomSizes.sm / 2),
              const Text(
                '1105 - 188, Clark Blvd, Brampton, ON, L6T 0J2',
                softWrap: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}