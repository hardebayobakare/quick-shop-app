
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/grid_layout.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:quick_shop_app/features/shop/controllers/product/allproduct_controller.dart';
import 'package:quick_shop_app/features/shop/models/product_model.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class CustomSortableProduct extends StatelessWidget {
  const CustomSortableProduct({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
          // TODO: Implement popular by adding product sale count field to products
          items: ['Name', 'Highest Price', 'Lowest Price', 'Sale', 'Newest'].map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
          value: controller.selectedSortingOption.value,
          onChanged: (value) => controller.sortProducts(value!),
          decoration: const InputDecoration(
            labelText: 'Sort By',
            prefixIcon: Icon(Iconsax.sort),
          ),
        ),
        const SizedBox(height: CustomSizes.spaceBtwSections),
    
        // Products
        Obx(
          () => CustomGridLayout(
            itemCount: controller.products.length, 
            itemBuilder: (_, index) => CustomProductCardVertical(product: controller.products[index]),
          ),
        )
      ],
    );
  }
}