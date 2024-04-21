import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_fam_project/Screens/home_screen.dart';
import 'package:super_fam_project/Screens/loginscreen.dart';

import 'controllers/getxcontroller.dart';

// Import GetX package
void main() {
  // Register your controller
  Get.put(LoginController()); // This initializes your controller globally
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Raleway'),
      title: "SuperFam Project",
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginScreen(),
        ),
        GetPage(
          name: '/home',
          page: () => HomeScreen(),
        ),
      ],
    );
  }
}
