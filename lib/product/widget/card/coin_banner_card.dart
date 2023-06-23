import 'package:flutter/material.dart';

import '../../../core/widget/Listtile/coin_list_tile.dart';
import '../text/medium_text.dart';
import '../text/small_text.dart';

class CoinBannerCard extends StatefulWidget {
  const CoinBannerCard(
      {Key? key,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.color1,
      required this.color2,
      required this.color3,
      required this.backgroundColor,
      required this.title1,
      required this.title2,
      required this.image,
      required this.colors1,
      required this.colors2})
      : super(key: key);

  final String text1;
  final String text2;
  final String text3;
  final Color color1;
  final Color color2;
  final Color color3;
  final Color backgroundColor;

  final String title1;
  final String title2;
  final String image;
  final Color colors1;
  final Color colors2;

  @override
  State<CoinBannerCard> createState() => _CoinBannerCardState();
}

class _CoinBannerCardState extends State<CoinBannerCard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.22,
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(30),
          //image: DecorationImage(image: AssetImage("assets/images/sp1.png")),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            child: Column(
              children: [
                CoinListTile(
                    image: widget.image,
                    color1: widget.colors1,
                    color2: widget.colors2,
                    text1: widget.title1,
                    text2: widget.title2),
                ListTile(
                    title: MediumText(text: widget.text1, color: widget.color1),
                    subtitle:
                        SmallText(text: widget.text2, color: widget.color2),
                    trailing:
                        SmallText(text: widget.text3, color: widget.color3))
              ],
            )),
      ),
    );
  }
}
