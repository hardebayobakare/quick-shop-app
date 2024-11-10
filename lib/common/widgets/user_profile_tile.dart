import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/circular_image.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';

class CustomUserProfileTile extends StatelessWidget {
  const CustomUserProfileTile({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CustomCircularImage(
        image: CustomImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        'Adebayo Bakare',
        style: Theme.of(context).textTheme.headlineSmall!.apply(color: CustomColors.white),
      ),
      subtitle: Text(
        'hardebayo@binfotech.ca',
        style: Theme.of(context).textTheme.bodyMedium!.apply(color: CustomColors.white),
      ),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: CustomColors.white)),
    );
  }
}