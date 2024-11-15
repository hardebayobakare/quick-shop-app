import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/features/authentication/controllers/login/login_controller.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: CustomColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              image: AssetImage(CustomImages.google),
              height: CustomSizes.iconMd,
              width: CustomSizes.iconMd,
            ),
          ),
        ),
        const SizedBox(width: CustomSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: CustomColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(CustomImages.facebook),
              height: CustomSizes.iconMd,
              width: CustomSizes.iconMd,
            ),
          ),
        ),
      ],
    );
  }
}
