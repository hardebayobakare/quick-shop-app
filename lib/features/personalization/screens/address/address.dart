import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/features/personalization/controllers/address_controller.dart';
import 'package:quick_shop_app/features/personalization/screens/address/widget/address_new.dart';
import 'package:quick_shop_app/features/personalization/screens/address/widget/address_single.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/helpers/cloud_helper_functions.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: CustomColors.primaryColor,
        child: const Icon(Iconsax.add, color: CustomColors.white,),

      ),
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text(CustomTextStrings.addresses),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
              key: Key(controller.refreshData.value.toString()),
              future: controller.getAllUserAddresses(),
              builder: (context, snapshot) {
                final widget = CustomCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                if (widget != null) return widget;
                final addresses = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: addresses.length,
                  itemBuilder:(_, index) => CustomSingleAddress(address: addresses[index], onTap: () => controller.selectAddress(addresses[index])),
                );
              }
            ),
          )
        )
      )
    );
  }
}