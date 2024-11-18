import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_shop_app/common/widgets/brand_text.dart';
import 'package:quick_shop_app/features/shop/models/brand_model.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/enums.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class CustomBrandTitleTextWithVerification extends StatelessWidget {
  const CustomBrandTitleTextWithVerification({
    super.key,
    required this.brand,
    this.maxLines = 1,
    this.iconColor = CustomColors.primaryColor,
    this.textColor,
    this.textAlign = TextAlign.start,
    this.brandTextSize = TextSizes.small, 
  });
  
  final BrandModel? brand;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    if (brand == null) return const SizedBox.shrink();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: CustomBrandText(
            brandName: brand!.name,
            color: textColor,
            maxlines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: CustomSizes.xs),
        brand!.isVerified ? const Icon(Iconsax.verify5, color: CustomColors.primaryColor, size: CustomSizes.iconXs) : const SizedBox.shrink(),
      ],
    );
  }
}

