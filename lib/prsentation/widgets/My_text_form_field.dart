import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final double radius;
  final TextEditingController textEditingController;

  MyTextFormField({
    required this.hintText,
    this.radius = 5,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}
