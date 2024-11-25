import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/rounded_container.dart';
import 'package:quick_shop_app/features/shop/controllers/checkout_controller.dart';
import 'package:quick_shop_app/features/shop/models/payment_method_model.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomPaymentTile extends StatelessWidget {
  const CustomPaymentTile({
    super.key,
    required this.paymentMethod,
  });

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    final controller = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: CustomRoundedContainer(
        width: 60,
        height: 40,
        backgroundColor: dark ? CustomColors.dark : CustomColors.light,
        padding: const EdgeInsets.all(CustomSizes.sm),
        child: Image.asset(
          paymentMethod.image, 
          fit: BoxFit.contain
        ),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}