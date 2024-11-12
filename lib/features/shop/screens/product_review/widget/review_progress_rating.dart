import 'package:flutter/material.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/device/device_utitlty.dart';

class CustomRatingProgressIndicator extends StatelessWidget {
  const CustomRatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text(text, style: Theme.of(context).textTheme.bodyMedium)),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: DeviceUtils.getScreenWidth(context) * 0.7,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: CustomColors.grey,
              valueColor: const AlwaysStoppedAnimation(Colors.green),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ),
      ],
    );
  }
}