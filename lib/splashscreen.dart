// ignore_for_file: file_names

import 'package:admin_panel/loginscreen.dart';
import 'package:admin_panel/main.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash: 
    Column(
      children: [
        Center(
          child: LottieBuilder.asset("assets/lottie/Animation - 1709973112737.json"),
        )
      ],
    ), nextScreen: const LoginScreen(),
    splashIconSize: 500,
    backgroundColor:const Color.fromARGB(255, 229, 68, 56),
    );
  }
}