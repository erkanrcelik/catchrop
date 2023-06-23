import 'package:catchrop_v1/product/screen/home/settings/view/personal_information_screen.dart';
import 'package:catchrop_v1/product/screen/home/settings/view/security_screen.dart';
import 'package:catchrop_v1/product/screen/home/settings/view/terms_and_conditions_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widget/card/search_card.dart';
import '../../../../init/theme/color/colors.dart';
import '../../../../utils/file_utils.dart';
import '../../../../widget/listtile/settings_list_tile.dart';
import '../../../../widget/text/medium_text.dart';
import '../../../../widget/text/smalls_text.dart';
import '../../../authentication/login/view/login_screen.dart';
import 'help_and_support_screen.dart';

class SettingsPageScreen extends StatefulWidget {
  const SettingsPageScreen({Key? key}) : super(key: key);

  @override
  State<SettingsPageScreen> createState() => _SettingsPageScreenState();
}

class _SettingsPageScreenState extends State<SettingsPageScreen> {
  String textData = '';
  getFileData() async {
    String privacyText;
    privacyText =
        await FileUtils.readFromFile().then((value) => textData = value);

    setState(() {
      textData = privacyText;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getFileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 67, 40, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: MediumText(
                      text: "Ayarlar", color: ProductColorsTheme().secondColor),
                ),
                SizedBox(
                  height: 16,
                ),
                SearchCard(text: "Ayarlarda ara.."),
                const SizedBox(
                  height: 20,
                ),
                MediumText(
                    text: "Profil", color: ProductColorsTheme().secondColor),
                const SizedBox(
                  height: 20,
                ),
                SettingsListTile(
                  icons: Icons.person,
                  text: "Kullanıcı Bilgileri",
                  onTaps: () {
                    if (FirebaseAuth.instance.currentUser == null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NullPersonalInformationScreen(),
                          ));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PersonalInformationScreen(),
                          ));
                    }
                  },
                  onLongPresss: () {},
                ),
                SettingsListTile(
                  icons: Icons.help,
                  text: "Yardım ve Destek",
                  onTaps: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HelpAndSupportScreen(),
                        ));
                  },
                  onLongPresss: () {},
                ),
                MediumText(
                    text: "Tercihler", color: ProductColorsTheme().secondColor),
                const SizedBox(
                  height: 20,
                ),
                SettingsListTile(
                  icons: Icons.security,
                  text: "Güvenlik",
                  onTaps: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecurityScreen(),
                        ));
                  },
                  onLongPresss: () {},
                ),
                SettingsListTile(
                  icons: Icons.notifications,
                  text: "Bildirim Ayarları",
                  onTaps: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: MediumText(
                                text: "Bildirimler",
                                color: ProductColorsTheme().secondColor),
                            content: SmallsText(
                                text:
                                    "Tüm bildirimleriniz burada gözükecektir.",
                                color: ProductColorsTheme().searchTextColor));
                      },
                    );
                  },
                  onLongPresss: () {},
                ),
                SettingsListTile(
                  icons: Icons.task_alt_outlined,
                  text: "Şartlar ve Koşullar",
                  onTaps: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TermsAndConditionsScreen(),
                        ));
                  },
                  onLongPresss: () {},
                ),
                MediumText(
                    text: "Diğer", color: ProductColorsTheme().secondColor),
                const SizedBox(
                  height: 20,
                ),
                SettingsListTile(
                  icons: Icons.login,
                  text: FirebaseAuth.instance.currentUser == null
                      ? "Giriş Yap"
                      : "Çıkış Yap",
                  onTaps: () {
                    FirebaseAuth.instance.signOut().then((users) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => LoginScreen()),
                          (Route<dynamic> route) => false);
                    });
                  },
                  onLongPresss: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
