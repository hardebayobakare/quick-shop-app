import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/features/personalization/controllers/name_controller.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text('Change Name', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Column(
          children: [
            // Headings
            Text(
              CustomTextStrings.changeNameMessage,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: CustomSizes.spaceBtwSections),

            // Form
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) => CustomValidator.validateText("First Name", value),
                    expands: false,
                    decoration: const InputDecoration(labelText: CustomTextStrings.firstName, prefixIcon: Icon(Iconsax.user)),
                  ),
                  const SizedBox(height: CustomSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) => CustomValidator.validateText("Last Name", value),
                    expands: false,
                    decoration: const InputDecoration(labelText: CustomTextStrings.lastName, prefixIcon: Icon(Iconsax.user)),
                  ),
                ],
              )
            ),

            const SizedBox(height: CustomSizes.spaceBtwSections),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateName(),
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}