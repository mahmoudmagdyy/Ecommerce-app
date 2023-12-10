

import 'package:appwithfirebase/core/controller/cartController.dart';
import 'package:appwithfirebase/core/controller/viewcontrol.dart';
import 'package:appwithfirebase/helper/binding.dart';
import 'package:appwithfirebase/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'view/auth/login.dart';
import 'view/auth/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  Get.put(CartViewController());
  runApp(MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home: ViewControl(),
      theme: ThemeData(
        fontFamily: 'SourceSans',
      ),
      routes: {
        "signup" : (context) => SignUp() ,
        "login" : (context) => Login(),
        "homepage" : (context) => Homepage(),
      },
    );
  }
}