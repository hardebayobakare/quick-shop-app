import 'package:flutter/material.dart';
import 'package:quick_shop_app/utils/constants/enums.dart';

class CustomBrandText extends StatelessWidget {
  const CustomBrandText({
    super.key,
    required this.brandName,
    this.color,
    this.maxlines = 1,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String brandName;
  final Color? color;
  final int maxlines;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      brandName,
      textAlign: textAlign, 
      overflow: TextOverflow.ellipsis, 
      maxLines: maxlines, 
      style: brandTextSize == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : brandTextSize == TextSizes.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
              : brandTextSize == TextSizes.large
                  ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
                  : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}