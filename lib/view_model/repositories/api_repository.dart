import 'package:rpg_challenge/model/models/games_list.dart';
import 'package:rpg_challenge/model/models/user.dart';
import 'package:rpg_challenge/model/service/dio_service.dart';
import 'package:rpg_challenge/view_model/repositories/local_data_base_repository.dart';

import '../../model/models/games_content.dart';

class ApiRepository {
  static Future<String?> sendData(String email, String password) async {
    String? response = await DioService().postUser(
      body: UserModel(email: email, password: password).toJson(),
    );

    return response;
  }

  Future<List<GamesContentModel>> getGamesList(int pagina) async {
    final token = await LocalDataBaseRepository.callRetrieveData();

    final Map<String, dynamic>? response =
        await DioService().getGamesList(token: token!, pagina: pagina);

    final List<GamesContentModel> gamesList =
        GamesListModel.fromJson(response!).content;

    return gamesList;
  }
}
