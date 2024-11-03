import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/vertical_image_text.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';

class CustomHomeCategory extends StatelessWidget {
  const CustomHomeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 16,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return CustomVerticalImageText(
            image: CustomImages.shoeIcon,
            title: 'Shoes',
            onTap: () {},
          );
        },
      ),
    );
  }
}

