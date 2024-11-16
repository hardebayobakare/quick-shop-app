import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/circular_image.dart';
import 'package:quick_shop_app/features/personalization/controllers/user_controller.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/loaders/shimmer.dart';

class CustomUserProfileTile extends StatelessWidget {
  const CustomUserProfileTile({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
          final networkImage  = controller.user.value.profilePicture;
          final image = networkImage.isNotEmpty ? networkImage : CustomImages.user;
          return controller.imageUploading.value 
            ? const CustomShimmerEffect(width: 80, height: 80, radius: 80,)
            : CustomCircularImage(image: image, width: 50, height: 50, padding: 0, isNetworkImage: networkImage.isNotEmpty);
        }),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context).textTheme.headlineSmall!.apply(color: CustomColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style: Theme.of(context).textTheme.bodyMedium!.apply(color: CustomColors.white),
      ),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: CustomColors.white)),
    );
  }
}