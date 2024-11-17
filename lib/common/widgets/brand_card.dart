import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/brand_container.dart';
import 'package:quick_shop_app/common/widgets/circular_image.dart';
import 'package:quick_shop_app/common/widgets/rounded_container.dart';
import 'package:quick_shop_app/features/shop/models/brand_model.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/enums.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomBrandCard extends StatelessWidget {
  const CustomBrandCard({
    super.key,
    required this.brand,
    required this.showBorder,
    this.onTap, 
  });

  final bool showBorder;
  final BrandModel brand;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: CustomRoundedContainer(
        padding: const EdgeInsets.all(CustomSizes.sm),
        showborder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            // Brand Icon
            Flexible(
              child: CustomCircularImage(
                isNetworkImage: false,
                image: brand.image,
                backgroundColor: Colors.transparent,
                overlayColor: dark ? CustomColors.light : CustomColors.dark,
              ),
            ),
            const SizedBox(width: CustomSizes.spaceBtwItems / 2),
      
            // Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomBrandTitleTextWithVerification(brand: brand, brandTextSize: TextSizes.large),
                  Text(
                    '${brand.productCount} Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            )
          ], 
        ),
      ),
    );
  }
}