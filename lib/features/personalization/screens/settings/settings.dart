import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/common/widgets/primary_header_container.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/common/widgets/settings_menu_tile.dart';
import 'package:quick_shop_app/common/widgets/user_profile_tile.dart';
import 'package:quick_shop_app/data/repositories/authentication/authentication_repository.dart';
import 'package:quick_shop_app/features/personalization/screens/address/address.dart';
import 'package:quick_shop_app/features/personalization/screens/profile/profile.dart';
import 'package:quick_shop_app/features/shop/screens/cart/cart.dart';
import 'package:quick_shop_app/features/shop/screens/order/order.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            CustomPrimaryHeaderContainer(
              child: Column(
                children: [
                  // App Bar
                  CustomAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context).textTheme.headlineMedium!.apply(color: CustomColors.white),
                    ),
                  ),
  
                  // Profile
                  CustomUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen()),),
                  const SizedBox(height: CustomSizes.spaceBtwSections),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(CustomSizes.defaultSpace),
              child: Column(
                children: [
                  // Account Settings
                  const CustomSectionHeading(title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: CustomSizes.spaceBtwItems),
                  CustomSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subtitle: 'Set shipping delivery address',
                    onTap: () => Get.to(() => const AddressesScreen()),
                  ),
                  CustomSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subtitle: 'Add, remove or view items in cart',
                    onTap: () => Get.to(() => const CartScreen()),
                  ),
                  CustomSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subtitle: 'View your order history',
                    onTap: () => Get.to(() => const OrdersScreen()),
                  ),
                  CustomSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'Payment Methods',
                    subtitle: 'Manage your payment methods',
                    onTap: () {},
                  ),
                  CustomSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subtitle: 'View and redeem your coupons',
                    onTap: () {},
                  ),
                  CustomSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subtitle: 'Manage your notifications',
                    onTap: () {},
                  ),
                  CustomSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subtitle: 'Manage data usage and connected accounts',
                    onTap: () {},
                  ),

                  // App Settings
                  const SizedBox(height: CustomSizes.spaceBtwSections),
                  const CustomSectionHeading(title: 'App Settings', showActionButton: false),
                  const SizedBox(height: CustomSizes.spaceBtwItems),
                  CustomSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subtitle: 'Upload data from your device',
                    onTap: () {},
                  ),
                  CustomSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'Set recommendations based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  CustomSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subtitle: 'Search result is safe for all ages',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  CustomSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subtitle: 'Set image quality to high definition',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  // Logout Button
                  const SizedBox(height: CustomSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => AuthenticationRepository.instance.logout(),
                      child: const Text('Logout'),
                    ),
                  ),
                  const SizedBox(height: CustomSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}