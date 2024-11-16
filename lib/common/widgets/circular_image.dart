import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';
import 'package:quick_shop_app/utils/loaders/shimmer.dart';

class CustomCircularImage extends StatelessWidget {
  const CustomCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = CustomSizes.sm,
  });

  
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor?? (dark ? CustomColors.black : CustomColors.white),
        borderRadius: BorderRadius.circular(CustomSizes.brandContainerRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(CustomSizes.brandContainerRadius),
        child: Center(
          child: isNetworkImage
            ? CachedNetworkImage(
                fit: fit,
                color: overlayColor,
                imageUrl: image,
                progressIndicatorBuilder: (context, url, progress) => const CustomShimmerEffect(width: 55, height: 55, radius: 55,),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )
            : Image(
              fit: fit,
              image: AssetImage(image),
              color: overlayColor,
              ),
          ),
      ),
    );
  }
}