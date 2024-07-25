import 'package:dio/dio.dart';

class ApiRequest {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://mockapi.io/api/v1',
    headers: {
      'Content-Type': 'application/json',
    },
  ));

  Future<dynamic> get(String endpoint) async {
    final response = await _dio.get(endpoint);
    return response.data;
  }

  Future<dynamic> post(String endpoint, {Map<String, dynamic>? data}) async {
    final response = await _dio.post(endpoint, data: data);
    return response.data;
  }

  Future<dynamic> put(String endpoint, {Map<String, dynamic>? data}) async {
    final response = await _dio.put(endpoint, data: data);
    return response.data;
  }

  Future<dynamic> delete(String endpoint) async {
    final response = await _dio.delete(endpoint);
    return response.data;
  }
}
