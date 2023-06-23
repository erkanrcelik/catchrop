import 'package:flutter/material.dart';

import '../../../../init/theme/color/colors.dart';
import '../../../../widget/text/large_text.dart';
import '../../../../widget/text/medium_text.dart';
import '../../../../widget/text/smalls_text.dart';
import '../models/help_and_support_model.dart';
import '../services/help_and_support_service.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MediumText(
            text: "Yönetim Paneli", color: ProductColorsTheme().secondColor),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              LargeText(
                  text: "Yardım ve Destek Talepleri",
                  color: ProductColorsTheme().secondColor),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: FutureBuilder(
                  future: DatabaseHandler().getHelps(),
                  builder: (context, AsyncSnapshot<List<HelpModel>> snap) {
                    if (snap.hasData) {
                      return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: snap.data!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ProductColorsTheme().secondColor),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SmallsText(
                                                text: snap.data![index].name
                                                    .toString(),
                                                color: ProductColorsTheme()
                                                    .secondColor),
                                            SmallsText(
                                                text: snap.data![index].mail
                                                    .toString(),
                                                color: ProductColorsTheme()
                                                    .searchTextColor),
                                          ],
                                        ),
                                        SmallsText(
                                            text: snap.data![index].subject
                                                .toString(),
                                            color: ProductColorsTheme()
                                                .secondColor),
                                      ],
                                    ),
                                    Divider(
                                      color: ProductColorsTheme().secondColor,
                                      thickness: 1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SmallsText(
                                          text: snap.data![index].message
                                              .toString(),
                                          color:
                                              ProductColorsTheme().textColor),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    } else {
                      return Text("Veri Yok");
                    }
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
