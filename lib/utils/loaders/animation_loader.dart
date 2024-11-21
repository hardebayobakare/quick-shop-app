import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

/// A widget that displays a custom animation loader with a text and an optional action button.
class CustomAnimationLoaderWidget extends StatelessWidget {
  /// Default Constructor for the CustomAnimationLoaderWidget
  /// 
  /// Parameters:
  /// - [text]: The text to be displayed below the animation.
  /// - [animation]: The path to the animation file.
  /// - [showAction]: A boolean value to determine if the action button should be displayed.
  /// - [actionText]: The text to be displayed on the action button.
  /// - [onActionPressed]: The function to be executed when the action button is pressed.
  const CustomAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 300),
            child: Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8)
          ),
          const SizedBox(height: CustomSizes.defaultSpace),
          Text(
            text, 
            style: Theme.of(context).textTheme.bodyMedium, 
            textAlign: TextAlign.center
          ),
          const SizedBox(height: CustomSizes.defaultSpace),
          showAction 
            ? SizedBox(
              width: 250,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: CustomColors.dark,
                ),
                onPressed: onActionPressed, 
                child: Text(
                  actionText!, 
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(color: CustomColors.light)),
              ),
            )
            : const SizedBox()
        ],
      ),
    );
  }
}