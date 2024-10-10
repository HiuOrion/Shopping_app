import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/models/account.dart';
import 'package:shopping_app/route/app_route.dart';
import 'package:shopping_app/services/api_account.dart';

class AccountController extends GetxController {
  var account = Rxn<Account>();
  var isLoadingAccount = false.obs;
  final ApiAccount apiAccount = ApiAccount();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAccount();
  }

  Future<void> fetchAccount() async {
    try {
      isLoadingAccount(true);

      final prejs = await SharedPreferences.getInstance();
      var jwtToken = prejs.getString('jwt_token');
      var result = await apiAccount.fetchAccount(jwtToken!);
      if (result.statusCode == 200) {
        account.value = Account.accountFromJson(result.body['data']);
      }
      // print("thong tin : ${result.body['data']}");
    } catch (e) {
      Get.snackbar('Lỗi', "Không thể lấy dữ liệu",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }finally{
      isLoadingAccount(false);
    }
  }

  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('jwt_token');

      if (token != null) {
        var result = await apiAccount.logout(token);

        if (result.statusCode == 200) {
          // Xóa token khỏi SharedPreferences
          await prefs.remove('jwt_token');
          print(result.body['message']);

          // Điều hướng người dùng về màn hình đăng nhập
          Get.offAllNamed(AppRoute.logIn);

        }
      }
    } catch (e) {
      Get.snackbar('Lỗi', 'Có lỗi xảy ra. Vui lòng thử lại sau.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
