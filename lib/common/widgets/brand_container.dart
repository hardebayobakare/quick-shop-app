import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/brand_text.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/enums.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class CustomBrandTitleTextWithVerification extends StatelessWidget {
  const CustomBrandTitleTextWithVerification({
    super.key,
    required this.brandName,
    required this.isVerified,
    this.maxLines = 1,
    this.iconColor = CustomColors.primaryColor,
    this.textColor,
    this.textAlign = TextAlign.start,
    this.brandTextSize = TextSizes.small, 
  });
  
  final String brandName;
  final bool isVerified;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: CustomBrandText(
            brandName: brandName,
            color: textColor,
            maxlines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: CustomSizes.xs),
        isVerified ? const Icon(Iconsax.verify5, color: CustomColors.primaryColor, size: CustomSizes.iconXs) : const SizedBox.shrink(),
      ],
    );
  }
}

