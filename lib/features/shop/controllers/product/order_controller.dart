import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/menu/navigation_menu.dart';
import 'package:quick_shop_app/common/widgets/success_screen.dart';
import 'package:quick_shop_app/data/repositories/authentication/authentication_repository.dart';
import 'package:quick_shop_app/data/repositories/order/order_repository.dart';
import 'package:quick_shop_app/features/personalization/controllers/address_controller.dart';
import 'package:quick_shop_app/features/shop/controllers/checkout_controller.dart';
import 'package:quick_shop_app/features/shop/controllers/product/cart_controller.dart';
import 'package:quick_shop_app/features/shop/models/order_model.dart';
import 'package:quick_shop_app/utils/constants/enums.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/exceptions/exceptions.dart';
import 'package:quick_shop_app/utils/popups/full_screen_loader.dart';
import 'package:quick_shop_app/utils/popups/loaders.dart';

class OrderController extends GetxController{
  static OrderController get instance => Get.find();


  // Variables
  final cartController = Get.put(CartController());
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());


  // Fetch Order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      CustomLoaders.warningSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
      return [];
    }
  }

  // Process Order
  void processOrder(double totalAmount) async {
    try {
      // Start loading
      CustomFullScreenLoader.openLoadingDialog(CustomTextStrings.processing, CustomImages.dataProcess);

      // Get user authentication
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) throw const CustomExceptions(CustomTextStrings.userNotFound);

      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        address: addressController.selectedAddress.value,
        cartItems: cartController.cartItems.toList(),
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
      );

      // Save Order
      await orderRepository.saveOrder(order, userId);

      // Clear cart
      cartController.clearCart();

      // Go to success screen
      Get.off(() => SuccessScreen(
        image: CustomImages.successfulPaymentIcon, 
        title: CustomTextStrings.paymentSuccessful, 
        subtitle: CustomTextStrings.orderPlaced, 
        onPressed: () => Get.offAll(() => const NavigationMenu()))
      );

    } catch (e) {
      CustomFullScreenLoader.closeLoadingDialog();
      CustomLoaders.warningSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
    }
  }
}