import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/features/shop/screens/order/widget/order_list_items.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text('Orders', style: Theme.of(context).textTheme.headlineSmall)
      ),
      body: const Padding(
        padding: EdgeInsets.all(CustomSizes.defaultSpace),

        child: CustomOrderListItems(),
      ),
    );
  }
}