import 'package:dio/dio.dart';

class DioService {
  static Future<String?> postUser({Map<String, String>? body}) async {
    try {
      final dio = Dio();
      final response =
          await dio.post('http://206.189.206.44:8080/login', data: body);
      if (response.statusCode == 200) {
        return response.data.toString();
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }
}
