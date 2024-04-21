import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_fam_project/Screens/loginscreen.dart';
import 'package:super_fam_project/controllers/getxcontroller.dart';

class HomeScreen extends StatelessWidget {
  final controller =
      Get.find<LoginController>(); // Get the LoginController instance
  final colorizeColors = [
    Colors.orange.withOpacity(0.8),
    Colors.purple,
    Colors.green,
    Colors.yellow,
    Colors.red,
    Colors.deepPurple
  ];

  List<String> contentTitle = [
    'Online Income',
    'Promoter Program',
    'Exclusive Access',
  ];

  List<String> footerButtons = [
    'LinkedIn',
    'Instagram',
    'Facebook',
    'Twitter',
    'About Us',
    'Careers',
  ];

  List<String> contentinfo = [
    'There are endless possibilities to make a living on Superfam. Become a creator, a promoter, a supporter or all at once',
    'Our cutting edge promoter program gives everyone the possibility to become an online promoter. Help us and our creators grow and earn a big cut of your promotions',
    'Get access to exclusive content, chat with creators you love and request feedbacks or additional content directly from within the chat',
  ];

  final colorizeTextStyle = const TextStyle(
    color: Colors.yellow,
    fontSize: 70.0,
    fontWeight: FontWeight.bold,
  );

  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // Accessing values from LoginController
    String phoneNumber = controller.phoneNumber.value;
    String otp = controller.otp.value;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    double first, second, third;
    if (width > 600) {
      first = 66;
      second = 42;
      third = 22;
    } else {
      first = 46;
      second = 32;
      third = 16;
    }
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: Text('Home Screen contact : $phoneNumber, OTP : $otp'),
      //   leading: null,
      // ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                    // color: Colors.purple.0.5),
                    ),
                child: width > 600
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _showAppLogo(context),
                          _showContactDetails(phoneNumber, otp),
                        ],
                      )
                    : Column(
                        children: [
                          _showAppLogo(context),
                          _showContactDetails(phoneNumber, otp),
                        ],
                      ),
              ),
              __whysuperFam(width, second),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _showContentInfo(width, 0, second, third),
                    _showContentInfo(width, 1, second, third),
                    _showContentInfo(width, 2, second, third),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              _footer(width, height, 0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showAppLogo(context) {
    return AnimatedTextKit(
      pause: const Duration(milliseconds: 10),
      animatedTexts: [
        ColorizeAnimatedText(
          'Super Fam',
          textStyle: colorizeTextStyle,
          colors: colorizeColors,
          speed: const Duration(milliseconds: 1000),
        ),
      ],
      isRepeatingAnimation: true,
      repeatForever: true,
      onTap: () {
        debugPrint("Tap Event");
      },
    );
  }

  Widget __whysuperFam(double width, double second) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          padding: EdgeInsets.only(left: width > 600 ? width * 0.3 : 10),
          child: Row(
            children: [
              Text(
                'Why  ',
                style: TextStyle(
                  fontSize: second,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Super Fam?',
                style: TextStyle(
                  fontSize: second,
                  fontWeight: FontWeight.w800,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _showContactDetails(String phone, String otp) {
    return Column(
      children: [
        DefaultTextStyle(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
          child: Row(
            children: [
              const Icon(
                Icons.password_outlined,
                color: Colors.orange,
              ),
              Text(
                '    Your Contact : $phone',
              ),
            ],
          ),
        ),
        DefaultTextStyle(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
          child: Row(
            children: [
              const Icon(
                Icons.call,
                color: Colors.orange,
              ),
              Text(
                '    Your OTP : $otp',
              ),
            ],
          ),
        ),
      ],
    );
  }

  //Show Simple Card
  Widget _showContentInfo(
      double width, int index, double second, double third) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.orangeAccent,
        ),
        color: Colors.grey.withOpacity(0.1),
      ),
      padding: const EdgeInsets.all(8),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: width > 600 ? 300 : 180,
            maxHeight: width > 600 ? 400 : 350),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "0${index + 1}",
              style: TextStyle(
                fontSize: second,
                fontWeight: FontWeight.w700,
                color: Colors.orange,
              ),
            ),
            Text(
              contentTitle[index],
              style: TextStyle(
                fontSize: second,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: 1.3,
              ),
            ),
            Text(
              contentinfo[index],
              style: TextStyle(
                fontSize: third,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _footer(double width, double height, int index) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 20,
        color: Colors.white38,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                footerButtons[0],
              ),
              Text(
                footerButtons[1],
              ),
              Text(
                footerButtons[2],
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                footerButtons[3],
              ),
              Text(
                footerButtons[4],
              ),
              Text(
                footerButtons[5],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Made With Flutter © SuperFam 2024',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
