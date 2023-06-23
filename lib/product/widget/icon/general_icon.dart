import 'package:flutter/material.dart';

import '../../init/theme/color/colors.dart';

class GeneralIcon extends StatelessWidget {
  const GeneralIcon({Key? key, required this.icons}) : super(key: key);

  final IconData icons;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: ProductColorsTheme().thirdColor),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Icon(
          icons,
          color: ProductColorsTheme().secondColor,
          size: 22,
        ),
      ),
    );
  }
}
