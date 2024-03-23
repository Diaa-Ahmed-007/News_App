import 'package:flutter/material.dart';
import 'package:news_app/layouts/home/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = "splash";
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
          const Duration(
            seconds: 3,
          ), () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      }),
      builder: (context, snapshot) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/BG.jpg"), fit: BoxFit.cover),
          ),
          child: Scaffold(
            body: Center(
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
        );
      },
    );
  }
}
