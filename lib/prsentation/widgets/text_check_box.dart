import 'package:flutter/material.dart';

class TextCheckBox extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSized;
  final FontWeight fontWeight;
  TextCheckBox(
      {required this.text,
      this.textColor = Colors.black,
      required this.fontSized,
      required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: textColor, fontSize: fontSized, fontWeight: FontWeight.bold),
    );
  }
}
