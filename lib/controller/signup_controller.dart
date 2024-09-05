import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/models/sign_up.dart';
import 'package:shopping_app/route/app_route.dart';
import 'package:shopping_app/services/api_signup.dart';  // Thay đổi import để sử dụng ApiService

class SignUpController extends GetxController {
  final GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();
  var enteredUsername = ''.obs;
  var enteredEmail = ''.obs;
  var enteredPhoneNumber = ''.obs;
  var enteredPassword = ''.obs;
  var isSecurePass = true.obs;

  // Instance của ApiService
  final ApiSignUp _apiSignUp = Get.find<ApiSignUp>();

  // Chuyển icon mật khẩu
  void togglePasswordVisibility() {
    isSecurePass.value = !isSecurePass.value;
  }

  // Call API
  Future<void> signUp() async {
    final isValid = formKeySignUp.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKeySignUp.currentState!.save();

    final signUpData = SignUpModel(
        username: enteredUsername.value,
        phone: enteredPhoneNumber.value,
        email: enteredEmail.value,
        password: enteredPassword.value);

    try {
      final response = await _apiSignUp.signUp(signUpData);

      if (response.statusCode == 201) {
        // Đăng ký thành công, chuyển đến màn hình đăng nhập
        Get.offAllNamed(AppRoute.logIn);
      } else {
        // Xử lý lỗi từ server
        final responseData = response.body;
        Get.snackbar("Lỗi", responseData['message'] ?? 'Có lỗi xảy ra');
      }
    } catch (e) {
      // Xử lý lỗi khi gọi API
      Get.snackbar(
        "Lỗi",
        "Đã xảy ra lỗi khi thực hiện yêu cầu: $e",
      );
      print('Có lỗi xảy ra: $e');
    }
  }
}
