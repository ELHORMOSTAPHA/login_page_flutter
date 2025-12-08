import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_page_1/services/apiservice.dart';
import 'package:login_page_1/views/home.dart';

class Authcontroller extends GetxController {
  final isLoading = false.obs;
  final api = Apiservice();
  final token = ''.obs;
  final box = GetStorage();

  Future login({required String email, required String password}) async {
    try {
      isLoading.value = true;
      final response = await api.post(
        "/auth/login",
        data: {"email": email, "password": password},
      );
      isLoading.value = false;
      token.value = response.data["auth_token"];
      box.write("auth_token", token.value);
      box.write("islogin", true);
      Get.offAll(() => Home());
    } on DioException catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "Error",
        e.response!.data["message"],
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future register({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      final response = await api.post(
        '/auth/signup',
        data: {"name": name, "email": email, "password": password},
      );
      isLoading.value = false;
      token.value = response.data["auth_token"];

      box.write("auth_token", token.value);

      box.write("islogin", true);

      Get.offAll(() => Home());
    } on DioException catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "Error",
        e.response!.data["message"],
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
