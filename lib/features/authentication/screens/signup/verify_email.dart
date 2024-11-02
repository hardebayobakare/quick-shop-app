import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/widgets/success_screen.dart';
import 'package:quick_shop_app/features/authentication/screens/login/login.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.clear),
            onPressed: () => Get.offAll(() => const LoginScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image(image: const AssetImage(CustomImages.emailVerification), width: CustomHelperFunctions.screenWidth() * 0.6,),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              // Title and subtitle
              Text(CustomTextStrings.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              Text('support@binfotech.ca', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              Text(CustomTextStrings.confirmEmailSubtitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              // Buttons
              SizedBox(
                width: double.infinity, 
                child: ElevatedButton(
                  onPressed: () => Get.to(SuccessScreen(
                    image: CustomImages.successVerification,
                    title: CustomTextStrings.yourAccountCreatedTitle,
                    subtitle: CustomTextStrings.yourAccountCreatedSubtitle,
                    onPressed: () => Get.offAll(() => const LoginScreen()))), 
                  child: const Text(CustomTextStrings.toContinue))),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              SizedBox(width: double.infinity, child: TextButton(onPressed: () {}, child: const Text(CustomTextStrings.resendEmail)))

            ],
          ),
        ),
      )
    );
  }
}