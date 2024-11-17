import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/widgets/circluar_container.dart';
import 'package:quick_shop_app/common/widgets/rounded_images.dart';
import 'package:quick_shop_app/features/shop/controllers/banner_controller.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/loaders/shimmer.dart';

class CustomHomeSlider extends StatelessWidget {
  const CustomHomeSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Column(
      children: [
        Obx(
          () {
          if (controller.isLoading.value) return const CustomShimmerEffect(width: double.infinity, height: 200, radius: 20);
          if (controller.activeBanners.isEmpty) {
            return const Placeholder(
              fallbackHeight: 200,
              fallbackWidth: double.infinity,
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Text('No Banners')),
            );
          }
          return CarouselSlider(
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
            items: controller.activeBanners.map((banner) => CustomRoundedImage(
              imageUrl: banner.image,
              borderRadius: CustomSizes.md,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              isNetworkImage: true,
            )).toList(),
            );
          }
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems),
        Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for(int i = 0; i < controller.activeBanners.length; i++)
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