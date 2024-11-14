import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/app.dart';
import 'package:quick_shop_app/firebase_options.dart';


Future<void> main() async{

  // Todo: Add Widgets Biding
  // Todo: Init Local Storage
  // Todo: Await Native Splase
  
  // initialize Firebase
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
  //   (FirebaseApp firebaseApp) => Get.put(AuthenticationRepository())
  // );
  
  // Todo: Init Authentication

  
  runApp(const App());
}