import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/features/personalization/screens/address/widget/address_new.dart';
import 'package:quick_shop_app/features/personalization/screens/address/widget/address_single.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: CustomColors.primaryColor,
        child: const Icon(Iconsax.add, color: CustomColors.white,),

      ),
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text('Addresses'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              CustomSingleAddress(selectedAddress: true),
              CustomSingleAddress(selectedAddress: false),
            ],
          )
        )
      )
    );
  }
}