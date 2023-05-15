import 'package:flutter/material.dart';
import 'package:rpg_challenge/view_model/repositories/local_data_base_repository.dart';

import '../routes/named_routes.dart';

class SplashScreenProvider with ChangeNotifier {
  String? token;

  Future<void> retrieveData(context) async {
    token = await LocalDataBaseRepository.callRetrieveData();
    if (token == null) {
      Navigator.pushReplacementNamed(context, NamedRoutes.auth);
    } else {
      Navigator.pushReplacementNamed(context, NamedRoutes.home);
    }
    notifyListeners();
  }
}
