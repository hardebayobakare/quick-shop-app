import 'package:get/get.dart';
import 'package:quick_shop_app/data/repositories/banners/banner_repository.dart';
import 'package:quick_shop_app/features/shop/models/banner_model.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/popups/loaders.dart';

class BannerController extends GetxController{
  static BannerController get instance => Get.find();

  // Variables
  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;
  RxList<BannerModel> activeBanners = <BannerModel>[].obs;

  final _bannerRepository = Get.put(BannerRepository());

  @override
  void onInit() {
    super.onInit();

    // Fetch Banners
    fetchBanners();
  }

  // Update page indicator
  void updatePageIndicator(int index) {
    carouselCurrentIndex.value = index;
  }

  // Fetch Banners
  Future<void> fetchBanners() async {
    try {
      // Show loading
      isLoading.value = true;

      // Fetch Categories
      final banners = await _bannerRepository.getActiveBanners();

      activeBanners.assignAll(banners);
    } catch (e) {
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
    } finally {
      // Hide loading
      isLoading.value = false;
    }
  }
}