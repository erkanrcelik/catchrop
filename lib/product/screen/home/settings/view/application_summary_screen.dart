import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../../init/theme/color/colors.dart';
import '../../../../widget/text/medium_text.dart';

class ApplicationSummaryScreen extends StatelessWidget {
  static String routeName = "toplist";
  const ApplicationSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Öğren": 5,
      "Airdrop": 3,
      "Market": 2,
    };
    Map<String, double> dataMap2 = {
      "Defi ": 6,
      "NFT": 6,
      "Metaverse": 6,
    };
    return Scaffold(
        appBar: AppBar(
          title: MediumText(
              text: "Uygulama Özeti", color: ProductColorsTheme().secondColor),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MediumText(
                    text: "Uygulamada Geçirilen Süre(Saat)",
                    color: ProductColorsTheme().secondColor),
                SizedBox(
                  height: 30,
                ),
                graphicsData(dataMap, context),
                Divider(
                  height: 60,
                  color: ProductColorsTheme().secondColor,
                ),
                MediumText(
                    text: "Airdrop Sayıları",
                    color: ProductColorsTheme().secondColor),
                SizedBox(
                  height: 30,
                ),
                graphicsData2(dataMap2, context),
              ],
            ),
          ),
        ));
  }

  PieChart graphicsData2(Map<String, double> dataMap2, BuildContext context) {
    return PieChart(
      dataMap: dataMap2,
      animationDuration: Duration(milliseconds: 5200),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 32,
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: true,
        legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: ProductColorsTheme().secondColor),
      ),
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
    );
  }

  PieChart graphicsData(Map<String, double> dataMap, BuildContext context) {
    return PieChart(
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 1600),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 32,
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: true,
        legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: ProductColorsTheme().secondColor),
      ),
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
    );
  }
}
