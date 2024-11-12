import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/menu/navigation_menu.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/common/widgets/rounded_container.dart';
import 'package:quick_shop_app/common/widgets/success_screen.dart';
import 'package:quick_shop_app/features/shop/screens/cart/widget/cart_items.dart';
import 'package:quick_shop_app/features/shop/screens/checkout/widget/checkout_address.dart';
import 'package:quick_shop_app/features/shop/screens/checkout/widget/checkout_couponcode.dart';
import 'package:quick_shop_app/features/shop/screens/checkout/widget/checkout_amount.dart';
import 'package:quick_shop_app/features/shop/screens/checkout/widget/checkout_payment.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              // Items in cart
              const CustomCartItems(showActionButton: false),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              // Coupon code
              const CustomCouponCode(),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              // Billing Section
              CustomRoundedContainer(
                showborder: true,
                padding: const EdgeInsets.all(CustomSizes.md),
                backgroundColor: dark ? CustomColors.dark : CustomColors.white,
                child: const Column(
                  children: [
                    // Pricing
                    CustomBillingAmountSection(),
                    SizedBox(height: CustomSizes.spaceBtwItems),
                    
                    // Divider
                    Divider(),
                    SizedBox(height: CustomSizes.spaceBtwItems),

                    // Payment Method
                    CustomBillingPaymentSection(),


                    // Address
                    CustomBillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
            image: CustomImages.successfulPaymentIcon,
            title: 'Order Placed',
            subtitle: 'Your order has been placed successfully',
            onPressed: () => Get.offAll(() => const NavigationMenu()),
          )), 
          child: const Text('Checkout \$256')),
      ),
    );
  }
}

