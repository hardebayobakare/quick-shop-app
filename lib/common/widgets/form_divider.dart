import 'package:flutter/material.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomFormDivider extends StatelessWidget {
   const CustomFormDivider({
    required this.dividerText,
    super.key,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
          Flexible(child: Divider(color: dark ? CustomColors.darkGrey : CustomColors.grey, thickness: 0.5, indent: 60, endIndent: 5,)),
          Text(dividerText, style: Theme.of(context).textTheme.labelMedium),
          Flexible(child: Divider(color: dark ? CustomColors.darkGrey : CustomColors.grey, thickness: 0.5, indent: 5, endIndent: 60,))
       ],
    );
  }
}
