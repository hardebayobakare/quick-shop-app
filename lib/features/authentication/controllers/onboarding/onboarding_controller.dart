import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();

  // Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  
  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  void nextPage() {
    if(currentPageIndex.value == 2){
      // Get.to(LoginScreen());
      print('Navigate to login screen');
    }else{
      currentPageIndex.value++;
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void skipPage() {
    // Get.to(LoginScreen());
    print('Navigate to login screen');
  }
}