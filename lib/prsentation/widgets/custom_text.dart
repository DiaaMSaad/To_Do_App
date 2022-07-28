import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSized;
  final FontWeight fontWeight;
  CustomText(
      {required this.text,
      this.textColor = Colors.grey,
      this.fontSized = 10,
      this.fontWeight = FontWeight.w900});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: textColor, fontSize: fontSized, fontWeight: fontWeight),
    );
  }
}
