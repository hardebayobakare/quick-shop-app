import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form (
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: CustomSizes.spaceBtwSections),
        child: Column(
          children: [
            //Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: CustomTextStrings.email,
              ),
            ),
            const SizedBox(height: CustomSizes.spaceBtwInputFields),
            //Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: CustomTextStrings.password,
                suffixIcon: Icon(Iconsax.eye_slash),
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
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(CustomTextStrings.rememberMe)
                  ],
                ),
                // Forgot password
                TextButton(onPressed: () {}, child: const Text(CustomTextStrings.forgotPassword))
              ],
            ),
            const SizedBox(height: CustomSizes.spaceBtwSections),
        
            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(CustomTextStrings.signIn),
              ),
            ),
            const SizedBox(height: CustomSizes.spaceBtwItems),
            // Create account button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                child: const Text(CustomTextStrings.signIn),
              ),
            ),
            const SizedBox(height: CustomSizes.spaceBtwSections),
          ]
        ),
      ),
    );
  }
}

