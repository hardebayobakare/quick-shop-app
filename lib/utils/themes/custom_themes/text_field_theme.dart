import 'package:flutter/material.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';

class CustomTextFormFieldTheme {
  CustomTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,

    labelStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black),
    hintStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 1, color: CustomColors.grey),
      borderRadius: BorderRadius.circular(14.0),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 1, color: CustomColors.grey),
      borderRadius: BorderRadius.circular(14.0),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 1, color: CustomColors.dark),
      borderRadius: BorderRadius.circular(14.0),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 1, color: CustomColors.warning),
      borderRadius: BorderRadius.circular(14.0),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 2, color: CustomColors.warning),
      borderRadius: BorderRadius.circular(14.0),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,

    labelStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.white),
    hintStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.white),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 1, color: CustomColors.darkGrey),
      borderRadius: BorderRadius.circular(14.0),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 1, color: CustomColors.darkGrey),
      borderRadius: BorderRadius.circular(14.0),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 1, color: CustomColors.white),
      borderRadius: BorderRadius.circular(14.0),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 1, color: CustomColors.warning),
      borderRadius: BorderRadius.circular(14.0),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 2, color: CustomColors.warning),
      borderRadius: BorderRadius.circular(14.0),
    ),
  );
}