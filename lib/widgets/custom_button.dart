import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final double? fontSize, width, height;
  final Function() onTap;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.color,
    this.fontSize,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        color: color,
        constraints: BoxConstraints.tightFor(
          width: width ?? double.infinity,
          height: height ?? 50,
        ),
      ),
    );
  }
}
