import 'package:flutter/material.dart';

import '../../../../init/theme/color/colors.dart';
import '../../../../widget/text/medium_text.dart';
import '../../../../widget/text/smalls_text.dart';
import '../../../../widget/textfield/text_fields.dart';
import '../models/help_and_support_model.dart';
import '../services/help_and_support_service.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({Key? key}) : super(key: key);

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  List<HelpModel> helpModelList = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: MediumText(
            text: "Yardım ve Destek", color: ProductColorsTheme().secondColor),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                NameTextField(text: "Ad Soyad", controller: nameController),
                EMailTextField(text: "Mail Adresi", controller: mailController),
                SubjectTextField(text: "Konu", controller: subjectController),
                MessageTextField(text: "Mesaj", controller: messageController),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    HelpModel model = HelpModel(
                        name: nameController.text,
                        mail: mailController.text,
                        subject: subjectController.text,
                        message: messageController.text);
                    await DatabaseHandler().insertHelps(model);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: MediumText(
                                text: "Gönderildi!",
                                color: ProductColorsTheme().secondColor),
                            content: SmallsText(
                                text:
                                    "Tebrikler yardım talebinizi başarıyla ilettiniz.",
                                color: ProductColorsTheme().searchTextColor));
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.send_sharp,
                        size: 25,
                        color: ProductColorsTheme().firstColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SmallsText(
                          text: "Gönder", color: ProductColorsTheme().textColor)
                    ],
                  ),
                ),
              ],
            ),
          )),
    ));
  }
}
