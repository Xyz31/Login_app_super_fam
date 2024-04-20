import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_fam_project/controllers/getxcontroller.dart';
import 'package:super_fam_project/widgets/input_column.dart';
import 'package:super_fam_project/widgets/login_text_company.dart';

class LoginScreen extends StatelessWidget {
  List imagpath = [
    'assets/back1.jpg',
    'assets/back2.jpg',
    'assets/back3.jpg',
    'assets/back4.jpg',
    'assets/back5.jpg',
    'assets/back8.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagpath[5]),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            height: 450,
            padding: const EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(horizontal: width / 10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.rectangle,
              border: Border.all(
                  width: 1,
                  color: Colors.transparent), // Hide the original border
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // Shadow color
                  spreadRadius: 5, // Spread radius
                  blurRadius: 7, // Blur radius
                  offset: const Offset(0, 3), // Offset in x and y directions
                ),
                const BoxShadow(
                  color: Colors
                      .transparent, // Transparent color to hide shadow inside
                  spreadRadius: 1, // Spread radius
                  blurRadius: 1, // Blur radius
                  offset: Offset(0, 0), // Offset in x and y directions
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const LoginText(),
                const SizedBox(
                  width: 10,
                  height: 10,
                ),
                InputColumnForLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
