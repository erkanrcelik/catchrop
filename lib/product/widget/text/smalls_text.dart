import 'package:flutter/material.dart';

class SmallsText extends StatelessWidget {
  const SmallsText({Key? key, required this.text, required this.color})
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
          fontSize: 13,
          fontWeight: FontWeight.w400),
    );
  }
}
