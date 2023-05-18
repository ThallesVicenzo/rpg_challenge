import 'package:flutter/material.dart';
import 'package:rpg_challenge/model/models/game_details.dart';
import 'package:rpg_challenge/view_model/repositories/api_repository.dart';

class DetailsProvider with ChangeNotifier {
  GamesDetailsModel? gameDetails;

  Future<void> getGameDetails(int id) async {
    gameDetails =
        await ApiRepository.convertJsonToGamesDetailsModel(gameId: id);
  }

  Widget returnTextWidget(ThemeData theme) {
    if (gameDetails!.expansao == true) {
      return Text(
        '❗ Esse é um jogo do tipo expansão!',
        style: theme.textTheme.bodyMedium!.copyWith(color: theme.primaryColor),
      );
    }
    return Text(
      '❗ Esse não é um jogo do tipo expansão!',
      style: theme.textTheme.bodyMedium!.copyWith(color: theme.primaryColor),
    );
  }
}
