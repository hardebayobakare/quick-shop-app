import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/vertical_image_text.dart';

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
            title: 'Category $index',
            onTap: () {},
          );
          
        },
      ),
    );
  }
}

