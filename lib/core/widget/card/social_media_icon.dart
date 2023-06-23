import 'package:flutter/material.dart';

import '../../../product/init/theme/color/colors.dart';
import '../images/quick_image.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({Key? key, required this.image}) : super(key: key);

  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ProductColorsTheme().thirdColor),
      ),
      width: 150,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ImagePNG(image: image),
      ),
    );
  }
}
