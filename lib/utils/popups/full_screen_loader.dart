import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';
import 'package:quick_shop_app/utils/loaders/animation_loader.dart';

/// Utility Class for managing Full Screen Loading
class CustomFullScreenLoader{
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: CustomHelperFunctions.isDarkMode(Get.context!) ? Colors.black : Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              CustomAnimationLoaderWidget(text: text, animation: animation)
            ]
          ),
        ),
      )
    );
  }

  /// Close the Full Screen Loading Dialog
  static void closeLoadingDialog() {
    Navigator.of(Get.overlayContext!).pop();
  }
}