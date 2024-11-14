import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/rounded_container.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomOrderListItems extends StatelessWidget {
  const CustomOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 7,
      separatorBuilder: (context, index) => const SizedBox(height: CustomSizes.spaceBtwItems),
      itemBuilder: (_, index) => CustomRoundedContainer(
        showborder: true,
        backgroundColor: dark ? CustomColors.dark : CustomColors.light,
        padding: const EdgeInsets.all(CustomSizes.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Order Item
            Row(
              children: [
                const Icon(Iconsax.ship),
                const SizedBox(width: CustomSizes.spaceBtwItems / 2),
      
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Processing', style: Theme.of(context).textTheme.bodyLarge!.apply(color: CustomColors.primaryColor, fontWeightDelta: 1)),
                      Text('07 Nov, 2024', style: Theme.of(context).textTheme.headlineSmall)
                    ],
                  ),
                ),
      
                IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_right_34, size: CustomSizes.iconSm))
              ],
            ),
            const SizedBox(height: CustomSizes.spaceBtwItems),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.tag),
                      const SizedBox(width: CustomSizes.spaceBtwItems / 2),
                      
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Order', style: Theme.of(context).textTheme.labelMedium),
                            Text('[#25f5s]', style: Theme.of(context).textTheme.titleMedium)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: CustomSizes.spaceBtwItems / 2),
                      
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Shipping Date', style: Theme.of(context).textTheme.labelMedium),
                            Text('10 Nov, 2024', style: Theme.of(context).textTheme.titleMedium)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ]
        )
      ),
    );
  }
}