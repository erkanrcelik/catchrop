import 'package:flutter/material.dart';

import '../../init/theme/color/colors.dart';
import '../../screen/home/market/view/coin_detail_screen.dart';
import '../text/small_text.dart';

// ignore: must_be_immutable
class CoinListCard extends StatelessWidget {
  CoinListCard(
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

  String name;
  String symbol;
  String imageUrl;
  num price;
  num changePercentage;
  num market_cap;
  num market_cap_rank;
  num high_24h;
  num low_24h;
  num ath;
  String ath_date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 0),
      child: ListTile(
        onTap: (() => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CoinDetailScreen(
                  name: name,
                  ath: ath,
                  ath_date: ath_date,
                  changePercentage: changePercentage,
                  high_24h: high_24h,
                  imageUrl: imageUrl,
                  low_24h: low_24h,
                  market_cap: market_cap,
                  market_cap_rank: market_cap_rank,
                  price: price,
                  symbol: symbol,
                ),
              ),
            )),
        contentPadding: EdgeInsets.all(0),
        leading: Image.network(
          imageUrl,
          width: 40,
          height: 40,
        ),
        title: SmallText(text: name, color: ProductColorsTheme().secondColor),
        subtitle:
            SmallText(text: symbol, color: ProductColorsTheme().thirdColor),
        trailing: Column(
          children: [
            SmallText(
                text: price.toString(),
                color: ProductColorsTheme().secondColor),
            SmallText(
              text: changePercentage.toDouble() < 0
                  ? changePercentage.toDouble().toString() + '%'
                  : '+' + changePercentage.toDouble().toString() + '%',
              color:
                  changePercentage.toDouble() < 0 ? Colors.red : Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
