import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/common/widgets/grid_layout.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              DropdownButtonFormField(
                items: ['Name', 'Price', 'Popularity', 'Rating', 'Newest'].map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Sort By',
                  prefixIcon: Icon(Iconsax.sort),
                ),
              ),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              // Products
              CustomGridLayout(
                itemCount: 9, 
                itemBuilder: (_, index) => const CustomProductCardVertical(),
              )
            ],
          ),
        ),
      )
    );
  }
}