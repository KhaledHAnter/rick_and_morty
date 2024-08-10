import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://rickandmortyapi.com/api';

  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get("$_baseUrl$endpoint");
    return response.data;
  }

  Future<Map<String, dynamic>> getCharacterById(
      {required String endpoint, required String id}) async {
    var response = await _dio.get("$_baseUrl$endpoint$id");
    return response.data;
  }

  Future<Map<String, dynamic>> search(
      {required String value,
      required String gender,
      required String status}) async {
    final String baseUrl =
        "https://rickandmortyapi.com/api/character?name=$value";
    final String genderFilter = (gender != "gender" ? "&gender=$gender" : "");
    final String statusFilter = (status != "All" ? "&status=$status" : "");
    final response = await Dio().get(baseUrl + genderFilter + statusFilter);

    return response.data;
  }
}
