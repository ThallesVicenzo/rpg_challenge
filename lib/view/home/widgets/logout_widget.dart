import 'package:flutter/material.dart';
import 'package:rpg_challenge/view_model/providers/home_provider.dart';
import 'package:rpg_challenge/view_model/providers/splash_screen_provider.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget(
      {super.key,
      required this.theme,
      required this.homeProvider,
      required this.splashScreenProvider});

  final ThemeData theme;
  final HomeProvider homeProvider;
  final SplashScreenProvider splashScreenProvider;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: theme.primaryColor,
      title: Text(
        'Tem certeza que deseja fazer logout?',
        style: theme.textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancelar',
            style: theme.textTheme.bodyMedium,
          ),
        ),
        TextButton(
          onPressed: () {
            homeProvider.logout(context, splashScreenProvider);
          },
          child: Text(
            'Confirmar',
            style: theme.textTheme.bodyMedium,
          ),
        )
      ],
    );
  }
}
