import 'package:flutter/material.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class CustomElevatedButtonTheme {
  CustomElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: CustomColors.light,
      backgroundColor: CustomColors.primaryColor,
      disabledForegroundColor: CustomColors.darkGrey,
      disabledBackgroundColor: CustomColors.buttonDisabled,
      side: const BorderSide(color: CustomColors.primaryColor),
      padding: const EdgeInsets.symmetric(vertical: CustomSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16.0, color: CustomColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CustomSizes.buttonRadius)),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: CustomColors.light,
      backgroundColor: CustomColors.primaryColor,
      disabledForegroundColor: CustomColors.darkGrey,
      disabledBackgroundColor: CustomColors.darkerGrey,
      side: const BorderSide(color: CustomColors.primaryColor),
      padding: const EdgeInsets.symmetric(vertical: CustomSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16.0, color: CustomColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CustomSizes.buttonRadius)),
    ),
  );
}