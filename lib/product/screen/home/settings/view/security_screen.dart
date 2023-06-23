import 'package:flutter/material.dart';

import '../../../../init/theme/color/colors.dart';
import '../../../../widget/text/medium_text.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MediumText(
            text: "Güvenlik", color: ProductColorsTheme().secondColor),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/sp1.png",
                width: 100,
                height: 100,
              ),
              MediumText(
                  text: "Güvenlik",
                  color: ProductColorsTheme().searchTextColor),
              Divider(
                height: 40,
                color: ProductColorsTheme().textColor,
                thickness: 1,
              ),
              Text(
                "Catchrop Yönetimi, kurum çapında gizliliği, bütünlüğü ve tüm fiziksel ve elektronik bilgi varlıklarını korumak için taahhütte bulunmuştur. Bilgi ve bilgi güvenliği gereksinimleri kurumsal hedefler ile aynı doğrultuda olacaktır. Ayrıca, ilgili teknolojik gelişmeleri yakından takip etmek, günlük operasyonel işler yapılırken, hizmet kalitesini artırıcı, önleyici faaliyetler ile sorunlar oluşmadan önlem almak hedefleri oluşturulmuştur.Bu nedenle Catchrop'un bilgi güvenliğini yönetmekteki amacı (bilginin gizlilik, bütünlük ve erişilebilirlik kapsamında değerlendirilerek içeriden ve/veya dışarıdan gelebilecek, kasıtlı veya kazayla oluşabilecek tüm tehditlerden korunması ve yürütülen faaliyetlerin etkin, doğru, hızlı ve güvenli olarak gerçekleştirilmesini temin etmek) olarak özetlenebilir.",
                style: TextStyle(
                    color: ProductColorsTheme().textColor,
                    fontSize: 13,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
