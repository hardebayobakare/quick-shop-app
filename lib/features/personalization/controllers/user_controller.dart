import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/data/repositories/user/user_repository.dart';
import 'package:quick_shop_app/features/personalization/models/user_model.dart';
import 'package:quick_shop_app/utils/constants/text_strings.dart';
import 'package:quick_shop_app/utils/popups/loaders.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  /// Save User Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentals) async {
    // Save User Record
    try {
      if (userCredentals != null) {
        final nameParts = UserModel.nameParts(userCredentals.user!.displayName ?? '');
        final username = UserModel.generateUsername(userCredentals.user!.displayName ?? '');

        // Map Data
        final user = UserModel(
          id: userCredentals.user!.uid,
          email: userCredentals.user!.email ?? '',
          userName: username,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(" ") : '',
          profilePicture: userCredentals.user!.photoURL ?? '',
          phoneNumber: userCredentals.user!.phoneNumber ?? '',

        );

        // Save User Record
        await UserRepository.instance.saveUserDetails(user);

        
      }

    } catch (e) {
      CustomLoaders.warningSnackBar(title: CustomTextStrings.dataNotSaved, message: CustomTextStrings.dataNotSavedMessage);
    }
  }
}