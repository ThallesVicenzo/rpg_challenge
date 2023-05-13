import 'package:rpg_challenge/model/service/dio_service.dart';

class ApiRepository {
  static Future<String?> defineUri(String email, String password) async {
    String? response = await DioService.postUser(body: {
      'email': email,
      'senha': password,
    });

    return response;
  }
}
