import 'package:flutter/material.dart';

class ImageJPG extends StatelessWidget {
  const ImageJPG({Key? key, required this.image}) : super(key: key);

  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/$image.jpg", fit: BoxFit.fill);
  }
}

class ImagePNG extends StatelessWidget {
  const ImagePNG({Key? key, required this.image}) : super(key: key);

  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/$image.png");
  }
}
