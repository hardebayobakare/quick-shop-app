import 'package:flutter/material.dart';

class CustomSectionHeading extends StatelessWidget {
  const CustomSectionHeading({
    super.key,
    required this.title,
    this.showActionButton = true,
    this.textColor,
    this.buttonTitle  = 'View All',
    this.onButtonPressed,
  });
  final String title;
  final bool showActionButton;
  final Color? textColor;
  final String buttonTitle; 
  final void Function()? onButtonPressed;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor), maxLines: 1, overflow: TextOverflow.ellipsis),
        if(showActionButton) TextButton(onPressed: onButtonPressed, child: Text(buttonTitle))
      ],
    );
  }
}