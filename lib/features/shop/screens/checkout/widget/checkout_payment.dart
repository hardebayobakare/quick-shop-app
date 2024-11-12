import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/rounded_container.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomBillingPaymentSection extends StatelessWidget {
  const CustomBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        CustomSectionHeading(
          title: 'Payment Method', 
          buttonTitle: 'Change',
          onButtonPressed: () {},
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems / 2),
        Row(
          children: [
            CustomRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? CustomColors.light : CustomColors.white,
              padding: const EdgeInsets.all(CustomSizes.sm),
              child: const Image(image: AssetImage(CustomImages.paypal), fit: BoxFit.contain),
            ),
            const SizedBox(width: CustomSizes.spaceBtwItems),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge),
          ],
        )
      ],
    );
  }
}