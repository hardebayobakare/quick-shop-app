import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/horizontal_product_shimmer.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:quick_shop_app/features/shop/controllers/category_controller.dart';
import 'package:quick_shop_app/features/shop/models/category_model.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/cloud_helper_functions.dart';

class CustomMainCategoryProducts extends StatelessWidget {
  const CustomMainCategoryProducts({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return FutureBuilder(
      future: controller.getCategoryProducts(categoryId: category.id),
      builder: (context, snapshot) {
        const loader = CustomHorizontalProductShimmer();
        final widget = CustomCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
        if (widget != null) return widget;
        final categoryProducts = snapshot.data!;
        return Column(
          children: [
            SizedBox(
              height: 120,
              child: ListView.separated(
                itemCount: categoryProducts.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: CustomSizes.spaceBtwItems),
                itemBuilder: (context, index) => CustomProductCardHorizontal(product: categoryProducts[index]),
              ),
            )
          ],
        );
      }
    );
  }
}
