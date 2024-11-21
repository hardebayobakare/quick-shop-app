import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quick_shop_app/common/menu/navigation_menu.dart';
import 'package:quick_shop_app/data/repositories/user/user_repository.dart';
import 'package:quick_shop_app/features/authentication/screens/login/login.dart';
import 'package:quick_shop_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:quick_shop_app/features/authentication/screens/signup/verify_email.dart';
import 'package:quick_shop_app/utils/exceptions/exceptions.dart';
import 'package:quick_shop_app/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:quick_shop_app/utils/exceptions/firebase_exceptions.dart';
import 'package:quick_shop_app/utils/exceptions/format_exceptions.dart';
import 'package:quick_shop_app/utils/exceptions/platform_exceptions.dart';
import 'package:quick_shop_app/utils/local_storage/storage_utility.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // Get Authenticated User
  User? get authUser => _auth.currentUser;

  // Called from main.dart
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    User? user = _auth.currentUser;
    if(user != null) {
      if(user.emailVerified) {
        await CustomLocalStorage.init(user.uid);
        
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true 
        ? Get.offAll(() => const LoginScreen()) 
        : Get.offAll(() => const OnBoardingScreen());
    }
  }


  /* ----------------- Emain and Password Authentication ----------------- */

  /// [EmailAuthentication] - Sign In
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password
      );
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw CustomExceptions(e.toString());
    }
  }
  
  /// [EmailAuthentication] - Sign Up
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password
      );
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw CustomExceptions(e.toString());
    }
  }

  /// [EmailVerification] - Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw CustomExceptions(e.toString());
    }
  }

  /// [EmailAuthentication] - Reset Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw CustomExceptions(e.toString());
    }
  }

  /// [ReAuthenticateUser] - Re-Authenticate User
  Future<void> reAuthenticateEmailAndPasswordUser(String email, String password) async {
    try {
      // Create a credential
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      // Re-authenticate the user with the credential
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw CustomExceptions(e.toString());
    }
  }

  /* ----------------- Social Account Authentication ----------------- */
  /// [GoogleAuthentication] - Google Sign In
  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the Google Sign In flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the GoogleSignInAuthentication object
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credential);

    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw CustomExceptions(e.toString());
    }
  }



  /// [LogoutUser] - Valid for any authentication method
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await _auth.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw CustomExceptions(e.toString());
    }
  }

  /// [DeleteAccount] - Delete User Account
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw CustomExceptions(e.toString());
    }
  }
}