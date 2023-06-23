import 'package:flutter/material.dart';

import '../../../../widget/tabbar/buttons_tabbar.dart';
import '../../../../widget/text/large_text.dart';

class AirdropPageScreen extends StatelessWidget {
  const AirdropPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LargeText(text: " Kategoriler", color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1.04,
                  child: const ButtonsTabbar(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
