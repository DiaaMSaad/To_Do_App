import 'package:flutter/material.dart';

class CustomeContanier extends StatelessWidget {
  final String text;
  final Color textColor;
  final double radius;
  final double width;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;

  CustomeContanier(
      {required this.text,
      this.textColor = Colors.white,
      this.radius = 8,
      this.fontSize = 10,
      required this.fontWeight,
      this.width = 50,
      this.height = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Colors.red,
      ),
      child: Column(
        children: [Text(text)],
      ),
    );
  }
}
