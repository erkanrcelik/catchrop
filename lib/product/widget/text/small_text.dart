import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  const SmallText({Key? key, required this.text, required this.color})
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
          fontSize: 14,
          fontWeight: FontWeight.w600),
    );
  }
}
