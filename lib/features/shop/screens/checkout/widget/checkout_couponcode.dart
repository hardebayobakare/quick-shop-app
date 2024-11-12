import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/rounded_container.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomCouponCode extends StatelessWidget {
  const CustomCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return CustomRoundedContainer(
      showborder: true,
      backgroundColor: dark ? CustomColors.dark : CustomColors.white,
      padding: const EdgeInsets.only(top: CustomSizes.sm, bottom: CustomSizes.sm, right: CustomSizes.sm, left: CustomSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
            ),
          ),
    
          SizedBox(
            width: 80, 
            child: ElevatedButton(
              onPressed: () {}, 
              style: ElevatedButton.styleFrom(
                foregroundColor: dark ? CustomColors.white.withOpacity(0.5) : CustomColors.dark.withOpacity(0.5),
                backgroundColor: CustomColors.grey.withOpacity(0.2),
                side: BorderSide(color: CustomColors.grey.withOpacity(0.1)),
              ),
              child: const Text('Apply')
            )
          )
        ],
      )
    );
  }
}