import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/widgets/category_shimmer.dart';
import 'package:quick_shop_app/common/widgets/vertical_image_text.dart';
import 'package:quick_shop_app/features/shop/controllers/category_controller.dart';
import 'package:quick_shop_app/features/shop/screens/category/category.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';

class CustomHomeCategory extends StatelessWidget {
  const CustomHomeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isLoading.value) return const CustomCategoryShimmer();
      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(CustomTextStrings.noContent, style: Theme.of(context).textTheme.bodyMedium!.apply(color: CustomColors.white),)
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return CustomVerticalImageText(
              image: category.image,
              title: category.name,
              onTap: () => Get.to(() => const CategoryScreen()),
            );          
          },
        ),
      );}
    );
  }
}

