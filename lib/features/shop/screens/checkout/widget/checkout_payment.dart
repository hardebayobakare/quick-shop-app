import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/widgets/rounded_container.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/features/shop/controllers/checkout_controller.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomBillingPaymentSection extends StatelessWidget {
  const CustomBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    final controller = CheckoutController.instance;
    return Column(
      children: [
        CustomSectionHeading(
          title: CustomTextStrings.paymentMethod, 
          buttonTitle: CustomTextStrings.change,
          onButtonPressed: () => controller.selectPaymentMethod(context),
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems / 2),
        Obx(
          () => Row(
            children: [
              CustomRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? CustomColors.light : CustomColors.white,
                padding: const EdgeInsets.all(CustomSizes.sm),
                child: Image(image: AssetImage(controller.selectedPaymentMethod.value.image), fit: BoxFit.contain),
              ),
              const SizedBox(width: CustomSizes.spaceBtwItems),
              Text(controller.selectedPaymentMethod.value.name, style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        )
      ],
    );
  }
}