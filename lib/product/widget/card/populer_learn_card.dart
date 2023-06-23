import 'package:flutter/material.dart';

import '../../init/theme/color/colors.dart';

class PopulerLearnCard extends StatelessWidget {
  const PopulerLearnCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.reading})
      : super(key: key);
  final String title;
  final String subtitle;
  final String reading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: Image.asset(
          "assets/images/nakre.png",
          width: 50,
          height: 50,
          fit: BoxFit.fill,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: ProductColorsTheme().secondColor),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: ProductColorsTheme().searchTextColor),
        ),
        trailing: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Okunma Sayısı",
                style: TextStyle(
                    color: ProductColorsTheme().textColor,
                    fontSize: 12,
                    fontFamily: "Poppins"),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ProductColorsTheme().thirdColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      reading,
                      style: TextStyle(
                          color: ProductColorsTheme().secondColor,
                          fontSize: 14,
                          fontFamily: "Poppins"),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
