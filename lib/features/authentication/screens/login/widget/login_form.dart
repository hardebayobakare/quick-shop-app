import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/features/authentication/controllers/login/login_controller.dart';
import 'package:quick_shop_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:quick_shop_app/features/authentication/screens/signup/signup.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/validators/validation.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form (
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: CustomSizes.spaceBtwSections),
        child: Column(
          children: [
            //Email
            TextFormField(
              controller: controller.email,
              validator: (value) => CustomValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: CustomTextStrings.email,
              ),
            ),
            const SizedBox(height: CustomSizes.spaceBtwInputFields),
            //Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => CustomValidator.validateOtherText("Password", value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: CustomTextStrings.password,
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                  ),
                ),
              ),
            ),
            const SizedBox(height: CustomSizes.spaceBtwInputFields / 2),
        
            /// Remeber me and Forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember me
                Row(
                  children: [
                    Obx (() => Checkbox(value: controller.remeberMe.value, onChanged: (value) => controller.remeberMe.value = !controller.remeberMe.value)),
                    const Text(CustomTextStrings.rememberMe)
                  ],
                ),
                // Forgot password
                TextButton(onPressed: () => Get.to(const ForgetPassword()), child: const Text(CustomTextStrings.forgotPassword))
              ],
            ),
            const SizedBox(height: CustomSizes.spaceBtwSections),
        
            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.login(),
                child: const Text(CustomTextStrings.signIn),
              ),
            ),
            const SizedBox(height: CustomSizes.spaceBtwItems),
            // Create account button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(CustomTextStrings.createAccount),
              ),
            ),
            const SizedBox(height: CustomSizes.spaceBtwSections),
          ]
        ),
      ),
    );
  }
}

