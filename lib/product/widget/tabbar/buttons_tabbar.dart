import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../../screen/home/airdrop/view/first_airdrop_screen.dart';
import '../../screen/home/airdrop/view/second_airdrop_screen.dart';
import '../../screen/home/airdrop/view/third_airdrop_screen.dart';
import '../text/medium_text.dart';

class ButtonsTabbar extends StatelessWidget {
  const ButtonsTabbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[
          ButtonsTabBar(
            contentPadding: const EdgeInsets.all(0),
            height: 150,
            unselectedBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            labelStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            tabs: [
              Tab(
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "assets/images/airdrop_categories1.png"))),
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: const Center(
                    child: MediumText(text: "DeFi token", color: Colors.white),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "assets/images/airdrop_categories2.png"))),
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: const Center(
                    child: MediumText(text: "NFT token", color: Colors.white),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "assets/images/airdrop_categories3.png"))),
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: const Center(
                    child: MediumText(
                        text: "Metaverse token", color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const Expanded(
            child: TabBarView(
              physics: BouncingScrollPhysics(),
              children: [
                FirstAirdropScreen(),
                SecondAirdropScreen(),
                ThirdAirdropScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
