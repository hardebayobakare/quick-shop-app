import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/common/widgets/rounded_images.dart';
import 'package:quick_shop_app/features/shop/models/category_model.dart';
import 'package:quick_shop_app/features/shop/screens/category/main_category.dart';
import 'package:quick_shop_app/features/shop/screens/category/sub_category.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(category.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              const CustomRoundedImage(
                width: double.infinity,
                imageUrl: CustomImages.banner1,
                height: 200,
                applyImageRadius: true,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: CustomSizes.spaceBtwSections),
              //Main Category Products
              CustomMainCategoryProducts(category: category),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              // Sub Categories
              CustomSubCategory(category: category),
            ],
          ),
        ),
      ),
    );
  }
}


