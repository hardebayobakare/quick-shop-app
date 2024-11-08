import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/brand_card.dart';
import 'package:quick_shop_app/common/widgets/rounded_container.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomBrandShowcase extends StatelessWidget {
  const CustomBrandShowcase({
    super.key,
    required this.productImages,
  });

  final List<String> productImages;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      showborder: true,
      borderColor: CustomColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: CustomSizes.spaceBtwItems),
      padding: const EdgeInsets.all(CustomSizes.md),
      child: Column(
        children: [
          // Brand with Product Count
          const CustomBrandCard(
            showBorder: false,
            image: CustomImages.nikeLogo,
            brandName: 'Nike',
            productsCount: '300',
            isVerified: true,
          ),

          const SizedBox(height: CustomSizes.spaceBtwItems),
    
          // Top 3 Products from Brand
          Row(
            children: productImages.map((image) => brandTopProductImageWidget(image, context)).toList(),
          )
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context){
  final dark = CustomHelperFunctions.isDarkMode(context);
  return Expanded(
    child: CustomRoundedContainer(
      height: 100,
      backgroundColor: dark ? CustomColors.darkGrey : CustomColors.light,
      margin: const EdgeInsets.only(right: CustomSizes.sm),
      padding: const EdgeInsets.all(CustomSizes.md),
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ),
  );
}
