import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/common/widgets/rounded_images.dart';
import 'package:quick_shop_app/features/shop/screens/category/sub_category.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text('Sport')
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              CustomRoundedImage(
                width: double.infinity,
                imageUrl: CustomImages.banner1,
                height: 200,
                applyImageRadius: true,
                fit: BoxFit.cover,
              ),
              SizedBox(height: CustomSizes.spaceBtwSections),

              // Sub Categories
              CustomSubCategory(),
              SizedBox(height: CustomSizes.spaceBtwSections),
              CustomSubCategory(),
              SizedBox(height: CustomSizes.spaceBtwSections),
              CustomSubCategory(),
              SizedBox(height: CustomSizes.spaceBtwSections),
              CustomSubCategory(),
              SizedBox(height: CustomSizes.spaceBtwSections),
              CustomSubCategory(),
            ],
          ),
        ),
      ),
    );
  }
}

