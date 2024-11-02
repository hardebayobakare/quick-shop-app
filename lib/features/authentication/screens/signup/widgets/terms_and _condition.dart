import 'package:flutter/material.dart';
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
    return Row(
      children: [
        SizedBox(width:24, height: 24, child:Checkbox(value: true, onChanged: (value) {})),
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
                text: CustomTextStrings.termsOfService,
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