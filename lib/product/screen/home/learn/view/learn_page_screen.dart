import 'package:flutter/material.dart';

import '../../../../widget/card/learn_card.dart';
import '../../../../widget/card/populer_learn_card.dart';
import '../../../../widget/text/medium_text.dart';

class LearnPageScreen extends StatelessWidget {
  LearnPageScreen({Key? key}) : super(key: key);

  final List<PopulerLearnCard> populerLearnCardList = [
    const PopulerLearnCard(
        reading: '15', subtitle: "Erkan Çelik", title: "Bitcoin"),
    const PopulerLearnCard(
        reading: '7', subtitle: "Erkan Çelik", title: "Dogecoin ve Shiba Coin"),
    const PopulerLearnCard(
        reading: '3', subtitle: "Erkan Çelik", title: "Blockchain Teknolojisi"),
  ];

  final List<LearnCard> learnCardList = [
    const LearnCard(
        toptext: "BLOG 1",
        bodytext1: "Bitcoin",
        bodytext2: "01.01.2022",
        bodytext3: "Yazar : Erkan Çelik",
        bottomtext1: "Erkan Çelik",
        bottomtext2: "CATCHROP",
        image: "assets/images/learn_banner1.jpg",
        blogContent:
            "2008 krizi sonrası Satoshi Nakamato adlı kişi ya da kişiler uçtan uca elektronik ödeme sistemi olan Bitcoin'e dair teknik yazılarını yayınladılar. Böylece Bitcoin merkezsizleştirilmiş, üçüncül müdahalelere karşı korumalı kripto para birimi olarak ortaya çıktı. 2009 yılında halka açık ağ olarak kullanıma girdi. Sonrasında Bitcoin, ilk başarılı kripto para olarak '1. nesil blockchain' olarak adlandırıldı."),
    const LearnCard(
        toptext: "BLOG2",
        bodytext1: "Dogecoin ve Shiba Coin",
        bodytext2: "01.01.2022",
        bodytext3: "Yazar : Erkan Çelik",
        bottomtext1: "Erkan Çelik",
        bottomtext2: "CATCHROP",
        image: "assets/images/learn_banner2.jpg",
        blogContent:
            "Dogecoin, Shiba Inu gibi memecoinler son zamanlarda yaptıkları işbirliği ve ortaklıklarla birlikte her ne kadar şaka amaçlı olarak çıkmış olsalar bile büyük projelere imza atmaya başladılar. Şimdi de DOGE ve SHIB'e bu alanda yeni bir rakip daha geldi. Hem de devasa bir işbirliği ile..."),
    const LearnCard(
        toptext: "BLOG3",
        bodytext1: "Blockchain Teknolojisi",
        bodytext2: "01.01.2022",
        bodytext3: "Yazar : Erkan Çelik",
        bottomtext1: "Erkan Çelik",
        bottomtext2: "CATCHROP",
        image: "assets/images/learn_banner3.jpg",
        blogContent:
            "Blockchain, yani Blok Zinciri, bloklardan oluşan zincir yapıyı tanımlıyor. Blockchain, dağınık yapıda bir veritabanı sistemi olarak şifrelenmiş işlemlerin takibini sağlar. Blockchain, iş ağında yer alan işlemlerin kaydedilmesi ve varlıkların takip edilmesi gibi süreçleri kolaylaştırmaktadır. Aynı zamanda bu sistem, paylaşılabilen ve üzerinde değişiklik yapılamayan bir defter olarak da düşünülebilir."),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return LearnPageScreen().learnCardList[index];
                      },
                    ),
                  ),
                  const MediumText(
                      text: "En çok okunan yazılar", color: Colors.black),
                  SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return LearnPageScreen().populerLearnCardList[index];
                      },
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
