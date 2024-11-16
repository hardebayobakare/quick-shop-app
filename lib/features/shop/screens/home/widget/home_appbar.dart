import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/common/widgets/products/carts/cart.dart';
import 'package:quick_shop_app/features/personalization/controllers/user_controller.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/loaders/shimmer.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return CustomAppBar(
      showBackArrow: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(CustomTextStrings.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: CustomColors.grey)),
          Obx (() {
            if(controller.profileLoading.value) {
              return const CustomShimmerEffect(width: 80, height: 15);
            } else {
              return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.labelSmall!.apply(color: CustomColors.white));
            }
          }),
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
