import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg_challenge/shared/constants.dart';
import 'package:rpg_challenge/view_model/providers/splash_screen_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  double opacity = 1;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 3500), () {
      setState(() {
        opacity = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashScreenProvider>(
      builder: (context, splashScreenProvider, _) => Scaffold(
        body: AnimatedOpacity(
          opacity: opacity,
          duration: kThemeAnimationDuration,
          onEnd: () {
            if (opacity == 0) {
              splashScreenProvider.retrieveData(context);
            }
          },
          child: Center(
            child: Image.asset(
              kSplashImage,
              scale: 2,
            ),
          ),
        ),
      ),
    );
  }
}
