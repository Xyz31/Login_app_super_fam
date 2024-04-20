import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_fam_project/controllers/getxcontroller.dart';

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 8, horizontal: 16), // Adjust padding if necessary
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Super Fam',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w600,
              color: Colors.redAccent,
              letterSpacing: 2,
            ),
          ),
          Text(
            'Stand out from crowd',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300,
              color: Colors.amber,
              letterSpacing: 2,
            ),
          ),
          Text(
            'Make your Impact',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300,
              color: Colors.white,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }
}
