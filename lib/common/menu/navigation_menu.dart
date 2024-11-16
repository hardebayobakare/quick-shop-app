import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/features/personalization/screens/settings/settings.dart';
import 'package:quick_shop_app/features/shop/screens/home/home.dart';
import 'package:quick_shop_app/features/shop/screens/store/store.dart';
import 'package:quick_shop_app/features/shop/screens/wishlist/wishlist.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({
    super.key,
    this.initialIndex = 0,
  });

  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController(initialIndex: initialIndex));
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(() => 
        NavigationBar(
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.onDestinationSelected(index),
          backgroundColor: dark ? CustomColors.black : Colors.white,
          indicatorColor: dark ? CustomColors.white.withOpacity(0.1) : CustomColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "home"),
            NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
            NavigationDestination(icon: Icon(Iconsax.heart), label: "Wishlist"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
          ]
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex;

  NavigationController({int initialIndex = 0}) : selectedIndex = Rx<int>(initialIndex);

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];


  void onDestinationSelected(int index) {
    selectedIndex.value = index;
  }
}