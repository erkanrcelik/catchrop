import 'package:flutter/material.dart';

import '../../init/theme/color/colors.dart';
import '../icon/general_icon.dart';
import '../text/small_text.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile(
      {Key? key,
      required this.text,
      required this.icons,
      required this.onTaps,
      required this.onLongPresss})
      : super(key: key);

  final String text;
  final IconData icons;
  final VoidCallback onTaps;
  final VoidCallback onLongPresss;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: GeneralIcon(icons: icons),
        title: SmallText(text: text, color: ProductColorsTheme().secondColor),
        onTap: onTaps,
        onLongPress: onLongPresss,
      ),
    );
  }
}
