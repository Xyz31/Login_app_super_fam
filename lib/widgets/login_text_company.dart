import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class LoginText extends StatelessWidget {
  LoginText({super.key});

  final colorizeColors = [
    Colors.orange.withOpacity(0.8),
    Colors.purple,
    Colors.green,
    Colors.yellow,
    Colors.red,
    Colors.deepPurple
  ];

  final colorizeTextStyle = const TextStyle(
    color: Colors.yellow,
    fontSize: 50.0,
    fontWeight: FontWeight.w700,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 4, horizontal: 8), // Adjust padding if necessary
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 500,
          minWidth: 300,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: AnimatedTextKit(
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
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 80),
              child: AnimatedTextKit(
                repeatForever: true,
                isRepeatingAnimation: true,
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Stand out from crowd. \nCreate your Impact',
                    textStyle: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w200),
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                onTap: () {
                  debugPrint("Tap Event");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
