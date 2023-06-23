import 'package:flutter/material.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

import '../../init/theme/color/colors.dart';

class AirdropCard extends StatelessWidget {
  const AirdropCard({
    Key? key,
    required this.airdropName,
    required this.airdropAmountValue,
    required this.airdropDateValue,
    required this.image1,
    required this.image2,
    required this.color1,
    required this.backgroundColor,
  }) : super(key: key);

  final String airdropName;
  final String airdropAmountValue;
  final String airdropDateValue;
  final String image1;
  final String image2;
  final Color color1;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      height: MediaQuery.of(context).size.height * 0.225,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: backgroundColor,
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage(image1),
          )),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 22.5, 10, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            WidgetCircularAnimator(
              innerAnimation: Curves.elasticOut,
              outerAnimation: Curves.elasticInOut,
              outerAnimationSeconds: 3,
              innerAnimationSeconds: 2,
              innerColor: color1,
              outerColor: color1,
              size: 65,
              child: Image.asset(
                image2,
              ),
            ),
            Text(
              airdropName,
              style: TextStyle(
                  color: ProductColorsTheme().borderColor,
                  fontFamily: "Poppins",
                  fontSize: 12),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Miktar",
                      style: TextStyle(
                          color: ProductColorsTheme().thirdColor,
                          fontFamily: "Poppins",
                          fontSize: 12),
                    ),
                    Text(
                      airdropAmountValue,
                      style: TextStyle(
                          color: ProductColorsTheme().borderColor,
                          fontFamily: "Poppins",
                          fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Kalan Süre",
                      style: TextStyle(
                          color: ProductColorsTheme().thirdColor,
                          fontFamily: "Poppins",
                          fontSize: 12),
                    ),
                    Text(
                      airdropDateValue,
                      style: TextStyle(
                          color: ProductColorsTheme().borderColor,
                          fontFamily: "Poppins",
                          fontSize: 16),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
