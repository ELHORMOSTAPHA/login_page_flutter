import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:login_page_1/services/apiservice.dart';

class Homecontroller extends GetxController {
  final api = Apiservice();
  Future search(String value) async {
    try {
      final response = await api.post("/product/find", data: {"value": value});
      print(response);
    } on DioException catch (e) {
      print("${e.response}");
    }
  }
}
