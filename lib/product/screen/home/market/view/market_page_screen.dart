import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../../core/widget/card/search_card.dart';
import '../../../../widget/card/coin_list_card.dart';
import '../../homepage/model/coin_model.dart';

class MarketPageScreen extends StatefulWidget {
  const MarketPageScreen({Key? key}) : super(key: key);

  @override
  State<MarketPageScreen> createState() => _MarketPageScreenState();
}

class _MarketPageScreenState extends State<MarketPageScreen> {
  List<Coin> coinSearchList = coinList;
  onSearch(String search) {
    setState(() {
      coinSearchList = coinList
          .where((Coin) => Coin.name.toString().toLowerCase().contains(search))
          .toList();
    });
  }

  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=1&sparkline=false'));

    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
        setState(() {
          coinList;
        });
      }
      return coinList;
    } else {
      throw Exception('Failed to load coins');
    }
  }

  @override
  void initState() {
    fetchCoin();
    Timer.periodic(Duration(seconds: 60), (timer) => fetchCoin());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SearchCard(
                text: "Coin Ara",
                onChanged: (value) => onSearch(value),
              ),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: coinSearchList.length,
                  itemBuilder: (context, index) {
                    return CoinListCard(
                      name: coinSearchList[index].name,
                      symbol: coinSearchList[index].symbol,
                      imageUrl: coinSearchList[index].imageUrl,
                      price: coinSearchList[index].price.toDouble(),
                      changePercentage:
                          coinSearchList[index].changePercentage.toDouble(),
                      ath_date: coinSearchList[index].ath_date,
                      ath: coinSearchList[index].ath.toDouble(),
                      high_24h: coinSearchList[index].high_24h.toDouble(),
                      low_24h: coinSearchList[index].low_24h.toDouble(),
                      market_cap_rank:
                          coinSearchList[index].market_cap_rank.toDouble(),
                      market_cap: coinSearchList[index].market_cap.toDouble(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
