import 'package:flutter/material.dart';

class CustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);

    final firstFirstCurve = Offset(0, size.height - 20);
    final firstSecondCurve = Offset(30, size.height -20);

    final secondFirstCurve = Offset(0, size.height - 20);
    final secondSecondCurve = Offset(size.width - 30, size.height - 20);

    final thirdFirstCurve = Offset(size.width, size.height - 20);
    final thirdSecondCurve = Offset(size.width, size.height);

    path.quadraticBezierTo(firstFirstCurve.dx, firstFirstCurve.dy, firstSecondCurve.dx, firstSecondCurve.dy);
    path.quadraticBezierTo(secondFirstCurve.dx, secondFirstCurve.dy, secondSecondCurve.dx, secondSecondCurve.dy);
    path.quadraticBezierTo(thirdFirstCurve.dx, thirdFirstCurve.dy, thirdSecondCurve.dx, thirdSecondCurve.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

}