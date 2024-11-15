import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/data/repositories/authentication/authentication_repository.dart';
import 'package:quick_shop_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/helpers/network_manager.dart';
import 'package:quick_shop_app/utils/popups/full_screen_loader.dart';
import 'package:quick_shop_app/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      // Start Loading
      CustomFullScreenLoader.openLoadingDialog(CustomTextStrings.sendingEmail, CustomImages.dataProcess);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CustomFullScreenLoader.closeLoadingDialog();
        return;
      }

      // Validate Form
      if (!forgetPasswordFormKey.currentState!.validate()) {
        CustomFullScreenLoader.closeLoadingDialog();
        return;
      }

      // Send Password Reset Email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Close Loading
      CustomFullScreenLoader.closeLoadingDialog();

      // Show Success Message
      CustomLoaders.successSnackBar(title: CustomTextStrings.emailSent, message: CustomTextStrings.resetPasswordEmailSent);

      // Redirect to Reset Password Screen
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      CustomFullScreenLoader.closeLoadingDialog();
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      CustomFullScreenLoader.openLoadingDialog(CustomTextStrings.sendingEmail, CustomImages.dataProcess);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CustomFullScreenLoader.closeLoadingDialog();
        return;
      }

      // Send Password Reset Email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Close Loading
      CustomFullScreenLoader.closeLoadingDialog();

      // Show Success Message
      CustomLoaders.successSnackBar(title: CustomTextStrings.emailSent, message: CustomTextStrings.resetPasswordEmailSent);

    } catch (e) {
      CustomFullScreenLoader.closeLoadingDialog();
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
    }
  }
}