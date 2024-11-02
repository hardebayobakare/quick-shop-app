import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/form_divider.dart';
import 'package:quick_shop_app/common/widgets/social_buttons.dart';
import 'package:quick_shop_app/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Title
              Text(CustomTextStrings.signUpTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: CustomSizes.spaceBtwSections),
              // Form
              const CustomSignUpForm(),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              // Divider
              const CustomFormDivider(dividerText: CustomTextStrings.orSignUpWith),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              // Social Buttons
              const CustomSocialButton()

            ],
          )
          
        )
      )
    );
  }
}

