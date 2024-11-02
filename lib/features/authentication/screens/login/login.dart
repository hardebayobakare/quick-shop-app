import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/styles/spacing_style.dart';
import 'package:quick_shop_app/common/widgets/form_divider.dart';
import 'package:quick_shop_app/common/widgets/social_buttons.dart';
import 'package:quick_shop_app/features/authentication/screens/login/widget/login_form.dart';
import 'package:quick_shop_app/features/authentication/screens/login/widget/login_header.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CustomSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: <Widget>[
              // Logo, Title and Subtitle
              CustomLoginHeader(),

              // Form
              CustomLoginForm(),

              // Divider
              CustomFormDivider(dividerText: CustomTextStrings.orSignInWith),
              SizedBox(height: CustomSizes.spaceBtwSections),

              // Footer
              CustomSocialButton()
            ],
          ),
        )
      )
    );
  }
}



