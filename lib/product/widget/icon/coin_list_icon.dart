import 'package:flutter/material.dart';

import '../../init/theme/color/colors.dart';

class CoinListIcon extends StatelessWidget {
  const CoinListIcon({Key? key, required this.image}) : super(key: key);

  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 6), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(8),
        color: ProductColorsTheme().searchColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Image.asset(
          image,
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
