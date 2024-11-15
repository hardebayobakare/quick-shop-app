import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quick_shop_app/data/repositories/authentication/authentication_repository.dart';
import 'package:quick_shop_app/data/repositories/user/user_repository.dart';
import 'package:quick_shop_app/features/authentication/screens/signup/verify_email.dart';
import 'package:quick_shop_app/features/personalization/models/user_model.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/helpers/network_manager.dart';
import 'package:quick_shop_app/utils/popups/full_screen_loader.dart';
import 'package:quick_shop_app/utils/popups/loaders.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();

  // Variables
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    try {
      // Start Loader
      CustomFullScreenLoader.openLoadingDialog(CustomTextStrings.loadingProcess, CustomImages.dataProcess);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CustomFullScreenLoader.closeLoadingDialog();      
        return;
      }

      // Validate Form
      if (!signupFormKey.currentState!.validate()) {
        CustomFullScreenLoader.closeLoadingDialog();
        return;
      }

      // Privacy Plolicy and Terms and Conditions check
      if (!privacyPolicy.value) {
        CustomLoaders.warningSnackBar(title: CustomTextStrings.acceptPolicy, message: CustomTextStrings.acceptTermsAndConditions);
        return;
      }

      // Register user in the Firebase Authentication & Save User detail in the Firestore
      final userCredentials = await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // Save User Detail in the Firestore
      final newUser = UserModel(
        id: userCredentials.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserDetails(newUser);

      // Close Loader
      CustomFullScreenLoader.closeLoadingDialog();

      // Show Success message to user
      CustomLoaders.successSnackBar(title: CustomTextStrings.success, message: CustomTextStrings.accountCreated);

      // Move to Email Varification Page
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));

    } catch (e) {
      CustomFullScreenLoader.closeLoadingDialog();

      // Show Generic Error message to user
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());

    }
  }
}