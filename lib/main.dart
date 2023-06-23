import 'package:catchrop_v1/product/components/texts/project/project_texts.dart';
import 'package:catchrop_v1/product/screen/authentication/intro/view/intro_screen.dart';
import 'package:catchrop_v1/product/screen/authentication/splash/view/splash_screen.dart';
import 'package:catchrop_v1/product/screen/navigation_bar/view/bottom_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'product/screen/home/settings/services/help_and_support_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Catchrop());
}

class Catchrop extends StatelessWidget {
  const Catchrop({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    () => {DatabaseHandler().initializeDB()};
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        "/bottom_navigation_bar": (context) => const BottomNavigationBarView(),
        "/intro_screen": (context) => const IntroScreen(),
      },
      title: ProjectTexts().projectName,
    );
  }
}
