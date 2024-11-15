import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/features/authentication/controllers/password_configuration/forget_password_controller.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/validators/validation.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Column(
          children: [
            // Heading
            Text(CustomTextStrings.forgetPassowrdTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: CustomSizes.spaceBtwItems),
            Text(CustomTextStrings.forgetPassowrdSubtitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: CustomSizes.spaceBtwSections * 2),

            // Text 
            Form(
              key: controller.forgetPasswordFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.email,
                    validator: CustomValidator.validateEmail,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),                  
                      ),
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: CustomTextStrings.email,
                    ),
                  ),
                  const SizedBox(height: CustomSizes.spaceBtwSections),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => controller.sendPasswordResetEmail(),
                      child: const Text(CustomTextStrings.submit),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}