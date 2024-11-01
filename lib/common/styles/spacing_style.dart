import 'package:flutter/material.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class CustomSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: CustomSizes.appBarHeight,
    left: CustomSizes.defaultSpace,
    right: CustomSizes.defaultSpace,
    bottom: CustomSizes.defaultSpace,
  );
}