import 'package:flutter/material.dart';
import 'package:rpg_challenge/model/models/games_content.dart';
import 'package:rpg_challenge/view_model/providers/splash_screen_provider.dart';
import 'package:rpg_challenge/view_model/repositories/api_repository.dart';
import 'package:rpg_challenge/view_model/repositories/local_data_base_repository.dart';

class HomeProvider with ChangeNotifier {
  List<GamesContentModel> gamesList = [];
  int page = 0;

  Future<void> logout(
      context, SplashScreenProvider splashScreenProvider) async {
    splashScreenProvider.token = null;

    await LocalDataBaseRepository.deleteToken(context);
  }

  Future<void> getGamesList({required int page}) async {
    gamesList = await ApiRepository().getGamesList(page);
  }
}
