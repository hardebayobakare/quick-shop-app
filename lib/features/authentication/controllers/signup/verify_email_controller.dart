import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/widgets/success_screen.dart';
import 'package:quick_shop_app/data/repositories/authentication/authentication_repository.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();


  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification Link
  Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      CustomLoaders.successSnackBar(title: CustomTextStrings.emailVerificationSent, message: CustomTextStrings.checkEmail);
    } catch (e) {
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
    }
  }

  /// Set Timer for Auto Redirect
  setTimerForAutoRedirect()  {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        CustomLoaders.successSnackBar(title: CustomTextStrings.emailVerified, message: CustomTextStrings.accountCreated);
        Get.off(() => SuccessScreen(
          image: CustomImages.successVerification, 
          title: CustomTextStrings.yourAccountCreatedTitle, 
          subtitle: CustomTextStrings.yourAccountCreatedSubtitle, 
          onPressed: () => AuthenticationRepository.instance.screenRedirect())
        );
      }
    });
  }

  /// Manually check if Email is Verified
  checkEmailVerificationStatus() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
        image: CustomImages.successVerification, 
        title: CustomTextStrings.yourAccountCreatedTitle, 
        subtitle: CustomTextStrings.yourAccountCreatedSubtitle, 
        onPressed: () => AuthenticationRepository.instance.screenRedirect())
      );
    }
  }


  
}