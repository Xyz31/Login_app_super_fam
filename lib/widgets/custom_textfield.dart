import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:super_fam_project/widgets/show_dialog.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String info;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.info,
    required this.prefixIcon,
    required this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorWidth: 1,
      cursorColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 10,
        letterSpacing: 1,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.blueGrey.withOpacity(0.6),
        hintText: hintText,
        hintStyle: TextStyle(
          letterSpacing: 1,
          fontSize: 10,
          color: Colors.white.withOpacity(0.8),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: GestureDetector(
            onTap: () {
              showDetails(context, info);
            },
            child: suffixIcon),
      ),
    );
  }
}

class CustomTextFieldForPassword extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget icon;

  const CustomTextFieldForPassword({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
  });

  @override
  State<CustomTextFieldForPassword> createState() =>
      _CustomTextFieldForPasswordState();
}

class _CustomTextFieldForPasswordState
    extends State<CustomTextFieldForPassword> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      cursorWidth: 1.2,
      cursorColor: Colors.white,
      obscureText: _obscureText,
      style: const TextStyle(
        color: Colors.white60,
        fontSize: 10,
        letterSpacing: 1,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.blueGrey.withOpacity(0.8),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          letterSpacing: 1,
          fontSize: 10,
          color: Colors.white.withOpacity(0.8),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
        prefixIcon: const Icon(
          Icons.lock,
          color: Colors.white,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            _togglePasswordVisibility();
          },
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
