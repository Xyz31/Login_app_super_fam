import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:super_fam_project/widgets/input_column.dart';
import 'package:super_fam_project/widgets/login_text_company.dart';

class LoginScreen extends StatelessWidget {
  String imagepath = 'assets/back7.jpg';

  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagepath),
            fit: BoxFit.cover,
          ),
        ),
        child: width > 700
            ? _buildLoginUIForDesktop(width, height)
            : _buildLoginUIForMobile(width, height),
      ),
    );
  }

  Widget _buildLoginUIForDesktop(double width, double height) {
    return Center(
      child: Container(
        // height: 300,
        // width: width * 0.7,
        // padding: const EdgeInsets.all(16),
        // margin: EdgeInsets.symmetric(horizontal: width / 15),
        decoration: BoxDecoration(
          color: const Color.fromARGB(0, 7, 5, 5),
          shape: BoxShape.rectangle,
          border: Border.all(
              width: 1, color: Colors.orange), // Hide the original border
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 650,
            maxWidth: 800,
            minHeight: 300,
            maxHeight: 350,
          ),
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LoginText(),
                  InputColumnForLogin(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginUIForMobile(double width, double height) {
    return Padding(
      padding: const EdgeInsets.only(top: 100, bottom: 100),
      child: Container(
        height: height > 500 ? 600 : 500,
        width: width * .8,
        // padding: const EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: width / 15),
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.rectangle,
          border: Border.all(
              width: 1, color: Colors.orange), // Hide the original border
        ),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  LoginText(),
                  // Text("data")
                  InputColumnForLogin(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
