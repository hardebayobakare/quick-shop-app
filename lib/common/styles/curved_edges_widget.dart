import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/styles/curved_edges.dart';

class CustomCurvedEdgesWidget extends StatelessWidget {
  const CustomCurvedEdgesWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: child,
    );
  }
}