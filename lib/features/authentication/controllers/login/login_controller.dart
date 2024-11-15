import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quick_shop_app/data/repositories/authentication/authentication_repository.dart';
import 'package:quick_shop_app/features/personalization/controllers/user_controller.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/helpers/network_manager.dart';
import 'package:quick_shop_app/utils/popups/full_screen_loader.dart';
import 'package:quick_shop_app/utils/popups/loaders.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();
  
  final localStorage = GetStorage();
  final hidePassword = true.obs;
  final remeberMe = false.obs;  
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final userController = Get.put(UserController());

  @override
  void onInit() {
    super.onInit();
    if (localStorage.read('REMEMBER_ME') != null) {
      if (localStorage.read('REMEMBER_ME') == true) {
        remeberMe.value = localStorage.read('REMEMBER_ME');
        email.text = localStorage.read('REMEMBER_ME_EMAIL');
        password.text = localStorage.read('REMEMBER_ME_PASSWORD');
      }
    }
  }

  Future<void> login() async {
    try{
      // Start Loading
      CustomFullScreenLoader.openLoadingDialog(CustomTextStrings.logginIn, CustomImages.dataProcess);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CustomFullScreenLoader.closeLoadingDialog();
        return;
      }

      // Validate Form
      if (!loginFormKey.currentState!.validate()) {
        CustomFullScreenLoader.closeLoadingDialog();
        return;
      }

      // Save Data if Remember Me is checked
      if (remeberMe.value) {
        localStorage.write('REMEMBER_ME', true);
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      } else {
        if (localStorage.read('REMEMBER_ME') != null) {
          localStorage.remove('REMEMBER_ME');
          localStorage.remove('REMEMBER_ME_EMAIL');
          localStorage.remove('REMEMBER_ME_PASSWORD');
        }
      }

      // Login User with Email and Password
      await AuthenticationRepository.instance.loginWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // Success Message
      CustomLoaders.successSnackBar(title: CustomTextStrings.success, message: CustomTextStrings.loggedIn);

      // Close Loading
      CustomFullScreenLoader.closeLoadingDialog();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      CustomFullScreenLoader.closeLoadingDialog();
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      // Start Loading
      CustomFullScreenLoader.openLoadingDialog(CustomTextStrings.logginIn, CustomImages.dataProcess);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CustomFullScreenLoader.closeLoadingDialog();
        return;
      }

      // Sign In with Google
      final userCredentals = await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Record
      await userController.saveUserRecord(userCredentals);

      // Remove Loading
      CustomFullScreenLoader.closeLoadingDialog();

      // Success Message
      CustomLoaders.successSnackBar(title: CustomTextStrings.success, message: CustomTextStrings.loggedIn);

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      CustomFullScreenLoader.closeLoadingDialog();
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
    }
  }
}