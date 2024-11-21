import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/widgets/app_bar.dart';
import 'package:quick_shop_app/common/widgets/grid_layout.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:quick_shop_app/common/widgets/vertical_product_shimmer.dart';
import 'package:quick_shop_app/features/shop/controllers/favourite_controller.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/helpers/cloud_helper_functions.dart';
import 'package:quick_shop_app/utils/loaders/animation_loader.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        // actions: [
        //   CustomCircularIcon(
        //     icon: Iconsax.add,
        //     onPressed: () => Get.to(const NavigationMenu(initialIndex: 1)),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Column(
          children: [
            Obx(() =>
              FutureBuilder(
                future: controller.getFavouriteProducts(),
                builder: (context, snapshot) {
                  const emptyWidget = CustomAnimationLoaderWidget(
                    text: CustomTextStrings.emptyWishlist, 
                    animation: CustomImages.addToWishlist,
                    actionText: CustomTextStrings.letsAddSome,
                  );
                  const loader = CustomVerticalProductShimmer(itemCount: 6);
                  final widget = CustomCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader, nothingFound: emptyWidget);
                  if (widget != null) return widget;
              
                  final products = snapshot.data!;
                  return CustomGridLayout(
                    itemCount: products.length, 
                    itemBuilder: (_, index) => CustomProductCardVertical(product: products[index]),
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}