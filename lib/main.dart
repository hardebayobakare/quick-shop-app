import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quick_shop_app/app.dart';
import 'package:quick_shop_app/data/repositories/authentication/authentication_repository.dart';
import 'package:quick_shop_app/firebase_options.dart';


Future<void> main() async{
  // Widget Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Local Storage Initialization
  await GetStorage.init();

  // Await Splash screen until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  
  // initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
    (FirebaseApp firebaseApp) => Get.put(AuthenticationRepository())
  );
  
  // Todo: Init Authentication

  
  runApp(const App());
}