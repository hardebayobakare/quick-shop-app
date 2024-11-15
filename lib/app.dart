import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/themes/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      /// Show App Loader until Authentication decides which screen to show
      home: const Scaffold(
        backgroundColor: CustomColors.primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage(CustomImages.darkAppLogo), height: 200, width: 200),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(CustomColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}