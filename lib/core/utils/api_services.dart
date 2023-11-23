import 'package:dio/dio.dart';

class ApiServise {
  final Dio _dio;
  final baseUrl = "https://www.googleapis.com/books/v1/";

  ApiServise(this._dio);

  Future<Map<String,dynamic>> get({required String endpoint}) async {
    var response = await _dio.get('$baseUrl$endpoint');

    return response.data;
  }
}
