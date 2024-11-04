import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/widgets/circluar_container.dart';
import 'package:quick_shop_app/common/widgets/rounded_images.dart';
import 'package:quick_shop_app/features/shop/controllers/home/home_controller.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';

class CustomHomeSlider extends StatelessWidget {
  const CustomHomeSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            aspectRatio: 16/9,
            viewportFraction: 1.0,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.easeInOut,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) => controller.updatePageIndicator(index),
          ),
          items: banners.map((image) => CustomRoundedImage(
            imageUrl: image,
            borderRadius: CustomSizes.md,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          )).toList(),
          ),
        const SizedBox(height: CustomSizes.spaceBtwItems),
        Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for(int i = 0; i < banners.length; i++)
              CustomCircularContainer(
                width: 20,
                height: 4,
                margin: const EdgeInsets.only(right: 10),
                backgroundColor: controller.carouselCurrentIndex.value == i ? CustomColors.primaryColor : CustomColors.grey.withOpacity(0.5),
              ),
            ],
          ),
        )
      ],
    );
  }
}