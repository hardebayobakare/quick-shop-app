import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomTermsandConditionCheckbox extends StatelessWidget {
  const CustomTermsandConditionCheckbox({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
          width:24, 
          height: 24, 
          child: Obx(() => Checkbox(
            value: controller.privacyPolicy.value, 
            onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value)
          )
        ),
        const SizedBox(width: CustomSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${CustomTextStrings.iAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall
              ),
              TextSpan(
                text: CustomTextStrings.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? Colors.white : CustomColors.primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: dark? Colors.white : CustomColors.primaryColor
                )
              ),
              TextSpan(
                text: ' ${CustomTextStrings.and} ',
                style: Theme.of(context).textTheme.bodySmall
              ),
              TextSpan(
                text: CustomTextStrings.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? Colors.white : CustomColors.primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: dark? Colors.white : CustomColors.primaryColor
                )
              ),
            ]
          )
        ),
      ],
    );
  }
}