import 'package:flutter/material.dart';
import 'package:rpg_challenge/shared/theme.dart';
import 'package:rpg_challenge/view_model/routes/named_routes.dart';
import 'package:rpg_challenge/view_model/routes/routes.dart';

void main() {
  runApp(const RpgChallenge());
}

class RpgChallenge extends StatelessWidget {
  const RpgChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Apptheme.appTheme,
      routes: Routes.all(context),
      initialRoute: NamedRoutes.splash,
    );
  }
}
