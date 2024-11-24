import 'package:get/get.dart';
import 'package:quick_shop_app/features/shop/controllers/product/variation_controller.dart';
import 'package:quick_shop_app/utils/helpers/network_manager.dart';

class GeneralBindings  extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
  }
}