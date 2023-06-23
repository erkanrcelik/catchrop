import 'package:flutter/material.dart';

import '../../init/theme/color/colors.dart';
import '../text/smalls_text.dart';

class EMailTextField extends StatelessWidget {
  const EMailTextField({
    Key? key,
    required this.text,
    this.controller,
  }) : super(key: key);

  final String text;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmallsText(text: text, color: ProductColorsTheme().searchTextColor),
          TextField(
            controller: controller,
            decoration: InputDecoration(
                hintText: "Mail Adresinizi giriniz",
                hintStyle: TextStyle(
                  color: ProductColorsTheme().textColor,
                  fontFamily: "Poppins",
                  fontSize: 13,
                ),
                suffixIcon: Icon(Icons.local_post_office_outlined,
                    color: ProductColorsTheme().firstColor),
                fillColor: Colors.red),
          ),
        ],
      ),
    );
  }
}

class NameTextField extends StatelessWidget {
  const NameTextField({
    Key? key,
    required this.text,
    required this.controller,
  }) : super(key: key);

  final String text;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmallsText(text: text, color: ProductColorsTheme().searchTextColor),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Adınızı ve Soyadınızı giriniz",
              hintStyle: TextStyle(
                color: ProductColorsTheme().textColor,
                fontFamily: "Poppins",
                fontSize: 13,
              ),
              suffixIcon: Icon(Icons.abc_outlined,
                  color: ProductColorsTheme().firstColor),
            ),
          ),
        ],
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
    required this.text,
    this.controller,
  }) : super(key: key);

  final String text;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmallsText(text: text, color: ProductColorsTheme().searchTextColor),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Şifrenizi giriniz",
              hintStyle: TextStyle(
                color: ProductColorsTheme().textColor,
                fontFamily: "Poppins",
                fontSize: 13,
              ),
              suffixIcon: Icon(Icons.password_outlined,
                  color: ProductColorsTheme().firstColor),
            ),
          ),
        ],
      ),
    );
  }
}

class SubjectTextField extends StatelessWidget {
  const SubjectTextField({
    Key? key,
    required this.text,
    required this.controller,
  }) : super(key: key);

  final String text;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmallsText(text: text, color: ProductColorsTheme().searchTextColor),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Hangi konuda yardım almak istiyorsunuz",
              hintStyle: TextStyle(
                color: ProductColorsTheme().textColor,
                fontFamily: "Poppins",
                fontSize: 13,
              ),
              suffixIcon:
                  Icon(Icons.subject, color: ProductColorsTheme().firstColor),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageTextField extends StatelessWidget {
  const MessageTextField({
    Key? key,
    required this.text,
    required this.controller,
  }) : super(key: key);

  final String text;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmallsText(text: text, color: ProductColorsTheme().searchTextColor),
          TextField(
            controller: controller,
            minLines: 6,
            maxLines: 7,
            decoration: InputDecoration(
              hintText: "Bize ulaştırmak istediğiniz mesajı giriniz",
              hintStyle: TextStyle(
                color: ProductColorsTheme().textColor,
                fontFamily: "Poppins",
                fontSize: 13,
              ),
              suffixIcon:
                  Icon(Icons.message, color: ProductColorsTheme().firstColor),
            ),
          ),
        ],
      ),
    );
  }
}
