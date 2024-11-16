import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/common/widgets/circular_image.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/features/personalization/controllers/user_controller.dart';
import 'package:quick_shop_app/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:quick_shop_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/loaders/shimmer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              // Profile Image
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage  = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : CustomImages.user;
                      return controller.imageUploading.value 
                        ? const CustomShimmerEffect(width: 80, height: 80, radius: 80,)
                        : CustomCircularImage(image: image, width: 80, height: 80, isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text('Change Profile Image')),
                  ],
                ),
              ),
              // Profile Details
              const SizedBox(height: CustomSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              
              const CustomSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: CustomSizes.spaceBtwItems),

              CustomProfileMenu(title: 'Full Name', value: controller.user.value.fullName, onPressed: () => Get.to(() => const ChangeName())),
              CustomProfileMenu(title: 'Username', value: controller.user.value.userName, onPressed: () { }, icon: Iconsax.copy),

              const SizedBox(height: CustomSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: CustomSizes.spaceBtwItems),

              const CustomSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: CustomSizes.spaceBtwItems),

              CustomProfileMenu(title: 'E-mail', value: controller.user.value.email, onPressed: () { }),
              CustomProfileMenu(title: 'Phone Number', value: controller.user.value.phoneNumber, onPressed: () { }),
              CustomProfileMenu(title: 'Gender', value: 'Male', onPressed: () { }),
              CustomProfileMenu(title: 'Date of Birth', value: '19, June 1992', onPressed: () { }),
              
              const SizedBox(height: CustomSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: CustomSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(), 
                  child: Text('Close Account', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.red)),
                ),
              )

            ],
          ),
        ),
      )
    );
  }
}