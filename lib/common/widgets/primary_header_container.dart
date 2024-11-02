import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/styles/curved_edges_widget.dart';
import 'package:quick_shop_app/common/widgets/circluar_container.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';

class CustomPrimaryHeaderContainer extends StatelessWidget {
  const CustomPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomCurvedEdgesWidget(
      child: Container(
      color: CustomColors.primaryColor,
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        height: 400,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: CustomCircularContainer(
                width: 400,
                height: 400,
                radius: 400,
                padding: 0,
                backgroundColor: CustomColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: CustomCircularContainer(
                width: 400,
                height: 400,
                radius: 400,
                padding: 0,
                backgroundColor: CustomColors.textWhite.withOpacity(0.1),
              ),
            ),
            child,
          ],  
        ),
      ),
    ),
    );
  }
}

