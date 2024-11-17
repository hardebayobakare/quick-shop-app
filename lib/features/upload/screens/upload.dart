import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/common/widgets/settings_menu_tile.dart';
import 'package:quick_shop_app/features/upload/controllers/upload_controller.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class UploadDataScreen extends StatelessWidget {
  const UploadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploadDataController());
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Upload Data'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              const CustomSectionHeading(title: 'Main Records', showActionButton: false),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              CustomSettingsMenuTile(
                icon: Iconsax.grid_eraser4,
                title: 'Upload Categories',
                trailing: const Icon(Iconsax.arrow_up_1),
                onTap: () => controller.uploadCategories(),
              ),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              const CustomSettingsMenuTile(
                icon: Iconsax.shop,
                title: 'Upload Brands',
                trailing: Icon(Iconsax.arrow_up_1),
              ),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              CustomSettingsMenuTile(
                icon: Iconsax.shopping_cart,
                title: 'Upload Products',
                trailing: const Icon(Iconsax.arrow_up_1),
                onTap: () => controller.uploadProducts(),
              ),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              CustomSettingsMenuTile(
                icon: Iconsax.image,
                title: 'Upload Banners',
                trailing: const Icon(Iconsax.arrow_up_1),
                onTap: () => controller.uploadBanners(),
              ),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              const CustomSectionHeading(title: 'Relationships', showActionButton: false),
              Text(
                'Make sure you have uploaded all the contents above before proceeding',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              const CustomSettingsMenuTile(
                icon: Iconsax.link,
                title: 'Upload Brands and Categories Relations Data',
                trailing: Icon(Iconsax.arrow_up_1),
              ),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              const CustomSettingsMenuTile(
                icon: Iconsax.link,
                title: 'Upload Product Categories Relation Data',
                trailing: Icon(Iconsax.arrow_up_1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}