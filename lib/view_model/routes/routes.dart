import 'package:flutter/material.dart';

import '../../view/authentication/authentication_screen.dart';
import '../../view/splash_screen.dart';
import 'named_routes.dart';

class Routes {
  static Map<String, WidgetBuilder> all(BuildContext context) {
    return {
      NamedRoutes.splash: (context) => const SplashScreen(),
      NamedRoutes.auth: (context) => const AuthenticationScreen(),
    };
  }
}
