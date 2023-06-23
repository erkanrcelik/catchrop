import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/texts/authentication_texts_tr.dart';
import '../../../../../core/widget/card/social_media_icon.dart';
import '../../../../init/theme/color/colors.dart';
import '../../../../services/auth.dart';
import '../../../../utils/file_utils.dart';
import '../../../../widget/button/general_button.dart';
import '../../../../widget/customSnackBar.dart';
import '../../../../widget/text/large_text.dart';
import '../../../../widget/text/medium_text.dart';
import '../../../../widget/text/smalls_text.dart';
import '../../../../widget/textfield/text_fields.dart';
import '../../../navigation_bar/view/bottom_navigation_bar.dart';
import '../../register/view/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SmallsText(
                        text: AuthenticationTextsTr().newUser,
                        color: ProductColorsTheme().textColor),
                    const SizedBox(
                      width: 3,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ));
                      },
                      child: SmallsText(
                          text: AuthenticationTextsTr().register,
                          color: ProductColorsTheme().firstColor),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LargeText(
                            text: AuthenticationTextsTr().login,
                            color: Colors.black),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    EMailTextField(
                        text: AuthenticationTextsTr().eMail,
                        controller: _emailController),
                    PasswordTextField(
                        text: AuthenticationTextsTr().password,
                        controller: _passwordController),
                    const SizedBox(
                      height: 15,
                    ),
                    SmallsText(
                        text: AuthenticationTextsTr().forgetPassword,
                        color: ProductColorsTheme().textColor),
                    const SizedBox(
                      height: 40,
                    ),
                    GeneralButton(
                      text: AuthenticationTextsTr().login,
                      onPressed: () {
                        if (_emailController.text.isEmpty ||
                            _passwordController.text.isEmpty) {
                          // Eğer bir veya daha fazla alan boş ise hata mesajı göster
                          CustomSnackBar.show(
                              context, 'Lütfen tüm alanları doldurun.');
                        } else {
                          // Tüm alanlar doldurulduysa giriş işlemini yap
                          _authService
                              .signIn(
                            _emailController.text,
                            _passwordController.text,
                          )
                              .then((value) {
                            // Giriş başarılı ise yönlendirme yapabilirsiniz
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BottomNavigationBarView()),
                            );
                          }).catchError((error) {
                            CustomSnackBar.show(context,
                                'Giriş yapılamadı. Kullanıcı adı veya şifre yanlış.');
                            // Giriş başarısız ise hata mesajını göster
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                        onTap: () {
                          FileUtils.saveToFile(
                              DateTime.now().toString().substring(0, 16));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomNavigationBarView(),
                              ));
                        },
                        child: Center(
                          child: SmallsText(
                              text: "Misafir Olarak Devam Et",
                              color: ProductColorsTheme().textColor),
                        )),
                  ],
                ),
                SmallsText(text: "or", color: ProductColorsTheme().textColor),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () async {
                          UserCredential userCredential =
                              await AuthService().signInWithGoogle();
                          User? user = userCredential.user;
                          if (user != null) {
                            String userName = user.displayName ?? '';
                            CustomSnackBar.show(context,
                                'Başarıyla giriş yapıldı. Hoşgeldiniz, $userName!');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BottomNavigationBarView()),
                            );
                          } else {
                            CustomSnackBar.show(
                                context, 'Giriş yaparken bir hata oluştu.');
                          }
                        },
                        child: SocialMediaIcon(image: "google")),
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                title: MediumText(
                                    text: "Yakında!",
                                    color: ProductColorsTheme().secondColor),
                                content: SmallsText(
                                    text:
                                        "Çok yakında Github hesabınız ile giriş yapabileceksiniz",
                                    color:
                                        ProductColorsTheme().searchTextColor));
                          },
                        );
                      },
                      child: SocialMediaIcon(
                        image: "github",
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
