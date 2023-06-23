import 'package:flutter/material.dart';

import '../../../../init/theme/color/colors.dart';
import '../../../../widget/text/medium_text.dart';
import '../../login/view/login_screen.dart';

class RegisterSuccessfulScreen extends StatefulWidget {
  const RegisterSuccessfulScreen({Key? key}) : super(key: key);

  @override
  State<RegisterSuccessfulScreen> createState() =>
      _RegisterSuccessfulScreenState();
}

class _RegisterSuccessfulScreenState extends State<RegisterSuccessfulScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/succes.png",
                width: 250,
                height: 250,
                color: ProductColorsTheme().firstColor,
              ),
              SizedBox(
                height: 30,
              ),
              MediumText(
                  text:
                      "Başarılı ile kayıt oldunuz 3 saniye içerisinde giriş sayfasına yönlendirileceksiniz...",
                  color: ProductColorsTheme().secondColor)
            ],
          ),
        ),
      ),
    );
  }
}
