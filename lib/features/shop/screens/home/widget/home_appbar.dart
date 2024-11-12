import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/common/widgets/products/carts/cart.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      showBackArrow: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(CustomTextStrings.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: CustomColors.grey)),
          Text(CustomTextStrings.homeAppbarSubtitle, style: Theme.of(context).textTheme.labelSmall!.apply(color: CustomColors.white)),
        ]
      ),
      actions: const [
        CustomCartCounterIcon(
          iconColor: CustomColors.white,
        ),
      ],
    );
  }
}
