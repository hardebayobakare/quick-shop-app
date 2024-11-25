import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/data/repositories/address/address_repository.dart';
import 'package:quick_shop_app/features/personalization/models/address_model.dart';
import 'package:quick_shop_app/features/personalization/screens/address/widget/address_new.dart';
import 'package:quick_shop_app/features/personalization/screens/address/widget/address_single.dart';
import 'package:quick_shop_app/utils/constants/image_strings.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/helpers/cloud_helper_functions.dart';
import 'package:quick_shop_app/utils/helpers/network_manager.dart';
import 'package:quick_shop_app/utils/loaders/circular_loader.dart';
import 'package:quick_shop_app/utils/popups/full_screen_loader.dart';
import 'package:quick_shop_app/utils/popups/loaders.dart';

class AddressController extends GetxController{
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final streetAddress = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final address = await addressRepository.fetchUserAddress();
      selectedAddress.value = address.firstWhere((address) => address.selectedAddress, orElse: () => AddressModel.empty());
      return address;
    } catch (e) {
      CustomLoaders.errorSnackBar(title: CustomTextStrings.addressNotFound, message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel address) async{
    try {
      Get.defaultDialog(
        title: '',
        onWillPop: () async {return false;},
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const CustomCircularLoader(),
      );

      // clear the selected field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(selectedAddress.value.id, false);
      }

      // Assign selected address
      address.selectedAddress = true;
      selectedAddress.value = address;

      // set selected field for newly selected address
      await addressRepository.updateSelectedField(selectedAddress.value.id, true);

      Get.back();
    }catch (e) {
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());

    }
  }

  Future addNewAddresses() async {
    try {
      // Start the loading process
      CustomFullScreenLoader.openLoadingDialog(CustomTextStrings.storingAddress, CustomImages.dataProcess);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CustomFullScreenLoader.closeLoadingDialog();
        return;
      }

      // Validate Form
      if (!addressFormKey.currentState!.validate()) {
        CustomFullScreenLoader.closeLoadingDialog();
        return;
      }

      // Create new address
      final newAddress = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: streetAddress.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
      );

      // Store the address in the Firebase
      final id = await addressRepository.addAddress(newAddress);

      // Update Selected Address status
      newAddress.id = id;
      await selectAddress(newAddress);

      // Close Loading
      CustomFullScreenLoader.closeLoadingDialog();

      // Show Success Message
      CustomLoaders.successSnackBar(title: CustomTextStrings.success, message: CustomTextStrings.addressStored);

      // Refresh the address list
      refreshData.toggle();

      resetFormFields();

      // Redirect
      Navigator.of(Get.context!).pop();

    } catch (e) {
      CustomLoaders.errorSnackBar(title: CustomTextStrings.errorOccurred, message: e.toString());
    }
  }

  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    streetAddress.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }

  Future selectNewsAddressPopup(BuildContext context) async {
    return showModalBottomSheet(
      context: context, 
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(CustomSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSectionHeading(title: CustomTextStrings.selectAddress, showActionButton: false),
              FutureBuilder(
                future: getAllUserAddresses(), 
                builder: (_, snapshot) {
                  final widget = CustomCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                  if (widget != null) return widget;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => CustomSingleAddress(
                      address: snapshot.data![index], 
                      onTap: () async {
                        await selectAddress(snapshot.data![index]);
                        Get.back();
                      },
                    )
                  );
                }
              ),
              
              const SizedBox(height: CustomSizes.defaultSpace * 2),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const AddNewAddressScreen()),
                  child: const Text(CustomTextStrings.addNewAddress),
                ),
              )
            ],
          ),
        )
      )
    );    
  }

}