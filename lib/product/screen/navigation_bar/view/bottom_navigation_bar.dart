import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

import '../../home/airdrop/view/airdrop_page_screen.dart';
import '../../home/homepage/view/home_page_screen.dart';
import '../../home/learn/view/learn_page_screen.dart';
import '../../home/market/view/market_page_screen.dart';
import '../../home/settings/view/null_settings_page_screen.dart';
import '../../home/settings/view/settings_page_screen.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  int _selectedIndex = 0;

  List<Widget> tabItems = [
    HomePageScreen(),
    LearnPageScreen(),
    MarketPageScreen(),
    AirdropPageScreen(),
    FirebaseAuth.instance.currentUser?.email == "admin@gmail.com"
        ? NullSettingsPageScreen()
        : SettingsPageScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.linear,
        selectedIndex: _selectedIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.home),
            title: Text('Anasayfa'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.auto_stories_outlined),
            title: Text('Öğren'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.query_stats_outlined),
            title: Text('Market'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.workspace_premium),
            title: Text('Airdrop'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.settings),
            title: Text('Ayarlar'),
          ),
        ],
      ),
      body: Center(
        child: tabItems[_selectedIndex],
      ),
    );
  }
}
