
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/features/personalization/controllers/user_controller.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Re-authenticate Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Form(
          key: controller.reAuthFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.verifyEmail,
                validator: (value) => CustomValidator.validateEmail(value),
                expands: false,
                decoration: const InputDecoration(labelText: CustomTextStrings.email, prefixIcon: Icon(Iconsax.direct_right)),
              ),
              const SizedBox(height: CustomSizes.spaceBtwInputFields),
              Obx(() => TextFormField(
                controller: controller.verifyPassword,
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
              )
            ),

            const SizedBox(height: CustomSizes.spaceBtwSections),
            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.reAuthenticateEmailAndPasswordUser(),
                child: const Text(CustomTextStrings.signIn),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}