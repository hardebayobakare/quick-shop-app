import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/menu/navigation_menu.dart';
import 'package:quick_shop_app/data/repositories/user/user_repository.dart';
import 'package:quick_shop_app/features/personalization/controllers/user_controller.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/helpers/network_manager.dart';
import 'package:quick_shop_app/utils/popups/full_screen_loader.dart';
import 'package:quick_shop_app/utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final updateUserNameFormKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    initializedNames();
  }

  Future<void> initializedNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  void updateName() async {
    try {
      // Start Loading
      CustomFullScreenLoader.openLoadingDialog(CustomTextStrings.updatingInformation, CustomImages.dataProcess);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CustomFullScreenLoader.closeLoadingDialog();
        return;
      }

      // Validate Form
      if (!updateUserNameFormKey.currentState!.validate()) {
        CustomFullScreenLoader.closeLoadingDialog();
        return;
      }

      // Update user's first and last name in the Firebase
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim(),
      };
      await userRepository.updateUserField(name);

      // Update User Value on Rx state management
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Close Loading
      CustomFullScreenLoader.closeLoadingDialog();

      // Show Success Message
      CustomLoaders.successSnackBar(title: CustomTextStrings.success, message: CustomTextStrings.nameUpdated);

      // Redirect to Profile Screen
      Get.offAll(() => const NavigationMenu(initialIndex: 3));

    } catch (e) {
      CustomFullScreenLoader.closeLoadingDialog();
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
    }
  }
}