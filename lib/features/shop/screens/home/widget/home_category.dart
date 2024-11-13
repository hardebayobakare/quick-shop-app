import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/widgets/vertical_image_text.dart';
import 'package:quick_shop_app/features/shop/screens/category/category.dart';

class CustomHomeCategory extends StatelessWidget {
  const CustomHomeCategory({
    super.key,
    required this.categories,
  });

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return CustomVerticalImageText(
            image: categories[index],
            title: 'Sport',
            onTap: () => Get.to(() => const CategoryScreen()),
          );          
        },
      ),
    );
  }
}

