import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/primary_header_container.dart';
import 'package:quick_shop_app/features/authentication/screens/home/widget/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomPrimaryHeaderContainer(
              child: Column(
                children: [
                  CustomHomeAppBar()
                ],
              )
            )
        ],),
      ),
    );
  }
}




