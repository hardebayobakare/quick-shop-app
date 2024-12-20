import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/styles/spacing_style.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CustomSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              // Image
              Image(image: AssetImage(image), width: CustomHelperFunctions.screenWidth() * 0.6,),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              // Title and subtitle
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              Text(subtitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              // Button
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onPressed, child: const Text(CustomTextStrings.toContinue))),
            ],
          ),
        )
      ),
    );
  }
}