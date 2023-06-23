import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

import '../../../../init/theme/color/colors.dart';
import '../../../../widget/button/general_button.dart';
import '../../../../widget/text/medium_text.dart';
import '../../../../widget/text/small_text.dart';
import '../../../../widget/text/smalls_text.dart';
import '../../../../widget/textfield/text_fields.dart';
import '../../../authentication/login/view/login_screen.dart';
import '../models/user_model.dart';

class NullPersonalInformationScreen extends StatelessWidget {
  const NullPersonalInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MediumText(
            text: "Kullanıcı Bilgileri",
            color: ProductColorsTheme().secondColor),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SmallText(
                text: "Lütfen Giriş Yapınız",
                color: ProductColorsTheme().secondColor),
            SizedBox(
              height: 15,
            ),
            SmallsText(
                text:
                    "Şu anda giriş yapmadığınız için bilgilerinize erişemiyorsunuz",
                color: ProductColorsTheme().searchTextColor),
            SizedBox(
              height: 15,
            ),
            GeneralButton(
                text: "Giriş yap",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                })
          ],
        ),
      ),
    );
  }
}

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  userUpdate(users user) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update(user.toJson())
        .whenComplete(() => print("User Update Succesfuly"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: MediumText(
              text: "Kullanıcı Bilgileri",
              color: ProductColorsTheme().secondColor),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WidgetCircularAnimator(
                    innerAnimation: Curves.elasticOut,
                    outerAnimation: Curves.elasticInOut,
                    outerAnimationSeconds: 3,
                    innerAnimationSeconds: 2,
                    innerColor: ProductColorsTheme().searchTextColor,
                    outerColor: ProductColorsTheme().searchTextColor,
                    size: 125,
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: ProductColorsTheme().firstColor,
                    )),
                NameTextField(text: "Ad Soyad", controller: nameController),
                EMailTextField(
                    text: "Mail Adresiniz", controller: mailController),
                PasswordTextField(
                    text: "Şifreniz", controller: passwordController),
                SizedBox(
                  height: 20,
                ),
                GeneralButton(
                    text: "Güncelle",
                    onPressed: () {
                      users user = users(
                          name: nameController.text,
                          mail: mailController.text,
                          password: passwordController.text);
                      userUpdate(user);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
