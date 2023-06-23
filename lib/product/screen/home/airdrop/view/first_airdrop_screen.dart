import 'package:flutter/material.dart';

import '../../../../init/theme/color/colors.dart';
import '../../../../widget/card/airdrop_card.dart';
import '../../../../widget/text/large_text.dart';
import '../../learn/view/learn_detail_screen.dart';

class FirstAirdropScreen extends StatelessWidget {
  const FirstAirdropScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Divider(
            color: ProductColorsTheme().thirdColor,
            height: 1,
            thickness: 2,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const LargeText(text: "Defi token", color: Colors.black),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LearnDetailScreen(
                    title: "Age of Tanks",
                    text: "Airdrop",
                    title2: "A.O.T",
                    blogContent:
                        "CMC X GEMS NFT Airdrop: Katılın ve 100.000 Dolarlık Ödülü Paylaşın! İnanılmaz NFT Airdrop'umuza katılarak GEMS IDO Whitelist spotlarını ve GEMS NFT airdroplarını kazanma fırsatını yakalayın! Yaklaşan TGE'mizi kutlamak için GEMS, 1200 şanslı kazanana toplam 100.000 \$ değerinde ödül veriyor. Tek yapmanız gereken aşağıdaki görevleri tamamlamak",
                    rate: 4.3,
                    imagePath: "assets/images/airdrop3.png",
                  ),
                ),
              ),
              child: AirdropCard(
                  airdropName: "Age of Tanks",
                  airdropAmountValue: "15K",
                  airdropDateValue: "7 gün",
                  image1: "assets/images/airdrop_banner3.jpg",
                  image2: "assets/images/airdrop3.png",
                  color1: Colors.yellow,
                  backgroundColor: ProductColorsTheme().airdropCardColor9),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.06,
            ),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LearnDetailScreen(
                    title: "MetaGear",
                    text: "Öğren",
                    title2: "GEAR",
                    blogContent:
                        "MetaGear, modern bir Pixel dünyası olan Metaverse'in kapılarını açan popüler TV programı ''ROBOT WARS''ta süper arabalar arasındaki yoğun savaşlardan ilham alıyor. Bu dünyada oyuncular mucit olarak hareket eder ve kendi savaş makinelerini tasarlar. Her makine parçasının kendine has özellikleri vardır ve sonsuz olanaklar için kullanılabilir. Oyuncuların Kampanya, PvP, Turnuva ve Lonca arasından seçim yapabilecekleri 4 oyun modu vardır. Beceriler, yaratıcılık ve biraz şansla, savaşlarda zafer ilan edecek ve değerli NFT'ler kazanacaksınız.",
                    rate: 4.3,
                    imagePath: "assets/images/airdrop4.png",
                  ),
                ),
              ),
              child: AirdropCard(
                  airdropName: "MetaGear",
                  airdropAmountValue: "350K",
                  airdropDateValue: "51 gün",
                  image1: "assets/images/airdrop_banner4.jpg",
                  image2: "assets/images/airdrop4.png",
                  color1: Colors.pink,
                  backgroundColor: ProductColorsTheme().airdropCardColor10),
            )
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LearnDetailScreen(
                    title: "Spintop",
                    text: "Öğren",
                    title2: "SPIN",
                    blogContent:
                        "Spintop'un vizyonu, dağınık blok zinciri oyun dünyasını birleştiren tek bir platform oluşturmaktır. Oyuncular, yatırımcılar ve oyun geliştiriciler topluluğunun oyunları keşfedebileceği, oynayabileceği ve yatırım yapabileceği, jetonlarını alıp takas edebileceği ve NFT'leri paylaşabileceği dinamik bir GameFi ekosistemi olarak tasarlanan Spintop, blok zinciri oyunlarını sonuna kadar deneyimlemek için ihtiyacınız olan araçlara sahiptir.",
                    rate: 4.3,
                    imagePath: "assets/images/airdrop1.png",
                  ),
                ),
              ),
              child: AirdropCard(
                  airdropName: "Spintop",
                  airdropAmountValue: "243",
                  airdropDateValue: "1 gün",
                  image1: "assets/images/airdrop_banner1.jpg",
                  image2: "assets/images/airdrop1.png",
                  color1: Colors.yellow,
                  backgroundColor: ProductColorsTheme().airdropCardColor),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.06,
            ),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LearnDetailScreen(
                    title: "GEMS Esports",
                    text: "Öğren",
                    title2: "GEAR",
                    blogContent:
                        "CMC X GEMS NFT Airdrop: Katılın ve 100.000 Dolarlık Ödülü Paylaşın! İnanılmaz NFT Airdrop'umuza katılarak GEMS IDO Whitelist spotlarını ve GEMS NFT airdroplarını kazanma fırsatını yakalayın! Yaklaşan TGE'mizi kutlamak için GEMS, 1200 şanslı kazanana toplam 100.000 \$ değerinde ödül veriyor. Tek yapmanız gereken aşağıdaki görevleri tamamlamak",
                    rate: 4.3,
                    imagePath: "assets/images/airdrop2.png",
                  ),
                ),
              ),
              child: AirdropCard(
                  airdropName: "GEMS Esports",
                  airdropAmountValue: "16M",
                  airdropDateValue: "99 gün",
                  image1: "assets/images/airdrop_banner2.jpg",
                  image2: "assets/images/airdrop2.png",
                  color1: Colors.pink,
                  backgroundColor: ProductColorsTheme().airdropCardColor2),
            )
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LearnDetailScreen(
                    title: "Lunar",
                    text: "Öğren",
                    title2: "LNR",
                    blogContent:
                        "Lunar, kripto ve NFT ticaretinin tüm sürecini sorunsuz bir kullanıcı deneyimi ile birbirine bağlı tek bir platformda düzenlemeyi amaçlıyor. LNR, tüm Ay Ekosistemi için bağ dokusu görevi gören bir Binance Akıllı Zincir belirtecidir. Lunar platformunda muazzam bir fayda sağlıyor ve zincirler arası kesintisiz ticareti desteklememize izin veriyor. Ayrıca pasif yansımaları tutuculara dağıtır.",
                    rate: 4.3,
                    imagePath: "assets/images/airdrop5.png",
                  ),
                ),
              ),
              child: AirdropCard(
                  airdropName: "Lunar",
                  airdropAmountValue: "1K",
                  airdropDateValue: "54 gün",
                  image1: "assets/images/airdrop_banner5.jpg",
                  image2: "assets/images/airdrop5.png",
                  color1: Colors.yellow,
                  backgroundColor: ProductColorsTheme().airdropCardColor3),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.06,
            ),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LearnDetailScreen(
                    title: "Zamio",
                    text: "Öğren",
                    title2: "ZAM",
                    blogContent:
                        "Zamio TrillioHeirs NFT, karakterlerin her birinin süper güçlere sahip olduğu paralel meta veri kaynakları fikrinden ilham almıştır. Her NFT'nin kendine has özellikleri vardır ve sonsuz olasılıklar için kullanılabilir. TrillioHeirs sahipleri DAO Yönetişimi'ne katılabilir, ZAMpad'e artırılmış garantili tahsisler alabilir, Özel Havuzlara ve Tohum Havuzlarına katılma fırsatı elde edebilir, Ödül Havuzlarından gelir toplayabilir, SandBox'ta Zamio meta evreninde NFT kullanabilir ve Play2Earn Game'de para kazanabilir. Beceriler, yaratıcılık ve biraz şansla, NFT'lerinizi Zamio ekosistem yönetimine katılmak ve \$ZAM jetonları kazanmak için kullanabilirsiniz.",
                    rate: 4.3,
                    imagePath: "assets/images/airdrop6.png",
                  ),
                ),
              ),
              child: AirdropCard(
                  airdropName: "Zamio",
                  airdropAmountValue: "339K",
                  airdropDateValue: "23 gün",
                  image1: "assets/images/airdrop_banner6.jpg",
                  image2: "assets/images/airdrop6.png",
                  color1: Colors.pink,
                  backgroundColor: ProductColorsTheme().airdropCardColor4),
            )
          ],
        ),
      ],
    );
  }
}
