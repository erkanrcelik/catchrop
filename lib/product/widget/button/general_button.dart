import 'package:flutter/material.dart';

import '../../../core/init/theme/color/colors.dart';
import '../../init/theme/color/colors.dart';
import '../text/smalls_text.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ProductColorsTheme().firstColor,
      ),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: TextButton(
          onPressed: onPressed,
          child: SmallsText(text: text, color: CoreColorsTheme().white)),
    );
  }
}
