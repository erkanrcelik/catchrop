import 'package:flutter/material.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

import '../../../../init/theme/color/colors.dart';
import '../../../../widget/text/small_text.dart';
import '../../../../widget/text/smalls_text.dart';

class CoinDetailScreen extends StatefulWidget {
  const CoinDetailScreen(
      {Key? key,
      required this.name,
      required this.symbol,
      required this.imageUrl,
      required this.price,
      required this.changePercentage,
      required this.market_cap,
      required this.market_cap_rank,
      required this.high_24h,
      required this.low_24h,
      required this.ath,
      required this.ath_date})
      : super(key: key);

  final String name;
  final String symbol;
  final String imageUrl;
  final num price;
  final num changePercentage;
  final num market_cap;
  final num market_cap_rank;
  final num high_24h;
  final num low_24h;
  final num ath;
  final String ath_date;

  @override
  State<CoinDetailScreen> createState() => _CoinDetailScreenState();
}

class _CoinDetailScreenState extends State<CoinDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetCircularAnimator(
                innerAnimation: Curves.elasticOut,
                outerAnimation: Curves.elasticInOut,
                outerAnimationSeconds: 3,
                innerAnimationSeconds: 2,
                innerColor: ProductColorsTheme().firstColor,
                outerColor: ProductColorsTheme().firstColor,
                size: 120,
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              Divider(
                height: 30,
                color: ProductColorsTheme().secondColor,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(
                      text: "Coin Adı :",
                      color: ProductColorsTheme().secondColor),
                  SmallsText(
                      text: widget.name,
                      color: ProductColorsTheme().secondColor)
                ],
              ),
              SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(
                      text: "Coin Sembolü :",
                      color: ProductColorsTheme().secondColor),
                  SmallsText(
                      text: widget.symbol,
                      color: ProductColorsTheme().secondColor)
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(
                      text: "Fiyat :", color: ProductColorsTheme().secondColor),
                  SmallsText(
                      text: widget.price.toString(),
                      color: ProductColorsTheme().secondColor)
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(
                      text: "Market Değeri :",
                      color: ProductColorsTheme().secondColor),
                  SmallsText(
                      text: widget.market_cap.toString(),
                      color: ProductColorsTheme().secondColor)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(
                      text: "Market Sıralaması :",
                      color: ProductColorsTheme().secondColor),
                  SmallsText(
                      text: widget.market_cap_rank.toString(),
                      color: ProductColorsTheme().secondColor)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(
                      text: "24 Saatlik Değişim :",
                      color: ProductColorsTheme().secondColor),
                  SmallsText(
                      text: widget.changePercentage.toString(),
                      color: ProductColorsTheme().secondColor)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(
                      text: "24 Saat En Yüksek :",
                      color: ProductColorsTheme().secondColor),
                  SmallsText(
                      text: widget.high_24h.toString(),
                      color: ProductColorsTheme().secondColor)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(
                      text: "24 Saat En Düşük :",
                      color: ProductColorsTheme().secondColor),
                  SmallsText(
                      text: widget.low_24h.toString(),
                      color: ProductColorsTheme().secondColor)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(
                      text: "En Yüksek Değer :",
                      color: ProductColorsTheme().secondColor),
                  SmallsText(
                      text: widget.ath.toString(),
                      color: ProductColorsTheme().secondColor)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(
                      text: "En Yüksek Değer Tarihi :",
                      color: ProductColorsTheme().secondColor),
                  SmallsText(
                      text: widget.ath_date.toString(),
                      color: ProductColorsTheme().secondColor)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
