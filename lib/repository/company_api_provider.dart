
import 'package:dio/dio.dart';
import 'package:flutter_bloc_dio_repository/model/CompaniesResponse.dart';
import 'package:flutter_bloc_dio_repository/utils/LoggingInterceptors.dart';

class CompanyApiProvider {
  Dio get dio => _dio();
  Dio _dio() {
    final options = BaseOptions(
      baseUrl: "https://pinjollist.now.sh/api/",
      connectTimeout: 5000,
      receiveTimeout: 3000,
      contentType: "application/json;charset=utf-8",
    );

    var dio = Dio(options);

    dio.interceptors.add(LoggingInterceptors());

    return dio;
  }

  Future<CompaniesResponse> getCompanies() async {
    try {
      Response response = await dio.get("companies");
      return CompaniesResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}