import 'package:flutter/material.dart';

class MediumText extends StatelessWidget {
  const MediumText({Key? key, required this.text, required this.color})
      : super(key: key);

  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: color,
          fontFamily: "Poppins",
          fontSize: 16,
          fontWeight: FontWeight.w700),
    );
  }
}
