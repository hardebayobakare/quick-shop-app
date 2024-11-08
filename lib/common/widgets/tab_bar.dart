import 'package:flutter/material.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/device/device_utitlty.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;


  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Material(
      child: TabBar(
        isScrollable: true,
        indicatorColor: CustomColors.primaryColor,
        unselectedLabelColor: CustomColors.darkGrey,
        labelColor: dark ? CustomColors.white : CustomColors.primaryColor,
        tabs: tabs,
      ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight());


}