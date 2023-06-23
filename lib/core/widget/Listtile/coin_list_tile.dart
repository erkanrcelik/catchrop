import 'package:flutter/material.dart';

import '../../../product/widget/text/medium_text.dart';
import '../../../product/widget/text/small_text.dart';
import '../images/quick_image.dart';

class CoinListTile extends StatelessWidget {
  const CoinListTile(
      {Key? key,
      required this.image,
      required this.text1,
      required this.text2,
      required this.color1,
      required this.color2})
      : super(key: key);

  final String image;
  final String text1;
  final String text2;
  final Color color1;
  final Color color2;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ImagePNG(image: image),
      title: MediumText(text: text1, color: color1),
      subtitle: SmallText(text: text2, color: color2),
    );
  }
}
