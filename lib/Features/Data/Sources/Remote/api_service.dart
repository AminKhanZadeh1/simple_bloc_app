import 'package:bloc_app/Config/API/api_config.dart';
import 'package:dio/dio.dart';

class ApiService {
  Dio dio = Dio();
  // Get data from API
  Future<dynamic> callGet() async {
    final response = await dio.get(ApiConfig.baseUrl);

    print(response.data);

    return response.data;
  }

  // Post data to API
  void callPost({required Map<String, dynamic> body}) async {
    await dio.post(ApiConfig.baseUrl, data: body);
  }

  // Delete data from API
  void callDelete({required Map<String, dynamic> body}) async {
    await dio.delete(ApiConfig.baseUrl, data: body);
  }
}
