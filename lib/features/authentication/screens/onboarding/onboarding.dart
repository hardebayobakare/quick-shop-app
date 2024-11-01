import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:quick_shop_app/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:quick_shop_app/features/authentication/screens/onboarding/widgets/onboarding_next.dart';
import 'package:quick_shop_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:quick_shop_app/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack (
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: CustomImages.onBoardingImage1,
                title: CustomTextStrings.onBoardingTitle1,
                subtitle: CustomTextStrings.onBoardingSubtitle1),
              OnBoardingPage(
                image: CustomImages.onBoardingImage2,
                title: CustomTextStrings.onBoardingTitle2,
                subtitle: CustomTextStrings.onBoardingSubtitle2),
              OnBoardingPage(
                image: CustomImages.onBoardingImage3,
                title: CustomTextStrings.onBoardingTitle3,
                subtitle: CustomTextStrings.onBoardingSubtitle3),
            ],
          ),

          // Skip button
          const OnBoardingSkip(),

          // Dot navigation
          const OnBoardingDotNavigation(),

          // Circle button
          const OnBoardingNextButton(),
        ],
      )
    );
  }
}

