import 'package:catchrop_v1/product/screen/authentication/register/view/register_successful_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/texts/authentication_texts_tr.dart';
import '../../../../../core/widget/card/social_media_icon.dart';
import '../../../../init/theme/color/colors.dart';
import '../../../../services/auth.dart';
import '../../../../widget/button/general_button.dart';
import '../../../../widget/customSnackBar.dart';
import '../../../../widget/text/large_text.dart';
import '../../../../widget/text/medium_text.dart';
import '../../../../widget/text/smalls_text.dart';
import '../../../../widget/textfield/text_fields.dart';
import '../../../navigation_bar/view/bottom_navigation_bar.dart';
import '../../login/view/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();

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
                        text: AuthenticationTextsTr().user,
                        color: ProductColorsTheme().textColor),
                    const SizedBox(
                      width: 3,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                      child: SmallsText(
                          text: AuthenticationTextsTr().login,
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
                            text: AuthenticationTextsTr().register,
                            color: Colors.black),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    NameTextField(
                        text: AuthenticationTextsTr().name,
                        controller: _fullNameController),
                    EMailTextField(
                        text: AuthenticationTextsTr().eMail,
                        controller: _emailController),
                    PasswordTextField(
                        text: AuthenticationTextsTr().password,
                        controller: _passwordController),
                    PasswordTextField(
                        text: AuthenticationTextsTr().againPassword,
                        controller: _passwordAgainController),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GeneralButton(
                      text: AuthenticationTextsTr().register,
                      onPressed: () {
                        if (_validateInputs()) {
                          _authService.createPerson(
                            _fullNameController.text,
                            _emailController.text,
                            _passwordController.text,
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterSuccessfulScreen(),
                            ),
                          );
                        } else {
                          CustomSnackBar.show(
                            context,
                            'Kayıt olma sırasında bir hata oluştu. Lütfen tekrar deneyin.',
                          );
                        }
                      },
                    )
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
                        child: const SocialMediaIcon(image: "google")),
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
                                        "Çok yakında Google hesabınız ile giriş yapabileceksiniz",
                                    color:
                                        ProductColorsTheme().searchTextColor));
                          },
                        );
                      },
                      child: const SocialMediaIcon(
                        image: "github",
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  bool _validateInputs() {
    if (_fullNameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _passwordAgainController.text.isEmpty) {
      CustomSnackBar.show(
        context,
        'Tüm alanları doldurmalısınız.',
      );
      return false;
    }

    if (!isEmailValid(_emailController.text)) {
      CustomSnackBar.show(
        context,
        'Geçerli bir e-posta adresi girin.',
      );
      return false;
    }

    if (_passwordController.text.length < 8) {
      CustomSnackBar.show(
        context,
        'Şifre en az 8 karakter uzunluğunda olmalıdır.',
      );
      return false;
    }

    if (_passwordController.text != _passwordAgainController.text) {
      CustomSnackBar.show(
        context,
        'Şifreler eşleşmiyor.',
      );
      return false;
    }

    return true;
  }

  bool isEmailValid(String email) {
    // E-posta geçerlilik kontrolü yapılabilir
    // Burada örnek bir kontrol işlemi gerçekleştiriyoruz
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }
}
