import 'package:flutter/material.dart';
import 'package:rpg_challenge/model/models/games_content.dart';
import 'package:rpg_challenge/model/models/games_list.dart';
import 'package:rpg_challenge/view_model/providers/splash_screen_provider.dart';
import 'package:rpg_challenge/view_model/repositories/api_repository.dart';
import 'package:rpg_challenge/view_model/repositories/local_data_base_repository.dart';

class HomeProvider with ChangeNotifier {
  List<GamesContentModel>? gamesContentList = [];
  late GamesListModel gamesList;
  int page = 0;

  Future<void> logout(
      context, SplashScreenProvider splashScreenProvider) async {
    splashScreenProvider.token = null;

    await LocalDataBaseRepository.deleteToken(context);
  }

  Future<void> getGamesList({required int page}) async {
    gamesContentList = await ApiRepository.convertJsonToGamesContentModel(page);
  }

  bool definePageButtonsVisibility() {
    if (page > 0) {
      return true;
    } else {
      return false;
    }
  }

  void changePageValues({
    bool? goToNextPage,
    bool? goUpTwoPages,
    bool? goUpThreePages,
    bool? goUpFourPages,
    bool? goToPreviousPage,
    bool? goToPageOne,
    bool? goToLastPage,
  }) async {
    if (goToPageOne == true) {
      page = 0;
    }
    if (goToNextPage == true) {
      page = page + 1;
    }
    if (goUpTwoPages == true) {
      page = page + 2;
    }
    if (goUpThreePages == true) {
      page = page + 3;
    }
    if (goUpFourPages == true) {
      page = page + 4;
    }
    if (goToPreviousPage == true) {
      page = page - 1;
    }
    notifyListeners();
  }

  Future<void> updatePage({
    bool? goToNextPage,
    bool? goUpTwoPages,
    bool? goUpThreePages,
    bool? goUpFourPages,
    bool? goToPageOne,
    bool? goToPreviousPage,
    bool? goToLastPage,
  }) async {
    changePageValues(
      goToPageOne: goToPageOne,
      goToLastPage: goToLastPage,
      goToNextPage: goToNextPage,
      goUpTwoPages: goUpTwoPages,
      goUpThreePages: goUpThreePages,
      goUpFourPages: goUpFourPages,
      goToPreviousPage: goToPreviousPage,
    );
    gamesContentList!.clear();

    List<GamesContentModel>? newGamesList =
        await ApiRepository.convertJsonToGamesContentModel(page);

    gamesContentList!.addAll(newGamesList!);

    notifyListeners();
  }
}
