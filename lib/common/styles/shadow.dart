import 'package:flutter/material.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';

class CustomShadowStyle {
  CustomShadowStyle._();

  static final verticalProductShadow = BoxShadow(
    color: CustomColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: CustomColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}