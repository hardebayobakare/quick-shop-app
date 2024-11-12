import 'package:flutter/material.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';

class CustomElevatedButtonTheme {
  CustomElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: CustomColors.primaryColor,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey.withOpacity(0.5),
      side: const BorderSide(color: CustomColors.primaryColor),
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      textStyle: const TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: CustomColors.primaryColor,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey.withOpacity(0.5),
      side: const BorderSide(color: CustomColors.primaryColor),
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      textStyle: const TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    ),
  );
}