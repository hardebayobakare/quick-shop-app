import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/features/authentication/screens/login/login.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [

              Image(image: const AssetImage(CustomImages.successVerification), width: CustomHelperFunctions.screenWidth() * 0.6,),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              // Title and subtitle
              Text(CustomTextStrings.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              Text(CustomTextStrings.changeYourPasswordSubtitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              // Button
              SizedBox(
                width: double.infinity, 
                child: ElevatedButton(
                  onPressed: () => Get.off(() => const LoginScreen()), 
                  child: const Text(CustomTextStrings.done)
                )
              ),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              TextButton(
                onPressed: () => Get.off(() => const LoginScreen()), 
                child: const Text(CustomTextStrings.resendEmail)
              )
            ],
          ),
        ),
      ),
    );
  }
}