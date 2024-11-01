import 'package:flutter/material.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomLoginHeader extends StatelessWidget {
  const CustomLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(dark ? CustomImages.darkAppLogo : CustomImages.lightAppLogo),
        ),
        Text(CustomTextStrings.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: CustomSizes.sm),
        Text(CustomTextStrings.loginSubtitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}