import 'package:dio/dio.dart';

class DioService {
  final _dio = Dio();

  Future<String?> postUser({Map<String, String>? body}) async {
    try {
      final response =
          await _dio.post('http://206.189.206.44:8080/login', data: body);
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }

  Future<Map<String, dynamic>?> getGamesList(
      {required String token, required int pagina}) async {
    try {
      final response = await _dio.get(
        'http://206.189.206.44:8080/api/jogo?page=$pagina',
        options: Options(
          headers: {'Authorization': token},
        ),
      );
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }
}
