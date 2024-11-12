import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text('Add New Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
                const SizedBox(height: CustomSizes.spaceBtwInputFields),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    prefixIcon: Icon(Iconsax.mobile),
                  ),
                ),
                const SizedBox(height: CustomSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Street Address',
                          prefixIcon: Icon(Iconsax.building_31),
                        ),
                      ),
                    ),
                    const SizedBox(width: CustomSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Postal Code',
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
                        decoration: const InputDecoration(
                          labelText: 'City',
                          prefixIcon: Icon(Iconsax.building),
                        ),
                      ),
                    ),
                    const SizedBox(width: CustomSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'State',
                          prefixIcon: Icon(Iconsax.activity),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: CustomSizes.spaceBtwInputFields),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'City',
                    prefixIcon: Icon(Iconsax.global),
                  ),
                ),
                const SizedBox(height: CustomSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Save'),
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