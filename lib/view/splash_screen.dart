import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rpg_challenge/shared/constants.dart';
import '../view_model/routes/named_routes.dart';

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
    return Scaffold(
      backgroundColor: Theme.of(context).splashColor,
      body: AnimatedOpacity(
        opacity: opacity,
        duration: kThemeAnimationDuration,
        onEnd: () {
          if (opacity == 0) {
            Navigator.pushReplacementNamed(context, NamedRoutes.auth);
          }
        },
        child: Center(
          child: Image.asset(
            kSplashImage,
            scale: 2,
          ),
        ),
      ),
    );
  }
}
