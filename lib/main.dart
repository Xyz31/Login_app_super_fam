import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:get/get.dart';
import 'package:super_fam_project/Screens/home_screen.dart';
import 'package:super_fam_project/Screens/loginscreen.dart';
// Import GetX package

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "LoginScreen",
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginScreen(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomeScreen(),
        ),
      ],
    );
  }
}
