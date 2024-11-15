import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:quick_shop_app/features/authentication/screens/signup/widgets/terms_and%20_condition.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/validators/validation.dart';


class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          // First Name and Last Name
          Row(children: [
            Expanded(
              child: TextFormField(
                controller: controller.firstName,
                validator: (value) => CustomValidator.validateText("First Name", value),
                expands: false,
                decoration: const InputDecoration(
                  labelText: CustomTextStrings.firstName,
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            ),
            const SizedBox(width: CustomSizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
                controller: controller.lastName,
                validator: (value) => CustomValidator.validateText("Last Name", value),
                expands: false,
                decoration: const InputDecoration(
                  labelText: CustomTextStrings.lastName,
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            )
          ],),
          const SizedBox(height: CustomSizes.spaceBtwInputFields),
          // Username
          TextFormField(
            controller: controller.username,
            validator: (value) => CustomValidator.validateOtherText("Username", value),
            expands: false,
            decoration: const InputDecoration(
              labelText: CustomTextStrings.userName,
              prefixIcon: Icon(Iconsax.user),
            ),
          ),
          const SizedBox(height: CustomSizes.spaceBtwInputFields),
          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) => CustomValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
              labelText: CustomTextStrings.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: CustomSizes.spaceBtwInputFields),
          // Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => CustomValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(
              labelText: CustomTextStrings.phoneNumber,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: CustomSizes.spaceBtwInputFields),
          // Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => CustomValidator.validatePassword(value),
              expands: false,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: CustomTextStrings.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                ),
              ),
            ),
          ),
          const SizedBox(height: CustomSizes.spaceBtwSections),
    
          // Terms and Conditions checkbox
          const CustomTermsandConditionCheckbox(),
          const SizedBox(height: CustomSizes.spaceBtwSections),
          // Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signUp(),
              child: const Text(CustomTextStrings.createAccount),
            ),
          ),
        ],
      )
    );
  }
}

