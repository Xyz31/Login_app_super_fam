import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Screen',
        ),
      ),
      body: const Center(
        child: Text(
          'Supe Fam',
          style: TextStyle(
            fontSize: 60,
            color: Colors.orange,
            fontWeight: FontWeight.w400,
            wordSpacing: 2,
          ),
        ),
      ),
    );
  }
}
