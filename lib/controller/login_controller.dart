import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/route/app_route.dart';
import 'package:shopping_app/services/api_logIn.dart';


class LogInController extends GetxController {
  final GlobalKey<FormState> formKeyLogIn = GlobalKey<FormState>();
  var enteredEmail = ''.obs;
  var enteredPassword = ''.obs;
  RxBool isSecurePass = true.obs;

  // Tạo instance của ApiService
  final ApiLogIn _apiLogIn = ApiLogIn();

  // Chuyển icon mật khẩu
  void togglePasswordVisibility() {
    isSecurePass.value = !isSecurePass.value;
  }

  Future<void> logIn() async {
    if (!formKeyLogIn.currentState!.validate()) {
      return;
    }
    formKeyLogIn.currentState!.save();


    try {
      final response = await _apiLogIn.login(
        enteredEmail.value,
        enteredPassword.value,
      );

      if (response.statusCode == 200) {
        // Lưu JWT vào SharedPreferences
        final token = response.body['access_token'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwt_token', token);
        print(token);
        // Điều hướng đến dashboard
        Get.toNamed(AppRoute.dashBoard);
      } else {
        final responseData = response.body;
        String message = responseData['message'] ?? 'Đã xảy ra lỗi';
        Get.snackbar("Lỗi", message);
      }
    } catch (e) {
      Get.snackbar(
        "Lỗi",
        "Đã xảy ra lỗi, vui lòng kiểm tra kết nối mạng và thử lại.",
      );
      print('Có lỗi xảy ra: $e');
    }
  }
}
