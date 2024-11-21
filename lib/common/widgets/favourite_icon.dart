
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/circular_icon.dart';
import 'package:quick_shop_app/features/shop/controllers/favourite_controller.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';

class CustomFavouriteIcon extends StatelessWidget {
  const CustomFavouriteIcon({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Obx(() =>
        CustomCircularIcon(
        icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(productId) ? CustomColors.error : null,
        onPressed: () => controller.toggleFavourite(productId),
      ),
    );
  }
}