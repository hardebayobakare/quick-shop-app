import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/menu/navigation_menu.dart';
import 'package:quick_shop_app/common/widgets/rounded_container.dart';
import 'package:quick_shop_app/features/shop/controllers/product/order_controller.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/helpers/cloud_helper_functions.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';
import 'package:quick_shop_app/utils/loaders/animation_loader.dart';

class CustomOrderListItems extends StatelessWidget {
  const CustomOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    final controller = Get.put(OrderController());
    return FutureBuilder(
      future: controller.fetchUserOrders(),
      builder: (_, snapshot) {
        final emptyWidget = CustomAnimationLoaderWidget(
          text: CustomTextStrings.noOrders, 
          animation: CustomImages.emptyOrders,
          actionText: CustomTextStrings.startShopping,
          showAction: true,
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        final widget = CustomCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, nothingFound: emptyWidget);
        if (widget != null) return widget;

        final orders = snapshot.data!;

        return ListView.separated(
          shrinkWrap: true,
          itemCount: orders.length,
          separatorBuilder: (context, index) => const SizedBox(height: CustomSizes.spaceBtwItems),
          itemBuilder: (_, index) {
            final order = orders[index];
            return CustomRoundedContainer(
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
                          Text(order.orderStatusText, style: Theme.of(context).textTheme.bodyLarge!.apply(color: CustomColors.primaryColor, fontWeightDelta: 1)),
                          Text(order.formattedOrderDate, style: Theme.of(context).textTheme.headlineSmall)
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
                                Text(CustomTextStrings.order, style: Theme.of(context).textTheme.labelMedium),
                                Text(order.id, style: Theme.of(context).textTheme.titleMedium)
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
                                Text(
                                  CustomTextStrings.shippingDate, 
                                  style: Theme.of(context).textTheme.labelMedium),
                                Text(
                                  order.formattedDeliveryDate, 
                                  style: Theme.of(context).textTheme.titleMedium!.apply(color: order.formattedDeliveryDate == CustomTextStrings.unavailable ? CustomColors.error : CustomColors.primaryColor)
                                ),
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
          );}
        );
      }
    );
  }
}