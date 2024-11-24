import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/features/personalization/controllers/address_controller.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/validators/validation.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text(CustomTextStrings.addNewAddress),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) => CustomValidator.validateText(CustomTextStrings.name, value),
                  decoration: const InputDecoration(
                    labelText: CustomTextStrings.name,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
                const SizedBox(height: CustomSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: (value) => CustomValidator.validatePhoneNumber(value),
                  decoration: const InputDecoration(
                    labelText: CustomTextStrings.phoneNumber,
                    prefixIcon: Icon(Iconsax.mobile),
                  ),
                ),
                const SizedBox(height: CustomSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.streetAddress,
                        validator: (value) => CustomValidator.validateOtherText(CustomTextStrings.streetAddress, value),
                        decoration: const InputDecoration(
                          labelText: CustomTextStrings.streetAddress,
                          prefixIcon: Icon(Iconsax.building_31),
                        ),
                      ),
                    ),
                    const SizedBox(width: CustomSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                        validator: (value) => CustomValidator.validatePostalCode(value),
                        decoration: const InputDecoration(
                          labelText: CustomTextStrings.postalCode,
                          prefixIcon: Icon(Iconsax.code),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: CustomSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value) => CustomValidator.validateText(CustomTextStrings.city, value),
                        decoration: const InputDecoration(
                          labelText: CustomTextStrings.city,
                          prefixIcon: Icon(Iconsax.building),
                        ),
                      ),
                    ),
                    const SizedBox(width: CustomSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        controller: controller.state,
                        validator: (value) => CustomValidator.validateText(CustomTextStrings.state, value),
                        decoration: const InputDecoration(
                          labelText: CustomTextStrings.state,
                          prefixIcon: Icon(Iconsax.activity),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: CustomSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.country,
                  validator: (value) => CustomValidator.validateText(CustomTextStrings.country, value),
                  decoration: const InputDecoration(
                    labelText: CustomTextStrings.country,
                    prefixIcon: Icon(Iconsax.global),
                  ),
                ),
                const SizedBox(height: CustomSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.addNewAddresses(),
                    child: const Text(CustomTextStrings.save),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}