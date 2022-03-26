import 'dart:math';

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        child: Text(text),
        decoration:  BoxDecoration(
          color: Colors.black,
          border: Border.all(width: 20),
        ),
        width: 50,
        height: 60,
      ),
    );
  }
}
