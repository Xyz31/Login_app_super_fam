import 'dart:js';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

void showDetails(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AlertDialog(
          title: Text(text),
          // content:
          // const Text('This is some information about the email field.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.black54),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {},
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
