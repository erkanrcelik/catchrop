import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import '../../../../init/theme/color/colors.dart';
import '../../../../widget/text/large_text.dart';
import '../../../../widget/text/medium_text.dart';
import '../../../../widget/text/small_text.dart';
import '../../login/view/login_screen.dart';
import '../../register/view/register_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: 'Kayıt Ol',
      finishButtonTextStyle: const TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      onFinish: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RegisterScreen(),
          ),
        );
      },
      skipTextButton:
          SmallText(text: "Atla", color: ProductColorsTheme().firstColor),
      trailing:
          SmallText(text: "Giriş Yap", color: ProductColorsTheme().firstColor),
      trailingFunction: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
      controllerColor: ProductColorsTheme().firstColor,
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      background: [
        Image.asset(
          'assets/images/sp2.png',
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width,
        ),
        Image.asset(
          'assets/images/sp3.png',
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width,
        ),
        Image.asset(
          'assets/images/sp1.png',
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width,
        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              LargeText(text: "Hızlı", color: ProductColorsTheme().secondColor),
              const SizedBox(
                height: 20,
              ),
              MediumText(
                  text:
                      "Sizlere piyasda görebileceğiniz en hızlı kripto para takip sistemini sunuyoruz",
                  color: ProductColorsTheme().searchTextColor)
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              LargeText(
                  text: "Tasarım", color: ProductColorsTheme().secondColor),
              const SizedBox(
                height: 20,
              ),
              MediumText(
                  text:
                      "Yetenekli tasarımcılarımız tarafından yapılan tasarımlar ile keyifli kullanım sağlıyoruz.",
                  color: ProductColorsTheme().searchTextColor)
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              LargeText(
                  text: "Güvenli", color: ProductColorsTheme().secondColor),
              const SizedBox(
                height: 20,
              ),
              MediumText(
                  text:
                      "Uygulama içerisinde paylaştığınız tüm bilgilerk KVKK kanunu kapsamında koruma altındadır.",
                  color: ProductColorsTheme().searchTextColor)
            ],
          ),
        ),
      ],
    );
  }
}
