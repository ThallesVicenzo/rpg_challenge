import 'package:flutter/material.dart';
import 'package:rpg_challenge/model/service/shared_prefferences_service.dart';

import '../routes/named_routes.dart';

class LocalDataBaseRepository {
  static Future<void> callSaveData(String token) async {
    await SharedPrefferencesService.saveData(token);
  }

  static Future<String?> callRetrieveData() async {
    String? token = await SharedPrefferencesService.retrieveData();

    return token;
  }

  static Future<void> deleteToken(context) async {
    await SharedPrefferencesService.deleteData().whenComplete(
      () => Navigator.pushReplacementNamed(context, NamedRoutes.auth),
    );
  }
}
