import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/features/authentication/screens/signup/verify_email.dart';
import 'package:quick_shop_app/features/authentication/screens/signup/widgets/terms_and%20_condition.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';


class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return Form(
      child: Column(
        children: [
          // First Name and Last Name
          Row(children: [
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: CustomTextStrings.firstName,
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            ),
            const SizedBox(width: CustomSizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: CustomTextStrings.lastName,
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            )
          ],),
          const SizedBox(height: CustomSizes.spaceBtwInputFields),
          // Username
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: CustomTextStrings.userName,
              prefixIcon: Icon(Iconsax.user),
            ),
          ),
          const SizedBox(height: CustomSizes.spaceBtwInputFields),
          // Email
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: CustomTextStrings.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: CustomSizes.spaceBtwInputFields),
          // Phone Number
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: CustomTextStrings.phoneNumber,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: CustomSizes.spaceBtwInputFields),
          // Password
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: CustomTextStrings.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
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
              onPressed: () => Get.to(() => const VerifyEmailScreen()),
              child: const Text(CustomTextStrings.createAccount),
            ),
          ),
        ],
      )
    );
  }
}

