import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/styles/curved_edges_widget.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/common/widgets/circular_icon.dart';
import 'package:quick_shop_app/common/widgets/rounded_images.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomProductImageSlider extends StatelessWidget {
  const CustomProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return CustomCurvedEdgesWidget(
      child: Container(
        color: dark ? CustomColors.darkGrey : CustomColors.light,
        child: Stack(
          children: [
            // Product Image
            const SizedBox(
              height: 400, 
              child: Padding(
                padding: EdgeInsets.all(CustomSizes.productImageRadius * 2),
                child: Center(child: Image(image: AssetImage(CustomImages.productImage1))),
              )
            ),
            // Product Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: CustomSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 6,
                  separatorBuilder: (_, __) => const SizedBox(width: CustomSizes.spaceBtwItems),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => CustomRoundedImage(
                    width: 80,
                    backgroundColor: dark ? CustomColors.dark : CustomColors.white,
                    border: Border.all(color: CustomColors.primaryColor),
                    padding: const EdgeInsets.all(CustomSizes.sm),
                    imageUrl: CustomImages.productImage1,
                  ),
                ),
              ),
            ),
    
            // Appbar Icons
            const CustomAppBar(
              showBackArrow: true,
              actions: [
                CustomCircularIcon(icon: Iconsax.heart5, color: Colors.red,),
              ],
            )
    
          ],
        ),
      ),
    );
  }
}