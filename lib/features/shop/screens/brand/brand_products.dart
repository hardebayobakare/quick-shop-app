import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/common/widgets/brand_card.dart';
import 'package:quick_shop_app/common/widgets/products/sort_products.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: Text('Nike'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              CustomBrandCard(
                showBorder: true, 
                image: CustomImages.nikeLogo,
                brandName: 'Nike',
                productsCount: '300',
                isVerified: true,
              ),
              SizedBox(height: CustomSizes.spaceBtwSections),

              // Products
              CustomSortableProduct(),
            ],
          ),
        ),
      ),
    );
  }
}