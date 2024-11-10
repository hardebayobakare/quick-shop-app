import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/common/widgets/circular_image.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const CustomCircularImage(image: CustomImages.user, width: 80, height: 80),
                    TextButton(onPressed: () {}, child: const Text('Change Profile Image')),
                  ],
                ),
              ),
              // Profile Details
              const SizedBox(height: CustomSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              
              const CustomSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: CustomSizes.spaceBtwItems),

              CustomProfileMenu(title: 'Full Name', value: 'Adebayo Bakare', onPressed: () { }),
              CustomProfileMenu(title: 'Username', value: 'hardebayo', onPressed: () { }, icon: Iconsax.copy),

              const SizedBox(height: CustomSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: CustomSizes.spaceBtwItems),

              const CustomSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: CustomSizes.spaceBtwItems),

              CustomProfileMenu(title: 'E-mail', value: 'hardebayo@binfotech.ca', onPressed: () { }),
              CustomProfileMenu(title: 'Phone Number', value: '+1 647 472 1906', onPressed: () { }),
              CustomProfileMenu(title: 'Gender', value: 'Male', onPressed: () { }),
              CustomProfileMenu(title: 'Date of Birth', value: '19, June 1992', onPressed: () { }),
              
              const SizedBox(height: CustomSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: CustomSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () {}, 
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