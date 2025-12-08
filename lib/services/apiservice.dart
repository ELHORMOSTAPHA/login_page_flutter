import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_page_1/views/login.dart';

class Apiservice {
  late Dio _dio;
  final _storageService = GetStorage();

  Apiservice() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "http://10.0.2.2:8000/api/v1",
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        sendTimeout: Duration(seconds: 30),
        headers: {"Accept": "application/json"},
      ),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add token to headers if available
          final token = _storageService.read("auth_token");
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (error, handler) {
          // Handle 401 unauthorized
          if (error.response?.statusCode == 401) {
            _storageService.remove("auth_token");
            _storageService.write("islogin", true);
            Get.offAll(() => Login());
          }
          return handler.next(error);
        },
      ),
    );
  }

  // GET request
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } catch (e) {
      rethrow;
    }
  }

  // POST request
  Future post(String path, {dynamic data}) async {
    try {
      return await _dio.post(path, data: data);
    } catch (e) {
      rethrow;
    }
  }
}
