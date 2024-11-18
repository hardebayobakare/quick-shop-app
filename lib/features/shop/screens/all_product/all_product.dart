import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/common/widgets/products/sort_products.dart';
import 'package:quick_shop_app/common/widgets/vertical_product_shimmer.dart';
import 'package:quick_shop_app/features/shop/controllers/product/allproduct_controller.dart';
import 'package:quick_shop_app/features/shop/models/product_model.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/cloud_helper_functions.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({
    super.key,
    required this.title,
    this.query,
    this.futureMethod,
  });

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(title),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductbyQuery(query),
            builder: (context, snapshot) {
              const loader = CustomVerticalProductShimmer();
              
              final widget = CustomCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
              if (widget != null) return widget;
              
              final products = snapshot.data!;
              return CustomSortableProduct(products: products);
            }
          ),
        ),
      )
    );
  }
}
