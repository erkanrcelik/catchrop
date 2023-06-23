import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../init/theme/color/colors.dart';
import '../../../../widget/card/coin_list_card.dart';
import '../../../../widget/icon/general_icon.dart';
import '../../../../widget/text/medium_text.dart';
import '../../../../widget/text/small_text.dart';
import '../../../../widget/text/smalls_text.dart';
import '../../market/model/coin_model.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false'));

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
    Timer.periodic(const Duration(seconds: 60), (timer) => fetchCoin());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1634704784915-aacf363b021f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1624996379697-f01d168b1a52?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1621932953986-15fcf084da0f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80',
    ];
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                        item,
                        fit: BoxFit.cover,
                        width: 1000.0,
                        height: 1000.0,
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                        ),
                      ),
                    ],
                  )),
            ))
        .toList();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const GeneralIcon(icons: Icons.settings),
                      ),
                      MediumText(
                          text: "Home",
                          color: ProductColorsTheme().secondColor),
                      InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    title: MediumText(
                                        text: "Bildirimler",
                                        color:
                                            ProductColorsTheme().secondColor),
                                    content: SmallsText(
                                        text:
                                            "Tüm bildirimleriniz burada gözükecektir.",
                                        color: ProductColorsTheme()
                                            .searchTextColor));
                              },
                            );
                          },
                          child: const GeneralIcon(icons: Icons.notifications)),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 41),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      autoPlay: true,
                    ),
                    items: imageSliders,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
                  child: ListTile(
                    leading: SmallText(
                        text: "Popüler",
                        color: ProductColorsTheme().secondColor),
                    trailing: Icon(
                      Icons.subdirectory_arrow_right,
                      color: ProductColorsTheme().firstColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 1,
                  color: ProductColorsTheme().searchTextColor,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: coinList.length,
                      itemBuilder: (context, index) {
                        return CoinListCard(
                          name: coinList[index].name,
                          symbol: coinList[index].symbol,
                          imageUrl: coinList[index].imageUrl,
                          price: coinList[index].price.toDouble(),
                          changePercentage:
                              coinList[index].changePercentage.toDouble(),
                          ath_date: coinList[index].ath_date,
                          ath: coinList[index].ath.toDouble(),
                          high_24h: coinList[index].high_24h.toDouble(),
                          low_24h: coinList[index].low_24h.toDouble(),
                          market_cap_rank:
                              coinList[index].market_cap_rank.toDouble(),
                          market_cap: coinList[index].market_cap.toDouble(),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
