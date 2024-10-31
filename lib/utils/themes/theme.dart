import 'package:flutter/material.dart';
import 'package:quick_shop_app/utils/themes/custom_themes/chip_theme.dart';
import 'package:quick_shop_app/utils/themes/custom_themes/appbar_theme.dart';
import 'package:quick_shop_app/utils/themes/custom_themes/buttom_sheet_theme.dart';
import 'package:quick_shop_app/utils/themes/custom_themes/checkbox_theme.dart';
import 'package:quick_shop_app/utils/themes/custom_themes/elevated_button_theme.dart';
import 'package:quick_shop_app/utils/themes/custom_themes/outline_button_theme.dart';
import 'package:quick_shop_app/utils/themes/custom_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: CustomTextTheme.lightTextTheme,
    chipTheme: CustomChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    checkboxTheme: CustomCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: CustomTextTheme.darkTextTheme,
    chipTheme: CustomChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: CustomAppBarTheme.darkAppBarTheme,
    checkboxTheme: CustomCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
  );
}