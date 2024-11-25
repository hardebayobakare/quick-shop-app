import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/widgets/payment_tile.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/features/shop/models/payment_method_model.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';

class CheckoutController extends GetxController{
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(name: CustomTextStrings.paypal, image: CustomImages.paypal);
    super.onInit();
  }

  Future<void> selectPaymentMethod(BuildContext context) async {
    return showModalBottomSheet(
      context: context, 
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(CustomSizes.lg),
          child: Column(
            children: [
              const CustomSectionHeading(title: CustomTextStrings.selectPaymentMethod, showActionButton: false,),
              const SizedBox(height: CustomSizes.spaceBtwSections),
              CustomPaymentTile(paymentMethod: PaymentMethodModel(name: CustomTextStrings.paypal, image: CustomImages.paypal)),
              const SizedBox(height: CustomSizes.spaceBtwSections/2),
              CustomPaymentTile(paymentMethod: PaymentMethodModel(name: CustomTextStrings.googlePay, image: CustomImages.googlePay)),
              const SizedBox(height: CustomSizes.spaceBtwSections/2),
              CustomPaymentTile(paymentMethod: PaymentMethodModel(name: CustomTextStrings.applePay, image: CustomImages.applePay)),
              const SizedBox(height: CustomSizes.spaceBtwSections/2),
              CustomPaymentTile(paymentMethod: PaymentMethodModel(name: CustomTextStrings.visa, image: CustomImages.visa)),
              const SizedBox(height: CustomSizes.spaceBtwSections/2),
              CustomPaymentTile(paymentMethod: PaymentMethodModel(name: CustomTextStrings.masterCard, image: CustomImages.masterCard)),
              const SizedBox(height: CustomSizes.spaceBtwSections/2),
              CustomPaymentTile(paymentMethod: PaymentMethodModel(name: CustomTextStrings.paytm, image: CustomImages.paytm)),
              const SizedBox(height: CustomSizes.spaceBtwSections/2),
              CustomPaymentTile(paymentMethod: PaymentMethodModel(name: CustomTextStrings.paystack, image: CustomImages.paystack)),
              const SizedBox(height: CustomSizes.spaceBtwSections/2),
              CustomPaymentTile(paymentMethod: PaymentMethodModel(name: CustomTextStrings.creditCard, image: CustomImages.creditCard)),
              const SizedBox(height: CustomSizes.spaceBtwSections/2),
            ],
          ),
        )
      )
    );    
  }
}