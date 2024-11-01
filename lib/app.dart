import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:quick_shop_app/utils/themes/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}