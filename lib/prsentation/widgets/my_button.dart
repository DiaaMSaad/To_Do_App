import 'package:flutter/material.dart';
import 'package:todo_app/prsentation/screens/schedule_screen.dart';

class MyButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final VoidCallback onClick;

  const MyButton(
      {required this.text,
      this.width = 5,
      this.height = 20,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ElevatedButton(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          onClick();
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xff25C06D),
        ),
      ),
    );
  }
}
