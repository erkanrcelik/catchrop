import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {
  const LargeText({Key? key, required this.text, required this.color})
      : super(key: key);

  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontFamily: "Poppins",
          fontSize: 24,
          fontWeight: FontWeight.bold),
    );
  }
}
