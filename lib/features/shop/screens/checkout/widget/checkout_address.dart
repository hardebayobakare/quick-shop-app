import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/features/personalization/controllers/address_controller.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';

class CustomBillingAddressSection extends StatelessWidget {
  const CustomBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSectionHeading(
          title: CustomTextStrings.shippingAddress, 
          buttonTitle: CustomTextStrings.change,
          onButtonPressed: () => controller.selectNewsAddressPopup(context),
        ),
        controller.selectedAddress.value.id.isNotEmpty
          ? Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(controller.selectedAddress.value.name, style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: CustomSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      const Icon(Icons.phone, color: CustomColors.grey, size: 16),
                      const SizedBox(width: CustomSizes.spaceBtwItems),
                      Text(controller.selectedAddress.value.phoneNumber, style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  
                  const SizedBox(height: CustomSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      const Icon(Icons.location_history, color: CustomColors.grey, size: 16),
                      const SizedBox(width: CustomSizes.spaceBtwItems),
                      Expanded(child: Text(controller.selectedAddress.value.toString(), style: Theme.of(context).textTheme.bodyMedium)),
                    ],
                  ),
                ],
              ),
          )
          : Text(CustomTextStrings.selectAddress, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}