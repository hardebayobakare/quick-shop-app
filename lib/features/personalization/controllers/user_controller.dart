import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/data/repositories/authentication/authentication_repository.dart';
import 'package:quick_shop_app/data/repositories/user/user_repository.dart';
import 'package:quick_shop_app/features/authentication/screens/login/login.dart';
import 'package:quick_shop_app/features/personalization/models/user_model.dart';
import 'package:quick_shop_app/features/personalization/screens/profile/widgets/reauth_user.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/helpers/network_manager.dart';
import 'package:quick_shop_app/utils/popups/full_screen_loader.dart';
import 'package:quick_shop_app/utils/popups/loaders.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = true.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch User Record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fecthUserData();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
      CustomLoaders.warningSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save User Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentals) async {
    // Save User Record
    try {
      if (userCredentals != null) {
        final nameParts = UserModel.nameParts(userCredentals.user!.displayName ?? '');
        final username = UserModel.generateUsername(userCredentals.user!.displayName ?? '');

        // Map Data
        final user = UserModel(
          id: userCredentals.user!.uid,
          email: userCredentals.user!.email ?? '',
          userName: username,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(" ") : '',
          profilePicture: userCredentals.user!.photoURL ?? '',
          phoneNumber: userCredentals.user!.phoneNumber ?? '',

        );

        // Save User Record
        await UserRepository.instance.saveUserDetails(user);        
      }

    } catch (e) {
      CustomLoaders.warningSnackBar(title: CustomTextStrings.dataNotSaved, message: CustomTextStrings.dataNotSavedMessage);
    }
  }

  // Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(CustomSizes.md),
      title: CustomTextStrings.deleteAccount,
      middleText: CustomTextStrings.deleteAccountMessage,
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ), 
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: CustomSizes.lg),
          child: Text(CustomTextStrings.delete),
        )
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(), 
        child: const Text(CustomTextStrings.cancel)
      )
    );
  }

  // Delete User Account
  void deleteUserAccount() async {
    try {
      // Start Loading
      CustomFullScreenLoader.openLoadingDialog(CustomTextStrings.processing, CustomImages.dataProcess);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CustomFullScreenLoader.closeLoadingDialog();
        return;
      }

      // First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        // Re Verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          CustomFullScreenLoader.closeLoadingDialog();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          CustomFullScreenLoader.closeLoadingDialog();
          Get.to(() => const ReAuthLoginForm());
        }
      }

    } catch (e) {
      CustomFullScreenLoader.closeLoadingDialog();
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
    }
  }

  // Re-Authenticate User before Deleting Account
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      // Start Loading
      CustomFullScreenLoader.openLoadingDialog(CustomTextStrings.verifyingAccount, CustomImages.dataProcess);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CustomFullScreenLoader.closeLoadingDialog();
        return;
      }

      // Validate Form
      if (!reAuthFormKey.currentState!.validate()) {
        CustomFullScreenLoader.closeLoadingDialog();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateEmailAndPasswordUser(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      // Close Loading
      CustomFullScreenLoader.closeLoadingDialog();

      // Show Success Message
      CustomLoaders.successSnackBar(title: CustomTextStrings.success, message: CustomTextStrings.accountDeleted);

      Get.offAll(() => const LoginScreen());

    } catch (e) {
      CustomFullScreenLoader.closeLoadingDialog();
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
    }
  }


}